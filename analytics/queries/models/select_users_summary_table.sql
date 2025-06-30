-- Select Users Summary Table
-- Simple user model with subscription and trial details for future analysis

WITH user_subscriptions AS (
    -- Get all Select subscriptions with user details
    SELECT 
        u.id as user_id,
        c.id as stripe_customer_id,
        u.email,
        c.created as customer_created_at,
        DATE_FORMAT(c.created, 'yyyy-MM') as customer_creation_cohort,
        
        s.id as subscription_id,
        s.created as subscription_created_at,
        s.status as subscription_status,
        s.trial_start,
        s.trial_end,
        
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval,
        
        -- Plan type
        CASE 
            WHEN p.unit_amount = 0 THEN 'Free'
            WHEN p.unit_amount > 0 THEN 'Paid'
            ELSE 'Unknown'
        END as plan_type,
        
        -- Trial status
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Active'
        END as trial_status,
        
        -- Trial duration
        CASE 
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NOT NULL 
            THEN DATEDIFF(s.trial_end, s.trial_start)
            ELSE NULL
        END as trial_duration_days,
        
        ROW_NUMBER() OVER (PARTITION BY u.id ORDER BY s.created DESC) as subscription_rank
        
    FROM narrative.core.users u
    LEFT JOIN narrative.stripe.customers c ON u.email = c.email
    LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product only
        AND c.created >= '2024-01-01'  -- Recent customers only
)

SELECT 
    user_id,
    stripe_customer_id,
    email,
    customer_created_at,
    customer_creation_cohort,
    
    -- Current subscription (most recent)
    subscription_id as current_subscription_id,
    subscription_created_at as current_subscription_created,
    subscription_status as current_subscription_status,
    plan_nickname as current_plan_nickname,
    plan_price_usd as current_plan_price_usd,
    recurring_interval as current_recurring_interval,
    plan_type as current_plan_type,
    
    -- Current trial info
    trial_start as current_trial_start,
    trial_end as current_trial_end,
    trial_status as current_trial_status,
    trial_duration_days as current_trial_duration_days,
    
    -- Calculated fields
    DATEDIFF(CURRENT_DATE, customer_created_at) as customer_age_days,
    
    CASE 
        WHEN trial_start IS NOT NULL AND trial_end < CURRENT_DATE 
        THEN DATEDIFF(CURRENT_DATE, trial_end)
        ELSE NULL
    END as days_since_trial_ended,
    
    -- User classification
    CASE 
        WHEN subscription_status = 'active' AND plan_type = 'Paid' THEN 'Active Paid Customer'
        WHEN subscription_status = 'active' AND plan_type = 'Free' THEN 'Active Free Customer'
        WHEN subscription_status = 'trialing' THEN 'Active Trial User'
        WHEN subscription_status = 'canceled' THEN 'Canceled Customer'
        WHEN subscription_status IN ('incomplete_expired', 'past_due', 'unpaid') THEN 'Payment Issue'
        WHEN subscription_status = 'paused' THEN 'Paused Customer'
        ELSE 'Other Status'
    END as user_category,
    
    CURRENT_TIMESTAMP as record_updated_at

FROM user_subscriptions
WHERE subscription_rank = 1  -- Only most recent subscription per customer
ORDER BY customer_created_at DESC