-- Select Users Comprehensive Model
-- Creates a complete user profile with subscription, trial, and engagement data
-- Useful for cohort analysis, conversion tracking, and user journey analysis

WITH user_base AS (
    -- Get all users with basic information
    SELECT 
        u.id as user_id,
        u.email,
        u.created as user_created_at,
        DATE_FORMAT(u.created, 'yyyy-MM') as user_creation_cohort,
        DATEDIFF(CURRENT_DATE, u.created) as user_age_days
    FROM narrative.core.users u
    WHERE u.created >= '2024-01-01'  -- Focus on recent users
),

stripe_customer_mapping AS (
    -- Link users to Stripe customers
    SELECT 
        ub.user_id,
        ub.email,
        ub.user_created_at,
        ub.user_creation_cohort,
        ub.user_age_days,
        c.id as stripe_customer_id,
        c.created as stripe_customer_created_at
    FROM user_base ub
    LEFT JOIN narrative.stripe.customers c ON ub.email = c.email
),

current_subscriptions AS (
    -- Get current subscription status for each user
    SELECT 
        scm.user_id,
        scm.stripe_customer_id,
        s.id as current_subscription_id,
        s.created as current_subscription_created_at,
        s.status as current_subscription_status,
        s.trial_start as current_trial_start,
        s.trial_end as current_trial_end,
        p.nickname as current_plan_nickname,
        p.unit_amount / 100.0 as current_plan_price_usd,
        p.recurring_interval as current_plan_interval,
        
        -- Trial status classification
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Status Unknown'
        END as current_trial_status,
        
        -- Trial duration calculations
        CASE 
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NOT NULL 
            THEN DATEDIFF(s.trial_end, s.trial_start)
            ELSE NULL
        END as trial_duration_days,
        
        -- Days since trial ended
        CASE 
            WHEN s.trial_end < CURRENT_DATE 
            THEN DATEDIFF(CURRENT_DATE, s.trial_end)
            ELSE NULL
        END as days_since_trial_ended,
        
        -- Plan type classification
        CASE 
            WHEN p.unit_amount = 0 THEN 'Free Plan'
            WHEN p.unit_amount > 0 THEN 'Paid Plan'
            ELSE 'No Plan'
        END as current_plan_type,
        
        ROW_NUMBER() OVER (
            PARTITION BY scm.user_id 
            ORDER BY s.created DESC
        ) as subscription_rank
        
    FROM stripe_customer_mapping scm
    LEFT JOIN narrative.stripe.subscriptions s ON scm.stripe_customer_id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J' OR p.product_id IS NULL  -- Select product or no subscription
),

subscription_history AS (
    -- Get subscription history summary for each user
    SELECT 
        user_id,
        COUNT(DISTINCT current_subscription_id) as total_subscriptions_count,
        MIN(current_subscription_created_at) as first_subscription_created,
        MAX(current_subscription_created_at) as latest_subscription_created,
        
        -- Trial history
        COUNT(DISTINCT CASE WHEN current_trial_start IS NOT NULL THEN current_subscription_id END) as total_trials_count,
        MIN(current_trial_start) as first_trial_start,
        MAX(current_trial_start) as latest_trial_start,
        
        -- Plan type history
        COUNT(DISTINCT CASE WHEN current_plan_type = 'Paid Plan' THEN current_subscription_id END) as paid_subscriptions_count,
        COUNT(DISTINCT CASE WHEN current_plan_type = 'Free Plan' THEN current_subscription_id END) as free_subscriptions_count,
        
        -- Status history
        COUNT(DISTINCT CASE WHEN current_subscription_status = 'active' THEN current_subscription_id END) as active_subscriptions_count,
        COUNT(DISTINCT CASE WHEN current_subscription_status = 'canceled' THEN current_subscription_id END) as canceled_subscriptions_count
        
    FROM current_subscriptions
    GROUP BY user_id
),

paywall_engagement_raw AS (
    -- Get paywall interaction history with ranking
    SELECT 
        user_id,
        inserted_at,
        data:product_status::string as product_status,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY inserted_at DESC) as rn
    FROM select_events
    WHERE topic = 'select_paywall_locked_no_active_plan'
        AND inserted_at >= '2025-05-01'
),
paywall_engagement AS (
    -- Aggregate paywall data
    SELECT 
        user_id,
        COUNT(*) as total_paywall_views,
        MIN(inserted_at) as first_paywall_seen,
        MAX(inserted_at) as latest_paywall_seen,
        MAX(CASE WHEN rn = 1 THEN product_status END) as latest_product_status_at_paywall
    FROM paywall_engagement_raw
    GROUP BY user_id
),

upgrade_modal_engagement AS (
    -- Get upgrade modal interaction history
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

-- Final comprehensive user model
SELECT 
    -- User identity and creation info
    scm.user_id,
    scm.email,
    scm.user_created_at,
    scm.user_creation_cohort,
    scm.user_age_days,
    scm.stripe_customer_id,
    scm.stripe_customer_created_at,
    
    -- Current subscription details (most recent)
    cs.current_subscription_id,
    cs.current_subscription_created_at,
    cs.current_subscription_status,
    cs.current_plan_nickname,
    cs.current_plan_price_usd,
    cs.current_plan_interval,
    cs.current_plan_type,
    
    -- Current trial information
    cs.current_trial_start,
    cs.current_trial_end,
    cs.current_trial_status,
    cs.trial_duration_days,
    cs.days_since_trial_ended,
    
    -- Subscription history summary
    COALESCE(sh.total_subscriptions_count, 0) as total_subscriptions_count,
    sh.first_subscription_created,
    sh.latest_subscription_created,
    COALESCE(sh.total_trials_count, 0) as total_trials_count,
    sh.first_trial_start,
    sh.latest_trial_start,
    COALESCE(sh.paid_subscriptions_count, 0) as paid_subscriptions_count,
    COALESCE(sh.free_subscriptions_count, 0) as free_subscriptions_count,
    COALESCE(sh.active_subscriptions_count, 0) as active_subscriptions_count,
    COALESCE(sh.canceled_subscriptions_count, 0) as canceled_subscriptions_count,
    
    -- Paywall engagement
    COALESCE(pe.total_paywall_views, 0) as total_paywall_views,
    pe.first_paywall_seen,
    pe.latest_paywall_seen,
    pe.latest_product_status_at_paywall,
    
    -- Upgrade modal engagement
    COALESCE(ume.total_upgrade_modal_opens, 0) as total_upgrade_modal_opens,
    ume.first_upgrade_modal_opened,
    ume.latest_upgrade_modal_opened,
    
    -- User journey classifications
    CASE 
        WHEN cs.current_subscription_status = 'active' AND cs.current_plan_type = 'Paid Plan' THEN 'Active Paid Customer'
        WHEN cs.current_subscription_status = 'active' AND cs.current_plan_type = 'Free Plan' THEN 'Active Free Customer'
        WHEN cs.current_subscription_status = 'trialing' THEN 'Active Trial User'
        WHEN cs.current_subscription_status = 'canceled' THEN 'Canceled Customer'
        WHEN cs.current_subscription_status IN ('incomplete_expired', 'past_due', 'unpaid') THEN 'Failed Payment Customer'
        WHEN cs.current_subscription_status = 'paused' THEN 'Paused Customer'
        WHEN scm.stripe_customer_id IS NULL THEN 'No Stripe Customer'
        ELSE 'Other Status'
    END as user_status_category,
    
    -- Engagement flags
    CASE WHEN pe.total_paywall_views > 0 THEN TRUE ELSE FALSE END as has_seen_paywall,
    CASE WHEN ume.total_upgrade_modal_opens > 0 THEN TRUE ELSE FALSE END as has_opened_upgrade_modal,
    CASE WHEN sh.total_trials_count > 0 THEN TRUE ELSE FALSE END as has_had_trial,
    CASE WHEN sh.paid_subscriptions_count > 0 THEN TRUE ELSE FALSE END as has_had_paid_subscription,
    
    -- Recent activity flags (last 30 days)
    CASE WHEN pe.latest_paywall_seen >= CURRENT_DATE - INTERVAL '30 days' THEN TRUE ELSE FALSE END as paywall_view_last_30_days,
    CASE WHEN ume.latest_upgrade_modal_opened >= CURRENT_DATE - INTERVAL '30 days' THEN TRUE ELSE FALSE END as upgrade_modal_last_30_days,
    CASE WHEN cs.current_trial_start >= CURRENT_DATE - INTERVAL '30 days' THEN TRUE ELSE FALSE END as trial_started_last_30_days,
    
    -- Data freshness
    CURRENT_TIMESTAMP as model_updated_at

FROM stripe_customer_mapping scm
LEFT JOIN current_subscriptions cs ON scm.user_id = cs.user_id AND cs.subscription_rank = 1
LEFT JOIN subscription_history sh ON scm.user_id = sh.user_id
LEFT JOIN paywall_engagement pe ON scm.user_id = pe.user_id
LEFT JOIN upgrade_modal_engagement ume ON scm.user_id = ume.user_id

ORDER BY scm.user_created_at DESC