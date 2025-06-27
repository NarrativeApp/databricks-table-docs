-- ANA-57: Detailed Trial Upgrade Plans by Customer Cohort for Narrative Select Product
-- Shows specific upgrade plans chosen by customers who completed trials

WITH select_completed_trials AS (
    SELECT 
        s.id as subscription_id,
        s.customer_id,
        s.trial_start,
        s.trial_end,
        s.status,
        s.created as subscription_created,
        c.created as customer_created,
        p.id as price_id,
        p.nickname as price_name,
        p.unit_amount / 100.0 as price_usd,
        p.recurring_interval
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Only subscriptions that had trials
        AND s.trial_start > '2025-05-01'  -- Filter for recent trials
        AND c.created > '2025-05-01'  -- Filter for recent customers
        AND MONTH(c.created) = MONTH(s.trial_start)  -- Customer created same month as trial start
        AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE  -- Trial period has ended
        AND s.status != 'trialing'  -- Not currently trialing
        AND s.status = 'active'  -- Currently active (converted)
        AND p.unit_amount > 0  -- Only paid plans (upgraded)
),
upgrade_summary AS (
    SELECT 
        DATE_FORMAT(customer_created, 'yyyy-MM') as creation_month,
        price_name,
        price_usd,
        recurring_interval,
        COUNT(*) as upgrade_count,
        ROUND(AVG(
            CASE 
                WHEN status IN ('trialing', 'canceled') THEN DATEDIFF(CURRENT_DATE, DATE(trial_start))
                ELSE DATEDIFF(DATE(trial_end), DATE(trial_start))
            END
        ), 1) as avg_trial_days,
        MIN(customer_created) as earliest_customer,
        MAX(customer_created) as latest_customer
    FROM select_completed_trials
    WHERE customer_created >= '2025-01-01'  -- Focus on recent cohorts matching trial filter
    GROUP BY 
        DATE_FORMAT(customer_created, 'yyyy-MM'),
        price_name,
        price_usd,
        recurring_interval
)
SELECT 
    creation_month,
    price_name as upgrade_plan,
    price_usd,
    recurring_interval,
    upgrade_count,
    avg_trial_days,
    -- Calculate percentage within each cohort month
    ROUND(upgrade_count * 100.0 / SUM(upgrade_count) OVER (PARTITION BY creation_month), 2) as pct_of_cohort_upgrades
FROM upgrade_summary
ORDER BY creation_month DESC, upgrade_count DESC