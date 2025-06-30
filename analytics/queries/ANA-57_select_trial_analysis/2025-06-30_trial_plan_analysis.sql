-- Analysis of users on plans with "Trial" in the name
-- Shows trial duration and customer creation date for these specific plans

WITH trial_plan_users AS (
    SELECT 
        c.id as customer_id,
        c.email,
        c.created as customer_created_at,
        DATE(c.created) as customer_created_date,
        s.id as subscription_id,
        s.trial_start,
        s.trial_end,
        s.status as subscription_status,
        s.created as subscription_created_at,
        p.nickname as plan_name,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval,
        
        -- Calculate trial days
        CASE 
            WHEN s.trial_end IS NOT NULL THEN DATEDIFF(s.trial_end, s.trial_start)
            WHEN s.trial_start IS NOT NULL AND s.status = 'trialing' THEN DATEDIFF(CURRENT_DATE, s.trial_start)
            WHEN s.trial_start IS NOT NULL THEN 30  -- Default for trials without explicit end
            ELSE NULL
        END as trial_days,
        
        -- Trial status
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Active'
        END as trial_status,
        
        -- Days since customer creation
        DATEDIFF(CURRENT_DATE, c.created) as days_since_customer_created,
        
        -- Row number to get most recent subscription per customer
        ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY s.created DESC) as subscription_rank
        
    FROM narrative.stripe.customers c
    JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND LOWER(p.nickname) LIKE '%trial%'  -- Plans with "Trial" in the name
        AND c.created >= '2025-01-01'  -- Recent customers
)

-- Summary results
SELECT 
    customer_id,
    email,
    customer_created_date,
    days_since_customer_created,
    plan_name,
    plan_price_usd,
    subscription_status,
    trial_status,
    trial_start,
    trial_end,
    trial_days,
    CASE 
        WHEN trial_days <= 7 THEN '0-7 days'
        WHEN trial_days <= 14 THEN '8-14 days'
        WHEN trial_days <= 21 THEN '15-21 days'
        WHEN trial_days <= 30 THEN '22-30 days'
        WHEN trial_days > 30 THEN '30+ days'
        ELSE 'No trial period'
    END as trial_duration_bucket,
    subscription_created_at,
    CASE 
        WHEN subscription_status = 'active' AND plan_price_usd > 0 THEN 'Active Paid'
        WHEN subscription_status = 'active' AND plan_price_usd = 0 THEN 'Active Free/Trial'
        WHEN subscription_status = 'trialing' THEN 'Currently Trialing'
        WHEN subscription_status = 'canceled' THEN 'Canceled'
        ELSE subscription_status
    END as customer_status
FROM trial_plan_users
WHERE subscription_rank = 1  -- Most recent subscription only
ORDER BY customer_created_date DESC, trial_days DESC