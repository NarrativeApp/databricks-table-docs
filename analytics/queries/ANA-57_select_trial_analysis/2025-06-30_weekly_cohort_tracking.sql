-- Lean Weekly-Cohort Tracking for Select Product
-- Single table for cohort analysis that can be extended later
-- Tracks trial starts, activations, weekly retention, and upgrades

WITH trial_cohorts AS (
    -- Get all trial starts with user mapping
    SELECT 
        u.id as user_id,
        c.id as customer_id,
        c.email,
        s.id as subscription_id,
        s.trial_start as trial_started_at,
        DATE_TRUNC('week', s.trial_start) as cohort_week,  -- ISO Monday
        s.trial_end,
        s.status as current_status,
        p.unit_amount / 100.0 as plan_price_usd,
        
        -- Trial status for filtering
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Active'
        END as trial_status
        
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    JOIN narrative.core.users u ON c.email = u.email
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL
        AND s.trial_start >= '2025-01-01'  -- Recent trials
        AND s.trial_start < DATE_TRUNC('week', CURRENT_DATE)  -- Complete weeks only
        and u.user_id > '2025-05-27'
),

activations AS (
    -- Get activation data from existing table
    SELECT 
        user_id,
        activated_at
    FROM select_activation
    WHERE user_id IN (SELECT DISTINCT user_id FROM trial_cohorts)
),

user_activity AS (
    -- Get user activity events for retention calculation
    SELECT
        user_id,
        inserted_at as event_time,
        topic,
        -- App engagement events
        CASE
            WHEN topic = 'select_image_viewed' THEN 1
            ELSE 0
        END as is_engagement_event,
        -- Paywall hit
        CASE
            WHEN topic = 'select_paywall_locked_no_active_plan' THEN 1
            ELSE 0
        END as hit_paywall
    FROM
        select_events
    WHERE
        user_id IN (SELECT DISTINCT user_id FROM trial_cohorts)
        AND inserted_at >= '2025-01-01'
)

cohort_metrics AS (
    SELECT 
        tc.cohort_week,
        tc.user_id,
        tc.trial_started_at,
        tc.current_status,
        tc.plan_price_usd,
        
        -- Activation (using existing select_activation table)
        CASE 
            WHEN act.activated_at IS NOT NULL 
                AND act.activated_at >= tc.trial_started_at 
                AND act.activated_at <= tc.trial_started_at + INTERVAL '30 days'
            THEN 1 ELSE 0 
        END as activated,
        
        -- Week 2 retention (days 7-13)
        MAX(CASE 
            WHEN ua.is_engagement_event = 1
                AND ua.event_time >= tc.trial_started_at + INTERVAL '7 days'
                AND ua.event_time < tc.trial_started_at + INTERVAL '14 days'
            THEN 1 ELSE 0
        END) as w2_active,
        
        -- Week 3 retention (days 14-20)
        MAX(CASE 
            WHEN ua.is_engagement_event = 1
                AND ua.event_time >= tc.trial_started_at + INTERVAL '14 days'
                AND ua.event_time < tc.trial_started_at + INTERVAL '21 days'
            THEN 1 ELSE 0
        END) as w3_active,
        
        -- Week 4 retention (days 21-27)
        MAX(CASE 
            WHEN ua.is_engagement_event = 1
                AND ua.event_time >= tc.trial_started_at + INTERVAL '21 days'
                AND ua.event_time < tc.trial_started_at + INTERVAL '28 days'
            THEN 1 ELSE 0
        END) as w4_active,
        
        -- Post-trial activity (after day 30)
        MAX(CASE 
            WHEN ua.is_engagement_event = 1
                AND ua.event_time >= tc.trial_started_at + INTERVAL '30 days'
            THEN 1 ELSE 0
        END) as post_trial_active,
        
        -- Paywall hit during trial
        MAX(CASE 
            WHEN ua.hit_paywall = 1
                AND ua.event_time >= tc.trial_started_at 
                AND ua.event_time <= tc.trial_started_at + INTERVAL '30 days'
            THEN 1 ELSE 0
        END) as hit_paywall_during_trial,
        
        -- Paywall hit post-trial
        MAX(CASE 
            WHEN ua.hit_paywall = 1
                AND ua.event_time > tc.trial_started_at + INTERVAL '30 days'
            THEN 1 ELSE 0
        END) as hit_paywall_post_trial,
        
        -- Upgrade to paid (anytime)
        CASE 
            WHEN tc.current_status = 'active' AND tc.plan_price_usd > 0 THEN 1
            ELSE 0
        END as upgraded
        
    FROM trial_cohorts tc
    LEFT JOIN activations act ON tc.user_id = act.user_id
    LEFT JOIN user_activity ua ON tc.user_id = ua.user_id
    GROUP BY 1, 2, 3, 4, 5, act.activated_at
)

-- Final cohort summary table
SELECT 
    cohort_week,
    COUNT(DISTINCT user_id) as trial_starts,
    COUNT(DISTINCT CASE WHEN activated = 1 THEN user_id END) as activations,
    COUNT(DISTINCT CASE WHEN w2_active = 1 THEN user_id END) as w2_active,
    COUNT(DISTINCT CASE WHEN w3_active = 1 THEN user_id END) as w3_active,
    COUNT(DISTINCT CASE WHEN w4_active = 1 THEN user_id END) as w4_active,
    COUNT(DISTINCT CASE WHEN post_trial_active = 1 THEN user_id END) as post_trial_active,
    COUNT(DISTINCT CASE WHEN hit_paywall_during_trial = 1 THEN user_id END) as hit_paywall_during_trial,
    COUNT(DISTINCT CASE WHEN hit_paywall_post_trial = 1 THEN user_id END) as hit_paywall_post_trial,
    COUNT(DISTINCT CASE WHEN upgraded = 1 THEN user_id END) as upgrades,
    
    -- Calculate rates inline (can also be done in BI tool)
    ROUND(COUNT(DISTINCT CASE WHEN activated = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as activation_rate,
    ROUND(COUNT(DISTINCT CASE WHEN w2_active = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as w2_retention_rate,
    ROUND(COUNT(DISTINCT CASE WHEN w3_active = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as w3_retention_rate,
    ROUND(COUNT(DISTINCT CASE WHEN w4_active = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as w4_retention_rate,
    ROUND(COUNT(DISTINCT CASE WHEN post_trial_active = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as post_trial_retention_rate,
    ROUND(COUNT(DISTINCT CASE WHEN hit_paywall_during_trial = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as paywall_hit_rate_during_trial,
    ROUND(COUNT(DISTINCT CASE WHEN hit_paywall_post_trial = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as paywall_hit_rate_post_trial,
    ROUND(COUNT(DISTINCT CASE WHEN upgraded = 1 THEN user_id END) * 100.0 / 
          NULLIF(COUNT(DISTINCT user_id), 0), 2) as upgrade_rate
    
FROM cohort_metrics
GROUP BY cohort_week
ORDER BY cohort_week DESC