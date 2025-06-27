-- ANA-57: Monthly Cohort Summary for Select Trial Users
-- Aggregates trial behavior by customer creation month

WITH select_trials AS (
    SELECT 
        s.id as subscription_id,
        s.customer_id,
        s.trial_start,
        s.trial_end,
        s.status,
        s.created as subscription_created,
        c.created as customer_created,
        p.nickname as price_name,
        p.unit_amount / 100.0 as price_usd,
        p.recurring_interval
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Only subscriptions that had trials
        AND s.status = 'trialing'  -- Currently in trial
),
cohort_summary AS (
    SELECT 
        DATE_FORMAT(customer_created, 'yyyy-MM') as creation_month,
        COUNT(*) as total_active_trials,
        COUNT(CASE WHEN price_usd > 0 THEN 1 END) as paid_tier_trials,
        COUNT(CASE WHEN price_usd = 0 THEN 1 END) as free_tier_trials,
        COUNT(CASE WHEN recurring_interval = 'month' THEN 1 END) as monthly_plan_trials,
        COUNT(CASE WHEN recurring_interval = 'year' THEN 1 END) as yearly_plan_trials,
        AVG(DATEDIFF(CURRENT_DATE, DATE(trial_start)) + 1) as avg_days_in_trial,
        MIN(DATEDIFF(CURRENT_DATE, DATE(trial_start)) + 1) as min_days_in_trial,
        MAX(DATEDIFF(CURRENT_DATE, DATE(trial_start)) + 1) as max_days_in_trial
    FROM select_trials
    GROUP BY DATE_FORMAT(customer_created, 'yyyy-MM')
)
SELECT 
    creation_month,
    total_active_trials,
    paid_tier_trials,
    free_tier_trials,
    ROUND(paid_tier_trials * 100.0 / total_active_trials, 2) as pct_paid_tier,
    monthly_plan_trials,
    yearly_plan_trials,
    ROUND(yearly_plan_trials * 100.0 / total_active_trials, 2) as pct_yearly_plans,
    ROUND(avg_days_in_trial, 1) as avg_days_in_trial,
    min_days_in_trial,
    max_days_in_trial
FROM cohort_summary
WHERE creation_month >= '2023-01'  -- Focus on recent cohorts
ORDER BY creation_month DESC