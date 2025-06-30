-- ANA-57: Select Trial Users ARPU Analysis (Based on example pattern)
-- Calculates ARPU for Select trial users using invoice line items approach

-- 1️⃣ Select trial customers from our established logic
WITH select_trial_customers AS (
    SELECT DISTINCT
        s.customer_id,
        c.created as customer_created_at,
        s.trial_start,
        s.trial_end,
        CASE
            WHEN s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Active Trial'
        END AS trial_status
    FROM narrative.stripe.subscriptions s
    JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    JOIN narrative.stripe.prices p ON si.price_id = p.id
    JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND s.trial_start IS NOT NULL  -- Had trials
        AND s.trial_start > '2025-05-01'  -- Recent trials only
        AND c.created > '2025-05-01'  -- Recent customers
        AND MONTH(c.created) = MONTH(s.trial_start)  -- Cohort alignment
),

-- 2️⃣ Every positive-amount, paid invoice-line for Select product from trial customers
select_trial_charges AS (
    SELECT
        i.id AS invoice_id,
        i.customer_id,
        i.date AS invoice_created,
        li.id AS line_item_id,
        li.amount AS line_amount_cents,
        COALESCE(li.price_id, si.price_id) AS price_id,
        stc.trial_start,
        stc.trial_status,
        stc.customer_created_at
    FROM narrative.stripe.invoices i
    JOIN narrative.stripe.invoice_line_items li ON li.invoice_id = i.id
    LEFT JOIN narrative.stripe.subscription_items si ON si.id = li.subscription_item_id
    JOIN narrative.stripe.prices p ON p.id = COALESCE(li.price_id, si.price_id)
    JOIN select_trial_customers stc ON stc.customer_id = i.customer_id
    WHERE i.amount_paid > 0
        AND li.amount > 0
        AND p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product
        AND i.date >= '2025-05-01'  -- Recent revenue only
        AND i.paid = true
        AND i.billing_reason = 'subscription_cycle'  -- Regular subscription billing
),

-- 3️⃣ Add plan details for trial customer charges
trial_plan_charges AS (
    SELECT 
        stc.*,
        p.nickname AS plan_nickname,
        p.unit_amount AS unit_price_cents,
        p.recurring_interval,
        i.amount_paid AS invoice_total_cents
    FROM select_trial_charges stc
    JOIN narrative.stripe.prices p ON p.id = stc.price_id
    JOIN narrative.stripe.invoices i ON i.id = stc.invoice_id
),

-- 4️⃣ Calculate monthly-normalized revenue for ARPU
normalized_trial_revenue AS (
    SELECT 
        customer_id,
        trial_status,
        DATE_FORMAT(customer_created_at, 'yyyy-MM') as customer_cohort,
        invoice_id,
        line_item_id,
        plan_nickname,
        recurring_interval,
        line_amount_cents / 100.0 AS line_amount,
        invoice_total_cents / 100.0 AS invoice_total,
        -- Normalize yearly plans to monthly for ARPU calculation
        CASE 
            WHEN recurring_interval = 'year' THEN (line_amount_cents / 100.0) / 12
            ELSE line_amount_cents / 100.0
        END AS monthly_normalized_revenue
    FROM trial_plan_charges
),

-- 5️⃣ Calculate ARPU metrics by trial status and cohort
trial_arpu_metrics AS (
    SELECT 
        customer_cohort,
        trial_status,
        COUNT(DISTINCT customer_id) as trial_customers_with_revenue,
        SUM(monthly_normalized_revenue) as total_monthly_normalized_revenue,
        AVG(monthly_normalized_revenue) as avg_monthly_revenue_per_transaction,
        SUM(monthly_normalized_revenue) / COUNT(DISTINCT customer_id) as trial_arpu_monthly_normalized,
        COUNT(DISTINCT invoice_id) as total_invoices,
        AVG(invoice_total) as avg_invoice_amount
    FROM normalized_trial_revenue
    GROUP BY customer_cohort, trial_status
),

-- 6️⃣ Get total trial customers per cohort for context
total_trial_customers AS (
    SELECT 
        DATE_FORMAT(customer_created_at, 'yyyy-MM') as customer_cohort,
        trial_status,
        COUNT(DISTINCT customer_id) as total_trial_customers
    FROM select_trial_customers
    GROUP BY DATE_FORMAT(customer_created_at, 'yyyy-MM'), trial_status
)

-- 7️⃣ Final results with revenue penetration rates
SELECT 
    tam.customer_cohort,
    tam.trial_status,
    ttc.total_trial_customers,
    tam.trial_customers_with_revenue,
    ROUND(tam.trial_customers_with_revenue * 100.0 / ttc.total_trial_customers, 2) as pct_trial_customers_generating_revenue,
    ROUND(tam.total_monthly_normalized_revenue, 2) as total_monthly_normalized_revenue_usd,
    ROUND(tam.trial_arpu_monthly_normalized, 2) as trial_arpu_monthly_normalized_usd,
    ROUND(tam.avg_monthly_revenue_per_transaction, 2) as avg_monthly_revenue_per_transaction_usd,
    tam.total_invoices,
    ROUND(tam.avg_invoice_amount, 2) as avg_invoice_amount_usd,
    -- Calculate blended ARPU across ALL trial customers (including non-paying)
    ROUND(tam.total_monthly_normalized_revenue / ttc.total_trial_customers, 2) as blended_trial_arpu_all_customers_usd
FROM trial_arpu_metrics tam
JOIN total_trial_customers ttc ON tam.customer_cohort = ttc.customer_cohort AND tam.trial_status = ttc.trial_status
ORDER BY tam.customer_cohort DESC, tam.trial_status