-- Paywall 7-Day Window Analysis
-- Analyzes user behavior in the 7 days before and after hitting the paywall

WITH paywall_events AS (
    -- Get all paywall hit events since May 2025
    SELECT 
        user_id,
        inserted_at as paywall_hit_time,
        data:product_status::string as product_status_at_paywall,
        meta_plan_name,
        DATE(inserted_at) as paywall_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY inserted_at) as paywall_hit_number
    FROM select_events 
    WHERE topic = 'select_paywall_locked_no_active_plan' 
        AND inserted_at > '2025-05-01'
),

user_trial_info AS (
    -- Get trial information for users who hit paywall
    SELECT DISTINCT
        u.id as user_id,
        c.id as customer_id,
        c.email,
        s.trial_start,
        s.trial_end,
        s.status as current_subscription_status,
        p.unit_amount / 100.0 as current_plan_price,
        -- Trial status
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Active'
        END as trial_status
    FROM paywall_events pe
    JOIN narrative.core.users u ON pe.user_id = u.id
    LEFT JOIN narrative.stripe.customers c ON u.email = c.email
    LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'
),

user_activity_window AS (
    -- Get all user activity in 7-day windows around paywall hits
    SELECT 
        pe.user_id,
        pe.paywall_hit_time,
        pe.paywall_date,
        pe.paywall_hit_number,
        pe.product_status_at_paywall,
        se.inserted_at as event_time,
        se.topic as event_topic,
        -- Categorize timing relative to paywall
        CASE 
            WHEN se.inserted_at < pe.paywall_hit_time 
                AND se.inserted_at >= pe.paywall_hit_time - INTERVAL '7 days' THEN 'Before (-7 to 0 days)'
            WHEN se.inserted_at >= pe.paywall_hit_time 
                AND se.inserted_at < pe.paywall_hit_time + INTERVAL '7 days' THEN 'After (0 to +7 days)'
            ELSE 'Outside Window'
        END as event_window,
        -- Days from paywall (negative = before, positive = after)
        ROUND(TIMESTAMPDIFF(HOUR, pe.paywall_hit_time, se.inserted_at) / 24.0, 1) as days_from_paywall
    FROM paywall_events pe
    JOIN select_events se ON pe.user_id = se.user_id
    WHERE se.inserted_at >= pe.paywall_hit_time - INTERVAL '7 days'
        AND se.inserted_at < pe.paywall_hit_time + INTERVAL '7 days'
        AND pe.paywall_hit_number = 1  -- Focus on first paywall hit
),

activity_summary AS (
    -- Summarize activity patterns
    SELECT 
        uaw.user_id,
        uaw.paywall_hit_time,
        uaw.paywall_date,
        uaw.product_status_at_paywall,
        uti.trial_status,
        uti.current_subscription_status,
        uti.current_plan_price,
        
        -- Activity before paywall
        COUNT(DISTINCT CASE WHEN event_window = 'Before (-7 to 0 days)' THEN DATE(event_time) END) as days_active_before,
        COUNT(CASE WHEN event_window = 'Before (-7 to 0 days)' THEN 1 END) as events_before_paywall,
        COUNT(CASE WHEN event_window = 'Before (-7 to 0 days)' AND event_topic = 'select_image_viewed' THEN 1 END) as images_viewed_before,
        
        -- Activity after paywall
        COUNT(DISTINCT CASE WHEN event_window = 'After (0 to +7 days)' THEN DATE(event_time) END) as days_active_after,
        COUNT(CASE WHEN event_window = 'After (0 to +7 days)' THEN 1 END) as events_after_paywall,
        COUNT(CASE WHEN event_window = 'After (0 to +7 days)' AND event_topic = 'select_image_viewed' THEN 1 END) as images_viewed_after,
        
        -- Key events
        MAX(CASE WHEN event_topic = 'select_post_upgrade_modal_opened' AND event_window = 'After (0 to +7 days)' THEN 1 ELSE 0 END) as opened_upgrade_modal,
        MAX(CASE WHEN event_topic = 'select_activation' AND event_window = 'After (0 to +7 days)' THEN 1 ELSE 0 END) as activated_after_paywall,
        
        -- Engagement change
        CASE 
            WHEN COUNT(CASE WHEN event_window = 'Before (-7 to 0 days)' THEN 1 END) = 0 THEN 'No Prior Activity'
            WHEN COUNT(CASE WHEN event_window = 'After (0 to +7 days)' THEN 1 END) = 0 THEN 'Dropped Off'
            WHEN COUNT(CASE WHEN event_window = 'After (0 to +7 days)' THEN 1 END) > COUNT(CASE WHEN event_window = 'Before (-7 to 0 days)' THEN 1 END) THEN 'Increased'
            WHEN COUNT(CASE WHEN event_window = 'After (0 to +7 days)' THEN 1 END) < COUNT(CASE WHEN event_window = 'Before (-7 to 0 days)' THEN 1 END) THEN 'Decreased'
            ELSE 'Maintained'
        END as engagement_change
        
    FROM user_activity_window uaw
    LEFT JOIN user_trial_info uti ON uaw.user_id = uti.user_id
    GROUP BY 1, 2, 3, 4, 5, 6, 7
)

-- Final results with conversion tracking
SELECT 
    paywall_date,
    product_status_at_paywall,
    trial_status,
    engagement_change,
    COUNT(DISTINCT user_id) as users,
    
    -- Activity metrics
    ROUND(AVG(days_active_before), 1) as avg_days_active_before,
    ROUND(AVG(events_before_paywall), 1) as avg_events_before,
    ROUND(AVG(days_active_after), 1) as avg_days_active_after,
    ROUND(AVG(events_after_paywall), 1) as avg_events_after,
    
    -- Conversion metrics
    SUM(opened_upgrade_modal) as users_opened_upgrade_modal,
    ROUND(SUM(opened_upgrade_modal) * 100.0 / COUNT(*), 2) as upgrade_modal_rate,
    SUM(CASE WHEN current_subscription_status = 'active' AND current_plan_price > 0 THEN 1 ELSE 0 END) as converted_to_paid,
    ROUND(SUM(CASE WHEN current_subscription_status = 'active' AND current_plan_price > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as paid_conversion_rate,
    
    -- Engagement patterns
    ROUND(AVG(images_viewed_before), 1) as avg_images_before,
    ROUND(AVG(images_viewed_after), 1) as avg_images_after,
    ROUND((AVG(images_viewed_after) - AVG(images_viewed_before)) / NULLIF(AVG(images_viewed_before), 0) * 100, 1) as image_view_change_pct

FROM activity_summary
GROUP BY 1, 2, 3, 4
ORDER BY paywall_date DESC, users DESC