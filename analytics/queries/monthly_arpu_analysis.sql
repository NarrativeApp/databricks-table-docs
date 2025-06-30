-- Monthly ARPU (Average Revenue Per User) Analysis
-- Calculates ARPU based on actual paid invoices

WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(i.date, 'yyyy-MM') as revenue_month,
        i.customer_id,
        SUM(i.amount_paid / 100.0) as customer_monthly_revenue
    FROM narrative.stripe.invoices i
    WHERE i.date >= '2024-01-01'  -- Last 18 months
        AND i.paid = true  -- Only paid invoices
        AND i.amount_paid > 0  -- Only invoices with actual revenue
        AND i.billing_reason = 'subscription_cycle'  -- Regular subscription billing
    GROUP BY 
        DATE_FORMAT(i.date, 'yyyy-MM'),
        i.customer_id
),
monthly_metrics AS (
    SELECT 
        revenue_month,
        COUNT(DISTINCT customer_id) as paying_customers,
        SUM(customer_monthly_revenue) as total_revenue,
        AVG(customer_monthly_revenue) as arpu,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY customer_monthly_revenue) as median_revenue_per_user,
        MIN(customer_monthly_revenue) as min_revenue_per_user,
        MAX(customer_monthly_revenue) as max_revenue_per_user,
        STDDEV(customer_monthly_revenue) as revenue_stddev
    FROM monthly_revenue
    GROUP BY revenue_month
)
SELECT 
    revenue_month,
    paying_customers,
    ROUND(total_revenue, 2) as total_revenue_usd,
    ROUND(arpu, 2) as arpu_usd,
    ROUND(median_revenue_per_user, 2) as median_revenue_per_user_usd,
    ROUND(min_revenue_per_user, 2) as min_revenue_per_user_usd,
    ROUND(max_revenue_per_user, 2) as max_revenue_per_user_usd,
    ROUND(revenue_stddev, 2) as revenue_stddev_usd,
    -- Month-over-month growth
    ROUND(
        (arpu - LAG(arpu) OVER (ORDER BY revenue_month)) / LAG(arpu) OVER (ORDER BY revenue_month) * 100, 2
    ) as arpu_mom_growth_pct,
    ROUND(
        (paying_customers - LAG(paying_customers) OVER (ORDER BY revenue_month)) / LAG(paying_customers) OVER (ORDER BY revenue_month) * 100, 2
    ) as customers_mom_growth_pct
FROM monthly_metrics
ORDER BY revenue_month DESC