-- ANA-57: Trial Upgrade Analysis by Customer Creation Cohort for Narrative Select Product
-- Shows upgrade patterns for customers who completed trials and converted to paid plans

WITH select_completed_trials AS (
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
        AND (s.trial_end < CURRENT_DATE AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE)  -- Trial has ended with 30-day buffer
        AND s.status != 'trialing'  -- Not currently trialing
        AND s.trial_start > '2025-05-01'  -- Filter for recent trials
        AND s.status = 'active'  -- Currently active (converted)
        AND p.unit_amount > 0  -- Only paid plans (upgraded)
),
cohort_upgrades AS (
    SELECT 
        customer_id,
        customer_created,
        DATE_FORMAT(customer_created, 'yyyy-MM') as creation_month,
        trial_start,
        trial_end,
        price_name,
        price_usd,
        recurring_interval,
        DATEDIFF(DATE(trial_end), DATE(trial_start)) as trial_length_days,
        -- Categorize upgrade plans
        CASE 
            WHEN price_usd >= 70 THEN 'Ultra ($70+)'
            WHEN price_usd >= 25 AND price_usd < 70 THEN 'Standard ($25-69)'
            WHEN price_usd > 0 AND price_usd < 25 THEN 'Basic ($1-24)'
            ELSE 'Other'
        END as upgrade_tier,
        -- Categorize by billing interval
        CASE 
            WHEN recurring_interval = 'month' THEN 'Monthly'
            WHEN recurring_interval = 'year' THEN 'Yearly'
            ELSE 'Other'
        END as billing_frequency
    FROM select_completed_trials
)
SELECT 
    creation_month,
    COUNT(*) as total_upgrades,
    
    -- Upgrade tier breakdown
    COUNT(CASE WHEN upgrade_tier = 'Ultra ($70+)' THEN 1 END) as ultra_upgrades,
    COUNT(CASE WHEN upgrade_tier = 'Standard ($25-69)' THEN 1 END) as standard_upgrades,
    COUNT(CASE WHEN upgrade_tier = 'Basic ($1-24)' THEN 1 END) as basic_upgrades,
    
    -- Billing frequency breakdown
    COUNT(CASE WHEN billing_frequency = 'Monthly' THEN 1 END) as monthly_upgrades,
    COUNT(CASE WHEN billing_frequency = 'Yearly' THEN 1 END) as yearly_upgrades,
    
    -- Percentages
    ROUND(COUNT(CASE WHEN upgrade_tier = 'Ultra ($70+)' THEN 1 END) * 100.0 / COUNT(*), 2) as pct_ultra,
    ROUND(COUNT(CASE WHEN upgrade_tier = 'Standard ($25-69)' THEN 1 END) * 100.0 / COUNT(*), 2) as pct_standard,
    ROUND(COUNT(CASE WHEN billing_frequency = 'Yearly' THEN 1 END) * 100.0 / COUNT(*), 2) as pct_yearly,
    
    -- Average metrics
    ROUND(AVG(price_usd), 2) as avg_upgrade_price,
    ROUND(AVG(trial_length_days), 1) as avg_trial_length,
    
    -- Most popular upgrade plans
    MODE() WITHIN GROUP (ORDER BY price_name) as most_popular_plan

FROM cohort_upgrades
WHERE creation_month >= '2025-01'  -- Focus on recent cohorts matching trial filter
GROUP BY creation_month
HAVING total_upgrades >= 1  -- Lower threshold since we're filtering to recent trials
ORDER BY creation_month DESC