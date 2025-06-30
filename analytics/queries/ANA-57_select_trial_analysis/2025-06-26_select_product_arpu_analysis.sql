-- ANA-57: Select Product ARPU Analysis
-- Calculates ARPU specifically for Select product customers

WITH select_monthly_revenue AS (
    SELECT 
        DATE_FORMAT(i.date, 'yyyy-MM') as revenue_month,
        i.customer_id,
        SUM(i.amount_paid / 100.0) as customer_monthly_revenue
    FROM narrative.stripe.invoices i
    JOIN narrative.stripe.subscriptions s ON i.subscription_id = s.id
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE i.date >= '2024-01-01'  -- Last 18 months
        AND i.paid = true  -- Only paid invoices
        AND i.amount_paid > 0  -- Only invoices with actual revenue
        AND i.billing_reason = 'subscription_cycle'  -- Regular subscription billing
        AND p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product only
    GROUP BY 
        DATE_FORMAT(i.date, 'yyyy-MM'),
        i.customer_id
),
select_monthly_metrics AS (
    SELECT 
        revenue_month,
        COUNT(DISTINCT customer_id) as paying_select_customers,
        SUM(customer_monthly_revenue) as total_select_revenue,
        AVG(customer_monthly_revenue) as select_arpu,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY customer_monthly_revenue) as median_revenue_per_user,
        MIN(customer_monthly_revenue) as min_revenue_per_user,
        MAX(customer_monthly_revenue) as max_revenue_per_user,
        STDDEV(customer_monthly_revenue) as revenue_stddev
    FROM select_monthly_revenue
    GROUP BY revenue_month
)
SELECT 
    revenue_month,
    paying_select_customers,
    ROUND(total_select_revenue, 2) as total_select_revenue_usd,
    ROUND(select_arpu, 2) as select_arpu_usd,
    ROUND(median_revenue_per_user, 2) as median_revenue_per_user_usd,
    ROUND(min_revenue_per_user, 2) as min_revenue_per_user_usd,
    ROUND(max_revenue_per_user, 2) as max_revenue_per_user_usd,
    ROUND(revenue_stddev, 2) as revenue_stddev_usd,
    -- Month-over-month growth
    ROUND(
        (select_arpu - LAG(select_arpu) OVER (ORDER BY revenue_month)) / LAG(select_arpu) OVER (ORDER BY revenue_month) * 100, 2
    ) as arpu_mom_growth_pct,
    ROUND(
        (paying_select_customers - LAG(paying_select_customers) OVER (ORDER BY revenue_month)) / LAG(paying_select_customers) OVER (ORDER BY revenue_month) * 100, 2
    ) as customers_mom_growth_pct
FROM select_monthly_metrics
ORDER BY revenue_month DESC