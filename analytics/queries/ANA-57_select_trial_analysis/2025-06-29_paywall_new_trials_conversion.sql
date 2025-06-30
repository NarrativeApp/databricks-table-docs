-- ANA-57: Paywall Conversion Analysis for New Trial Users Only
-- Focuses on users who saw paywall AND started trials after May 1, 2025

-- 1️⃣ Users who saw the paywall with product status breakdown
WITH paywall_users_raw AS (
    SELECT 
        user_id,
        inserted_at,
        data:product_status::string as product_status_at_time,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY inserted_at DESC) as rn
    FROM select_events
    WHERE topic = 'select_paywall_locked_no_active_plan'
        AND inserted_at >= '2025-05-01'
),
paywall_users AS (
    SELECT 
        user_id,
        MIN(inserted_at) as first_paywall_seen,
        MAX(inserted_at) as last_paywall_seen,
        COUNT(*) as total_paywall_views,
        MAX(CASE WHEN rn = 1 THEN product_status_at_time END) as latest_product_status_at_paywall
    FROM paywall_users_raw
    GROUP BY user_id
),

-- 2️⃣ Filter for users who also started NEW trials after May 1, 2025
new_trial_paywall_conversions AS (
    SELECT 
        pu.user_id,
        pu.first_paywall_seen,
        pu.latest_product_status_at_paywall,
        pu.total_paywall_views,
        
        -- Find Select subscriptions for these users with new trials
        s.id as subscription_id,
        s.customer_id,
        s.created as subscription_created,
        s.status as current_status,
        s.trial_start,
        s.trial_end,
        c.created as customer_created,
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval,
        
        -- Conversion timing analysis
        CASE 
            WHEN s.created > pu.first_paywall_seen THEN 'Post-Paywall Subscription'
            WHEN s.created <= pu.first_paywall_seen THEN 'Pre-Existing Subscription'
            ELSE 'No Subscription Found'
        END as conversion_timing,
        
        -- Time to conversion (in hours)
        CASE 
            WHEN s.created > pu.first_paywall_seen 
            THEN ROUND(TIMESTAMPDIFF(HOUR, pu.first_paywall_seen, s.created), 1)
            ELSE NULL
        END as hours_to_conversion
        
    FROM paywall_users pu
    LEFT JOIN narrative.core.users u ON pu.user_id = u.id
    LEFT JOIN narrative.stripe.customers c ON u.email = c.email
    LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE (p.product_id = 'prod_HE50j3A0xeeU2J' OR p.product_id IS NULL)  -- Select product or no subscription
        AND (s.trial_start > '2025-05-01' OR s.trial_start IS NULL)  -- Filter for recent trials only
        AND (c.created > '2025-05-01' OR c.created IS NULL)  -- Filter for recent customers only
),

-- 3️⃣ Summary by product status at paywall for new trial users
new_trial_conversion_summary AS (
    SELECT 
        COALESCE(latest_product_status_at_paywall, 'null/unknown') as product_status_at_paywall,
        COUNT(DISTINCT user_id) as total_users_who_saw_paywall,
        
        -- Conversion metrics
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Subscription' THEN user_id END) as users_converted_any_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Subscription' AND plan_price_usd > 0 THEN user_id END) as users_converted_paid_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Subscription' AND plan_price_usd = 0 THEN user_id END) as users_converted_free_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Pre-Existing Subscription' THEN user_id END) as users_with_existing_subscription,
        
        -- Engagement metrics
        ROUND(AVG(total_paywall_views), 1) as avg_paywall_views_per_user,
        ROUND(AVG(CASE WHEN conversion_timing = 'Post-Paywall Subscription' THEN hours_to_conversion END), 1) as avg_hours_to_conversion
        
    FROM new_trial_paywall_conversions
    GROUP BY COALESCE(latest_product_status_at_paywall, 'null/unknown')
),

-- 4️⃣ Calculate totals across all product statuses
total_summary AS (
    SELECT 
        'TOTAL - All Product Statuses' as product_status_at_paywall,
        SUM(total_users_who_saw_paywall) as total_users_who_saw_paywall,
        SUM(users_converted_any_plan) as users_converted_any_plan,
        SUM(users_converted_paid_plan) as users_converted_paid_plan,
        SUM(users_converted_free_plan) as users_converted_free_plan,
        SUM(users_with_existing_subscription) as users_with_existing_subscription,
        ROUND(AVG(avg_paywall_views_per_user), 1) as avg_paywall_views_per_user,
        ROUND(AVG(avg_hours_to_conversion), 1) as avg_hours_to_conversion
    FROM new_trial_conversion_summary
)

-- 5️⃣ Final results with conversion rates for individual statuses
SELECT 
    product_status_at_paywall,
    total_users_who_saw_paywall,
    users_converted_any_plan,
    users_converted_paid_plan,
    users_converted_free_plan,
    users_with_existing_subscription,
    avg_paywall_views_per_user,
    avg_hours_to_conversion,
    
    -- Conversion rate calculations
    ROUND(users_converted_any_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_any_plan_pct,
    ROUND(users_converted_paid_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_paid_plan_pct,
    ROUND(users_converted_free_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_free_plan_pct,
    
    -- Pre-existing subscription insights
    ROUND(users_with_existing_subscription * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as pre_existing_subscription_pct,
    
    -- Of those who converted, what percentage chose paid vs free
    ROUND(users_converted_paid_plan * 100.0 / NULLIF(users_converted_any_plan, 0), 2) as paid_pct_of_conversions

FROM new_trial_conversion_summary

UNION ALL

-- 6️⃣ Add total row
SELECT 
    product_status_at_paywall,
    total_users_who_saw_paywall,
    users_converted_any_plan,
    users_converted_paid_plan,
    users_converted_free_plan,
    users_with_existing_subscription,
    avg_paywall_views_per_user,
    avg_hours_to_conversion,
    
    -- Conversion rate calculations for totals
    ROUND(users_converted_any_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_any_plan_pct,
    ROUND(users_converted_paid_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_paid_plan_pct,
    ROUND(users_converted_free_plan * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as conversion_rate_free_plan_pct,
    
    -- Pre-existing subscription insights
    ROUND(users_with_existing_subscription * 100.0 / NULLIF(total_users_who_saw_paywall, 0), 2) as pre_existing_subscription_pct,
    
    -- Of those who converted, what percentage chose paid vs free
    ROUND(users_converted_paid_plan * 100.0 / NULLIF(users_converted_any_plan, 0), 2) as paid_pct_of_conversions

FROM total_summary

ORDER BY 
    CASE WHEN product_status_at_paywall = 'TOTAL - All Product Statuses' THEN 1 ELSE 0 END,
    total_users_who_saw_paywall DESC