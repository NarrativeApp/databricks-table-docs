-- Select Users Simple Model
-- Creates a user profile focused on subscription, trial, and engagement data
-- Based on verified table structures and column names

WITH user_stripe_mapping AS (
    -- Link select_events users to Stripe customers via email
    SELECT DISTINCT
        se.user_id,
        u.email,
        c.id as stripe_customer_id,
        c.created as customer_created_at,
        DATE_FORMAT(c.created, 'yyyy-MM') as customer_creation_cohort
    FROM select_events se
    JOIN narrative.core.users u ON se.user_id = u.id
    JOIN narrative.stripe.customers c ON u.email = c.email
    WHERE se.inserted_at >= '2025-05-01'  -- Focus on recent activity
),

current_subscriptions AS (
    -- Get current subscription status for each user
    SELECT 
        usm.user_id,
        usm.stripe_customer_id,
        usm.customer_created_at,
        usm.customer_creation_cohort,
        s.id as subscription_id,
        s.created as subscription_created_at,
        s.status as subscription_status,
        s.trial_start,
        s.trial_end,
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval as plan_interval,
        
        -- Trial status classification
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Status Unknown'
        END as trial_status,
        
        -- Plan type classification
        CASE 
            WHEN p.unit_amount = 0 THEN 'Free Plan'
            WHEN p.unit_amount > 0 THEN 'Paid Plan'
            ELSE 'No Plan'
        END as plan_type,
        
        ROW_NUMBER() OVER (
            PARTITION BY usm.user_id 
            ORDER BY s.created DESC
        ) as subscription_rank
        
    FROM user_stripe_mapping usm
    LEFT JOIN narrative.stripe.subscriptions s ON usm.stripe_customer_id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J' OR p.product_id IS NULL  -- Select product or no subscription
),

subscription_summary AS (
    -- Aggregate subscription history per user
    SELECT 
        user_id,
        COUNT(DISTINCT subscription_id) as total_subscriptions,
        COUNT(DISTINCT CASE WHEN trial_start IS NOT NULL THEN subscription_id END) as total_trials,
        COUNT(DISTINCT CASE WHEN plan_type = 'Paid Plan' THEN subscription_id END) as paid_subscriptions,
        COUNT(DISTINCT CASE WHEN subscription_status = 'active' THEN subscription_id END) as active_subscriptions,
        COUNT(DISTINCT CASE WHEN subscription_status = 'canceled' THEN subscription_id END) as canceled_subscriptions,
        MIN(subscription_created_at) as first_subscription_date,
        MIN(trial_start) as first_trial_date
    FROM current_subscriptions
    GROUP BY user_id
),

paywall_engagement AS (
    -- Get paywall interaction summary
    SELECT 
        user_id,
        COUNT(*) as paywall_views,
        MIN(inserted_at) as first_paywall_seen,
        MAX(inserted_at) as latest_paywall_seen,
        -- Get latest product status
        FIRST_VALUE(data:product_status::string) OVER (
            PARTITION BY user_id 
            ORDER BY inserted_at DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as latest_product_status
    FROM select_events
    WHERE topic = 'select_paywall_locked_no_active_plan'
        AND inserted_at >= '2025-05-01'
    GROUP BY user_id, data:product_status::string, inserted_at
),

paywall_summary AS (
    -- Aggregate paywall data per user
    SELECT 
        user_id,
        SUM(paywall_views) as total_paywall_views,
        MIN(first_paywall_seen) as first_paywall_seen,
        MAX(latest_paywall_seen) as latest_paywall_seen,
        MAX(latest_product_status) as latest_product_status_at_paywall
    FROM paywall_engagement
    GROUP BY user_id
),

upgrade_modal_engagement AS (
    -- Get upgrade modal interaction summary
    SELECT 
        user_id,
        COUNT(*) as total_upgrade_modal_opens,
        MIN(inserted_at) as first_upgrade_modal_opened,
        MAX(inserted_at) as latest_upgrade_modal_opened
    FROM select_events
    WHERE topic = 'select_post_upgrade_modal_opened'
        AND inserted_at >= '2025-05-01'
    GROUP BY user_id
)

-- Final user model
SELECT 
    -- User identity
    usm.user_id,
    usm.email,
    usm.stripe_customer_id,
    usm.customer_created_at,
    usm.customer_creation_cohort,
    
    -- Current subscription (most recent)
    cs.subscription_id as current_subscription_id,
    cs.subscription_created_at as current_subscription_created,
    cs.subscription_status as current_status,
    cs.plan_nickname as current_plan,
    cs.plan_price_usd as current_price,
    cs.plan_interval as current_interval,
    cs.plan_type as current_plan_type,
    cs.trial_start as current_trial_start,
    cs.trial_end as current_trial_end,
    cs.trial_status as current_trial_status,
    
    -- Subscription history
    COALESCE(ss.total_subscriptions, 0) as total_subscriptions,
    COALESCE(ss.total_trials, 0) as total_trials,
    COALESCE(ss.paid_subscriptions, 0) as paid_subscriptions,
    COALESCE(ss.active_subscriptions, 0) as active_subscriptions,
    COALESCE(ss.canceled_subscriptions, 0) as canceled_subscriptions,
    ss.first_subscription_date,
    ss.first_trial_date,
    
    -- Paywall engagement
    COALESCE(ps.total_paywall_views, 0) as total_paywall_views,
    ps.first_paywall_seen,
    ps.latest_paywall_seen,
    ps.latest_product_status_at_paywall,
    
    -- Upgrade modal engagement
    COALESCE(ume.total_upgrade_modal_opens, 0) as total_upgrade_modal_opens,
    ume.first_upgrade_modal_opened,
    ume.latest_upgrade_modal_opened,
    
    -- User status classification
    CASE 
        WHEN cs.subscription_status = 'active' AND cs.plan_type = 'Paid Plan' THEN 'Active Paid'
        WHEN cs.subscription_status = 'active' AND cs.plan_type = 'Free Plan' THEN 'Active Free'
        WHEN cs.subscription_status = 'trialing' THEN 'Active Trial'
        WHEN cs.subscription_status = 'canceled' THEN 'Canceled'
        WHEN cs.subscription_status IN ('incomplete_expired', 'past_due', 'unpaid') THEN 'Payment Failed'
        WHEN cs.subscription_status = 'paused' THEN 'Paused'
        WHEN usm.stripe_customer_id IS NULL THEN 'No Stripe Account'
        ELSE 'Other'
    END as user_status,
    
    -- Engagement flags
    CASE WHEN ps.total_paywall_views > 0 THEN TRUE ELSE FALSE END as has_seen_paywall,
    CASE WHEN ume.total_upgrade_modal_opens > 0 THEN TRUE ELSE FALSE END as has_opened_upgrade_modal,
    CASE WHEN ss.total_trials > 0 THEN TRUE ELSE FALSE END as has_had_trial,
    CASE WHEN ss.paid_subscriptions > 0 THEN TRUE ELSE FALSE END as has_had_paid_subscription,
    
    CURRENT_TIMESTAMP as model_updated_at

FROM user_stripe_mapping usm
LEFT JOIN current_subscriptions cs ON usm.user_id = cs.user_id AND cs.subscription_rank = 1
LEFT JOIN subscription_summary ss ON usm.user_id = ss.user_id
LEFT JOIN paywall_summary ps ON usm.user_id = ps.user_id
LEFT JOIN upgrade_modal_engagement ume ON usm.user_id = ume.user_id

ORDER BY usm.customer_created_at DESC