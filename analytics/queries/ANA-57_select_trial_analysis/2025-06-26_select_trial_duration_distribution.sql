-- ANA-57: Trial Duration Distribution for Narrative Select Product
-- Shows how many users are on each day of their trial (Day 1, Day 2, etc.)

WITH select_trials AS (
    SELECT 
        s.id as subscription_id,
        s.trial_start,
        s.trial_end,
        s.status,
        s.created,
        p.nickname as price_name,
        p.unit_amount / 100.0 as price_usd,
        p.recurring_interval
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Only subscriptions that had trials
        AND s.status = 'trialing'  -- Currently in trial
),
trial_days AS (
    SELECT 
        subscription_id,
        trial_start,
        trial_end,
        price_name,
        price_usd,
        recurring_interval,
        DATEDIFF(CURRENT_DATE, DATE(trial_start)) + 1 as days_in_trial,
        DATEDIFF(DATE(trial_end), DATE(trial_start)) as total_trial_days
    FROM select_trials
)
SELECT 
    days_in_trial as trial_day,
    COUNT(*) as user_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage_of_trials,
    -- Show breakdown by pricing tier for context
    COUNT(CASE WHEN price_usd > 0 THEN 1 END) as paid_tier_users,
    COUNT(CASE WHEN price_usd = 0 THEN 1 END) as free_tier_users
FROM trial_days
WHERE days_in_trial <= 35  -- Focus on first 35 days to avoid outliers
GROUP BY days_in_trial
ORDER BY days_in_trial