-- ANA-57: Trial Conversion Rate Analysis by Customer Creation Cohort for Narrative Select Product
-- Shows conversion rates from completed trials to any plan (free or paid)

WITH all_completed_trials AS (
    SELECT 
        s.id as subscription_id,
        s.customer_id,
        s.trial_start,
        s.trial_end,
        s.status,
        s.created as subscription_created,
        c.created as customer_created,
        p.nickname as price_name,
        p.unit_amount / 100.0 as price_usd,
        p.recurring_interval
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Only subscriptions that had trials
        AND (s.trial_end < CURRENT_DATE AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE)  -- Trial has ended with 30-day buffer
        AND s.status != 'trialing'  -- Not currently trialing
        AND s.trial_start > '2025-05-01'  -- Filter for recent trials
),
cohort_conversion_summary AS (
    SELECT 
        DATE_FORMAT(customer_created, 'yyyy-MM') as creation_month,
        COUNT(DISTINCT customer_id) as total_completed_trials,
        
        -- Count conversions by outcome
        COUNT(DISTINCT CASE WHEN status = 'active' THEN customer_id END) as converted_customers,
        COUNT(DISTINCT CASE WHEN status = 'active' AND price_usd > 0 THEN customer_id END) as paid_conversions,
        COUNT(DISTINCT CASE WHEN status = 'active' AND price_usd = 0 THEN customer_id END) as free_conversions,
        COUNT(DISTINCT CASE WHEN status IN ('canceled', 'unpaid', 'past_due', 'incomplete') THEN customer_id END) as failed_conversions,
        
        -- Calculate average trial length for completed trials
        ROUND(AVG(DATEDIFF(DATE(trial_end), DATE(trial_start))), 1) as avg_trial_length_days
    FROM all_completed_trials
    GROUP BY DATE_FORMAT(customer_created, 'yyyy-MM')
)
SELECT 
    creation_month,
    total_completed_trials,
    converted_customers,
    paid_conversions,
    free_conversions,
    failed_conversions,
    
    -- Conversion rates
    ROUND(converted_customers * 100.0 / total_completed_trials, 2) as overall_conversion_rate_pct,
    ROUND(paid_conversions * 100.0 / total_completed_trials, 2) as paid_conversion_rate_pct,
    ROUND(free_conversions * 100.0 / total_completed_trials, 2) as free_conversion_rate_pct,
    ROUND(failed_conversions * 100.0 / total_completed_trials, 2) as failure_rate_pct,
    
    -- Additional metrics
    ROUND(paid_conversions * 100.0 / NULLIF(converted_customers, 0), 2) as paid_pct_of_conversions,
    avg_trial_length_days

FROM cohort_conversion_summary
WHERE creation_month >= '2025-01'  -- Focus on recent cohorts matching trial filter
    AND total_completed_trials >= 1  -- Lower threshold since we're filtering to recent trials
ORDER BY creation_month DESC