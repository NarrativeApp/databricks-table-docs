-- ANA-57: Paywall Conversion Analysis
-- Analyzes users who saw the new paywall and their subsequent conversion behavior

-- 1️⃣ Users who saw the paywall
WITH paywall_users AS (
    SELECT DISTINCT
        user_id,
        MIN(inserted_at) as first_paywall_seen,
        MAX(inserted_at) as last_paywall_seen,
        COUNT(*) as paywall_views,
        data:product_status::string as product_status_at_paywall
    FROM select_events
    WHERE topic = 'select_paywall_locked_no_active_plan'
        AND inserted_at >= '2025-05-01'
    GROUP BY user_id, data:product_status::string
),

-- 2️⃣ Product status distribution at paywall
paywall_status_summary AS (
    SELECT 
        COALESCE(product_status_at_paywall, 'null/unknown') as product_status,
        COUNT(DISTINCT user_id) as unique_users,
        SUM(paywall_views) as total_paywall_views,
        AVG(paywall_views) as avg_views_per_user,
        MIN(first_paywall_seen) as earliest_paywall,
        MAX(last_paywall_seen) as latest_paywall
    FROM paywall_users
    GROUP BY COALESCE(product_status_at_paywall, 'null/unknown')
),

-- 3️⃣ User subscription status after seeing paywall (join with Stripe)
post_paywall_subscriptions AS (
    SELECT 
        pu.user_id,
        pu.first_paywall_seen,
        pu.product_status_at_paywall,
        pu.paywall_views,
        c.id as stripe_customer_id,
        c.created as stripe_customer_created,
        s.id as subscription_id,
        s.created as subscription_created,
        s.status as current_subscription_status,
        s.trial_start,
        s.trial_end,
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price,
        p.recurring_interval,
        -- Determine if subscription was created after paywall
        CASE 
            WHEN s.created > pu.first_paywall_seen THEN 'Post-Paywall Subscription'
            WHEN s.created <= pu.first_paywall_seen THEN 'Pre-Existing Subscription'
            ELSE 'No Subscription'
        END as subscription_timing
    FROM paywall_users pu
    LEFT JOIN narrative.core.users u ON pu.user_id = u.id
    LEFT JOIN narrative.stripe.customers c ON u.stripe_customer_id = c.id
    LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J' OR p.product_id IS NULL -- Select product or no subscription
),

-- 4️⃣ Conversion metrics by product status
conversion_by_status AS (
    SELECT 
        COALESCE(product_status_at_paywall, 'null/unknown') as product_status,
        COUNT(DISTINCT user_id) as total_users_who_saw_paywall,
        COUNT(DISTINCT CASE WHEN subscription_timing = 'Post-Paywall Subscription' THEN user_id END) as users_who_converted,
        COUNT(DISTINCT CASE WHEN subscription_timing = 'Post-Paywall Subscription' AND plan_price > 0 THEN user_id END) as users_who_converted_to_paid,
        COUNT(DISTINCT CASE WHEN subscription_timing = 'Pre-Existing Subscription' THEN user_id END) as users_with_existing_subscription,
        AVG(paywall_views) as avg_paywall_views_per_user
    FROM post_paywall_subscriptions
    GROUP BY COALESCE(product_status_at_paywall, 'null/unknown')
)

-- 5️⃣ Final conversion analysis
SELECT 
    product_status,
    total_users_who_saw_paywall,
    users_who_converted,
    users_who_converted_to_paid,
    users_with_existing_subscription,
    ROUND(avg_paywall_views_per_user, 2) as avg_paywall_views_per_user,
    -- Conversion rates
    ROUND(users_who_converted * 100.0 / total_users_who_saw_paywall, 2) as conversion_rate_any_plan_pct,
    ROUND(users_who_converted_to_paid * 100.0 / total_users_who_saw_paywall, 2) as conversion_rate_paid_plan_pct,
    -- Pre-existing subscription rate
    ROUND(users_with_existing_subscription * 100.0 / total_users_who_saw_paywall, 2) as pre_existing_subscription_rate_pct
FROM conversion_by_status
ORDER BY total_users_who_saw_paywall DESC