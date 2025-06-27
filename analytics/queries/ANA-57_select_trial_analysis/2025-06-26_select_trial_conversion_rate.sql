-- ANA-57: Trial to Paid Conversion Rate for Narrative Select Product
-- Shows what percentage of trial users convert to paid subscriptions

WITH select_trials AS (
    SELECT 
        s.id as subscription_id,
        s.trial_start,
        s.trial_end,
        s.status,
        s.created,
        s.current_period_start,
        s.current_period_end,
        s.canceled_at,
        s.ended_at,
        p.id as price_id,
        p.nickname as price_name,
        p.unit_amount / 100.0 as price_usd,
        p.recurring_interval
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Only subscriptions that had trials
        AND (s.trial_end < CURRENT_DATE AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE)  -- Trial has ended with 30-day buffer
        AND s.status != 'trialing'  -- Not currently trialing
        AND s.trial_start > '2025-05-01'  -- Filter for recent trials
),
conversion_status AS (
    SELECT 
        subscription_id,
        price_name,
        price_usd,
        recurring_interval,
        trial_start,
        trial_end,
        status,
        -- Determine if trial converted to paid
        CASE 
            WHEN status = 'active' AND price_usd > 0 THEN 'converted_to_paid'
            WHEN status = 'active' AND price_usd = 0 THEN 'converted_to_free'
            WHEN status IN ('canceled', 'unpaid', 'past_due') THEN 'canceled'
            WHEN status = 'incomplete' THEN 'incomplete'
            ELSE 'other'
        END as conversion_outcome,
        -- Additional context
        DATEDIFF(DATE(trial_end), DATE(trial_start)) as trial_length_days
    FROM select_trials
)
SELECT 
    -- Overall conversion metrics
    COUNT(*) as total_completed_trials,
    COUNT(CASE WHEN conversion_outcome = 'converted_to_paid' THEN 1 END) as converted_to_paid,
    COUNT(CASE WHEN conversion_outcome = 'converted_to_free' THEN 1 END) as converted_to_free,
    COUNT(CASE WHEN conversion_outcome = 'canceled' THEN 1 END) as canceled_trials,
    
    -- Conversion rates
    ROUND(
        COUNT(CASE WHEN conversion_outcome = 'converted_to_paid' THEN 1 END) * 100.0 / COUNT(*), 2
    ) as paid_conversion_rate_pct,
    
    ROUND(
        COUNT(CASE WHEN conversion_outcome IN ('converted_to_paid', 'converted_to_free') THEN 1 END) * 100.0 / COUNT(*), 2
    ) as overall_conversion_rate_pct,
    
    -- Breakdown by pricing tier
    ROUND(
        COUNT(CASE WHEN conversion_outcome = 'converted_to_paid' AND recurring_interval = 'month' THEN 1 END) * 100.0 / 
        NULLIF(COUNT(CASE WHEN recurring_interval = 'month' THEN 1 END), 0), 2
    ) as monthly_paid_conversion_pct,
    
    ROUND(
        COUNT(CASE WHEN conversion_outcome = 'converted_to_paid' AND recurring_interval = 'year' THEN 1 END) * 100.0 / 
        NULLIF(COUNT(CASE WHEN recurring_interval = 'year' THEN 1 END), 0), 2
    ) as yearly_paid_conversion_pct

FROM conversion_status