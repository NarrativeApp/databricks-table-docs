-- ANA-57: Comprehensive Select Product ARPU Analysis 
-- Includes both old and new plan structures for complete historical view

WITH select_charges AS (
    SELECT
        i.id AS invoice_id,
        i.customer_id,
        i.date AS invoice_created,
        li.id AS line_item_id,
        li.amount AS line_amount_cents,
        COALESCE(li.price_id, si.price_id) AS price_id
    FROM narrative.stripe.invoices i
    JOIN narrative.stripe.invoice_line_items li ON li.invoice_id = i.id
    LEFT JOIN narrative.stripe.subscription_items si ON si.id = li.subscription_item_id
    JOIN narrative.stripe.prices p ON p.id = COALESCE(li.price_id, si.price_id)
    WHERE i.amount_paid > 0
        AND li.amount > 0
        AND p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product ID
        AND i.date >= '2024-01-01'  -- Last 18 months
        AND i.paid = true
        AND i.billing_reason = 'subscription_cycle'  -- Regular billing
),

-- Add plan details and categorize paid vs free plans
plan_charges AS (
    SELECT 
        sc.*,
        p.nickname AS plan_nickname,
        p.unit_amount AS unit_price_cents,
        p.recurring_interval,
        i.amount_paid AS invoice_total_cents,
        CASE 
            WHEN p.unit_amount > 0 THEN 'Paid'
            ELSE 'Free'
        END AS plan_type
    FROM select_charges sc
    JOIN narrative.stripe.prices p ON p.id = sc.price_id
    JOIN narrative.stripe.invoices i ON i.id = sc.invoice_id
    WHERE p.unit_amount > 0  -- Only paid plans for ARPU calculation
),

-- Calculate monthly-normalized revenue 
monthly_normalized_revenue AS (
    SELECT 
        customer_id,
        invoice_id,
        line_item_id,
        plan_nickname,
        recurring_interval,
        invoice_created,
        DATE_FORMAT(invoice_created, 'yyyy-MM') as revenue_month,
        line_amount_cents / 100.0 AS line_amount,
        invoice_total_cents / 100.0 AS invoice_total,
        -- Normalize yearly plans to monthly for ARPU calculation
        CASE 
            WHEN recurring_interval = 'year' THEN (line_amount_cents / 100.0) / 12
            ELSE line_amount_cents / 100.0
        END AS monthly_normalized_revenue
    FROM plan_charges
),

-- Calculate ARPU metrics by month
monthly_arpu_metrics AS (
    SELECT 
        revenue_month,
        COUNT(DISTINCT customer_id) as paying_customers,
        SUM(monthly_normalized_revenue) as total_monthly_normalized_revenue,
        SUM(monthly_normalized_revenue) / COUNT(DISTINCT customer_id) as arpu_monthly_normalized,
        AVG(monthly_normalized_revenue) as avg_revenue_per_transaction,
        COUNT(DISTINCT invoice_id) as total_invoices,
        AVG(invoice_total) as avg_invoice_amount,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monthly_normalized_revenue) as median_revenue_per_transaction,
        MIN(monthly_normalized_revenue) as min_revenue_per_transaction,
        MAX(monthly_normalized_revenue) as max_revenue_per_transaction
    FROM monthly_normalized_revenue
    GROUP BY revenue_month
)

-- Final results with growth metrics
SELECT 
    revenue_month,
    paying_customers,
    ROUND(total_monthly_normalized_revenue, 2) as total_monthly_normalized_revenue_usd,
    ROUND(arpu_monthly_normalized, 2) as arpu_monthly_normalized_usd,
    ROUND(avg_revenue_per_transaction, 2) as avg_revenue_per_transaction_usd,
    ROUND(median_revenue_per_transaction, 2) as median_revenue_per_transaction_usd,
    ROUND(min_revenue_per_transaction, 2) as min_revenue_per_transaction_usd,
    ROUND(max_revenue_per_transaction, 2) as max_revenue_per_transaction_usd,
    total_invoices,
    ROUND(avg_invoice_amount, 2) as avg_invoice_amount_usd,
    -- Month-over-month growth
    ROUND(
        (arpu_monthly_normalized - LAG(arpu_monthly_normalized) OVER (ORDER BY revenue_month)) / 
        LAG(arpu_monthly_normalized) OVER (ORDER BY revenue_month) * 100, 2
    ) as arpu_mom_growth_pct,
    ROUND(
        (paying_customers - LAG(paying_customers) OVER (ORDER BY revenue_month)) / 
        LAG(paying_customers) OVER (ORDER BY revenue_month) * 100, 2
    ) as customers_mom_growth_pct
FROM monthly_arpu_metrics
ORDER BY revenue_month DESC