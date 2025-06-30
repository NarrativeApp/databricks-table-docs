-- ANA-57: ARPU Analysis for Select Trial Users
-- Calculates ARPU specifically for users who completed Select trials

WITH select_trial_customers AS (
    -- Get customers who had Select trials using our established logic
    SELECT DISTINCT
        s.customer_id,
        c.created as customer_created,
        DATE_FORMAT(c.created, 'yyyy-MM') as customer_cohort,
        s.trial_start,
        s.trial_end,
        s.status as subscription_status,
        p.unit_amount / 100.0 as plan_price,
        p.nickname as plan_name
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Had trials
        AND s.trial_start > '2025-05-01'  -- Recent trials
        AND c.created > '2025-05-01'  -- Recent customers
        AND MONTH(c.created) = MONTH(s.trial_start)  -- Cohort alignment
        AND (
            -- Include both completed and active trials for ARPU tracking
            (s.trial_start + INTERVAL '30 days' < CURRENT_DATE AND s.status != 'trialing') OR  -- Completed
            s.status = 'trialing'  -- Still active
        )
),
select_trial_revenue AS (
    -- Get revenue from invoices for these trial customers
    SELECT 
        stc.customer_id,
        stc.customer_cohort,
        stc.subscription_status,
        stc.plan_price,
        stc.plan_name,
        DATE_FORMAT(i.date, 'yyyy-MM') as revenue_month,
        SUM(i.amount_paid / 100.0) as monthly_revenue
    FROM select_trial_customers stc
    JOIN narrative.stripe.invoices i ON stc.customer_id = i.customer_id
    WHERE i.date >= '2025-05-01'  -- Recent revenue only
        AND i.paid = true
        AND i.amount_paid > 0
        AND i.billing_reason = 'subscription_cycle'
    GROUP BY 
        stc.customer_id, stc.customer_cohort, stc.subscription_status,
        stc.plan_price, stc.plan_name, DATE_FORMAT(i.date, 'yyyy-MM')
),
cohort_totals AS (
    SELECT 
        customer_cohort,
        COUNT(DISTINCT customer_id) as total_trial_customers_in_cohort
    FROM select_trial_customers
    GROUP BY customer_cohort
),
cohort_arpu_metrics AS (
    SELECT 
        str.customer_cohort,
        str.revenue_month,
        COUNT(DISTINCT str.customer_id) as paying_trial_users,
        SUM(str.monthly_revenue) as total_trial_revenue,
        AVG(str.monthly_revenue) as trial_arpu,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY str.monthly_revenue) as median_trial_revenue,
        ct.total_trial_customers_in_cohort
    FROM select_trial_revenue str
    JOIN cohort_totals ct ON str.customer_cohort = ct.customer_cohort
    GROUP BY str.customer_cohort, str.revenue_month, ct.total_trial_customers_in_cohort
)
SELECT 
    customer_cohort,
    revenue_month,
    total_trial_customers_in_cohort,
    paying_trial_users,
    ROUND(paying_trial_users * 100.0 / total_trial_customers_in_cohort, 2) as pct_trial_users_paying,
    ROUND(total_trial_revenue, 2) as total_trial_revenue_usd,
    ROUND(trial_arpu, 2) as trial_arpu_usd,
    ROUND(median_trial_revenue, 2) as median_trial_revenue_usd,
    -- Calculate ARPU across ALL trial users (including non-paying)
    ROUND(total_trial_revenue / total_trial_customers_in_cohort, 2) as blended_trial_arpu_usd
FROM cohort_arpu_metrics
ORDER BY customer_cohort DESC, revenue_month DESC