-- ANA-57: Paywall Conversion Analysis 
-- Tracks users who saw the new paywall and their subsequent subscription conversion

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

-- 2️⃣ Check if paywall users converted to Select subscriptions after seeing paywall
paywall_conversions AS (
    SELECT 
        pu.user_id,
        pu.first_paywall_seen,
        pu.latest_product_status_at_paywall,
        pu.total_paywall_views,
        
        -- Find any Select subscriptions created after they saw the paywall
        s.id as subscription_id,
        s.customer_id,
        s.created as subscription_created,
        s.status as current_status,
        s.trial_start,
        s.trial_end,
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval,
        
        -- Conversion timing analysis
        CASE 
            WHEN s.created > pu.first_paywall_seen THEN 'Post-Paywall Conversion'
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
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J' OR p.product_id IS NULL  -- Select product or no subscription
),

-- 3️⃣ Summary by product status at paywall
paywall_conversion_summary AS (
    SELECT 
        COALESCE(latest_product_status_at_paywall, 'null/unknown') as product_status_at_paywall,
        COUNT(DISTINCT user_id) as total_users_who_saw_paywall,
        
        -- Conversion metrics
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Conversion' THEN user_id END) as users_converted_any_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Conversion' AND plan_price_usd > 0 THEN user_id END) as users_converted_paid_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Post-Paywall Conversion' AND plan_price_usd = 0 THEN user_id END) as users_converted_free_plan,
        COUNT(DISTINCT CASE WHEN conversion_timing = 'Pre-Existing Subscription' THEN user_id END) as users_with_existing_subscription,
        
        -- Engagement metrics
        ROUND(AVG(total_paywall_views), 1) as avg_paywall_views_per_user,
        ROUND(AVG(CASE WHEN conversion_timing = 'Post-Paywall Conversion' THEN hours_to_conversion END), 1) as avg_hours_to_conversion
        
    FROM paywall_conversions
    GROUP BY COALESCE(latest_product_status_at_paywall, 'null/unknown')
)

-- 4️⃣ Final results with conversion rates
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
    ROUND(users_converted_any_plan * 100.0 / total_users_who_saw_paywall, 2) as conversion_rate_any_plan_pct,
    ROUND(users_converted_paid_plan * 100.0 / total_users_who_saw_paywall, 2) as conversion_rate_paid_plan_pct,
    ROUND(users_converted_free_plan * 100.0 / total_users_who_saw_paywall, 2) as conversion_rate_free_plan_pct,
    
    -- Pre-existing subscription insights
    ROUND(users_with_existing_subscription * 100.0 / total_users_who_saw_paywall, 2) as pre_existing_subscription_pct,
    
    -- Of those who converted, what percentage chose paid vs free
    ROUND(users_converted_paid_plan * 100.0 / NULLIF(users_converted_any_plan, 0), 2) as paid_pct_of_conversions

FROM paywall_conversion_summary
ORDER BY total_users_who_saw_paywall DESC