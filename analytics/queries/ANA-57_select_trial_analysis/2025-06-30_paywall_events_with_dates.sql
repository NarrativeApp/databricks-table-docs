-- Paywall Events with Dates - Detailed Analysis
-- Shows when users hit paywall events and upgrade modal conversions with specific dates

WITH  l as (-- Select Users Summary Table
-- Simple user model with subscription and trial details for future analysis

WITH user_subscriptions AS (
    -- Get all Select subscriptions with user details
    SELECT 
        u.id as user_id,
        c.id as stripe_customer_id,
        u.email,
        c.created as customer_created_at,
        DATE_FORMAT(c.created, 'yyyy-MM') as customer_creation_cohort,
        
        s.id as subscription_id,
        s.created as subscription_created_at,
        s.status as subscription_status,
        s.trial_start,
        s.trial_end,
        
        p.nickname as plan_nickname,
        p.unit_amount / 100.0 as plan_price_usd,
        p.recurring_interval,
        
        -- Plan type
        CASE 
            WHEN p.unit_amount = 0 THEN 'Free'
            WHEN p.unit_amount > 0 THEN 'Paid'
            ELSE 'Unknown'
        END as plan_type,
        
        -- Trial status
        CASE 
            WHEN s.trial_start IS NULL THEN 'No Trial'
            WHEN s.status = 'trialing' THEN 'Active Trial'
            WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
            ELSE 'Trial Active'
        END as trial_status,
        
        -- Trial duration
        CASE 
            WHEN s.trial_start IS NOT NULL AND s.trial_end IS NOT NULL 
            THEN DATEDIFF(s.trial_end, s.trial_start)
            ELSE NULL
        END as trial_duration_days,
        
        ROW_NUMBER() OVER (PARTITION BY u.id ORDER BY s.created DESC) as subscription_rank
        
    FROM narrative.core.users u
    LEFT JOIN narrative.stripe.customers c ON u.email = c.email
    LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
    LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
    LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE p.product_id = 'prod_HE50j3A0xeeU2J'  -- Select product only
        AND c.created >= '2024-01-01'  -- Recent customers only
)

SELECT 
    user_id,
    stripe_customer_id,
    email,
    customer_created_at,
    customer_creation_cohort,
    
    -- Current subscription (most recent)
    subscription_id as current_subscription_id,
    subscription_created_at as current_subscription_created,
    subscription_status as current_subscription_status,
    plan_nickname as current_plan_nickname,
    plan_price_usd as current_plan_price_usd,
    recurring_interval as current_recurring_interval,
    plan_type as current_plan_type,
    
    -- Current trial info
    trial_start as current_trial_start,
    trial_end as current_trial_end,
    trial_status as current_trial_status,
    trial_duration_days as current_trial_duration_days,
    
    -- Calculated fields
    DATEDIFF(CURRENT_DATE, customer_created_at) as customer_age_days,
    
    CASE 
        WHEN trial_start IS NOT NULL AND trial_end < CURRENT_DATE 
        THEN DATEDIFF(CURRENT_DATE, trial_end)
        ELSE NULL
    END as days_since_trial_ended,
    
    -- User classification
    CASE 
        WHEN subscription_status = 'active' AND plan_type = 'Paid' THEN 'Active Paid Customer'
        WHEN subscription_status = 'active' AND plan_type = 'Free' THEN 'Active Free Customer'
        WHEN subscription_status = 'trialing' THEN 'Active Trial User'
        WHEN subscription_status = 'canceled' THEN 'Canceled Customer'
        WHEN subscription_status IN ('incomplete_expired', 'past_due', 'unpaid') THEN 'Payment Issue'
        WHEN subscription_status = 'paused' THEN 'Paused Customer'
        ELSE 'Other Status'
    END as user_category,
    
    CURRENT_TIMESTAMP as record_updated_at

FROM user_subscriptions
WHERE subscription_rank = 1  -- Only most recent subscription per customer
ORDER BY customer_created_at DESC
),
 m as (SELECT * FROM l where  current_trial_start > '2025-05-01' and customer_created_at > '2025-05-01' and current_trial_end < current_date() and current_trial_status = 'Trial Finished'
),
 paywall_users_raw_2 as (SELECT 
        user_id,
        pu.inserted_at,
        pu.meta_plan_name, 
        data:product_status::string as product_status_at_time,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY pu.inserted_at DESC) as rn
    FROM select_events pu 
  LEFT JOIN narrative.core.users u ON pu.user_id = u.id
  LEFT JOIN narrative.stripe.customers c ON u.email = c.email
  LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
  LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
  LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
WHERE
 user_id in (select user_id from  m)

    and topic = 'select_paywall_locked_no_active_plan'
        AND pu.inserted_at >= '2025-05-01'
),
 upgrade_modal_events as (SELECT 
        user_id,
        meta_product_status, 
        meta_plan_name,
        data:product_status::string as product_status_at_upgrade_modal, 
         pu.inserted_at as upgrade_modal_opened_at 
    FROM select_events pu 
LEFT JOIN narrative.core.users u ON pu.user_id = u.id
  LEFT JOIN narrative.stripe.customers c ON u.email = c.email
  LEFT JOIN narrative.stripe.subscriptions s ON c.id = s.customer_id
  LEFT JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
  LEFT JOIN narrative.stripe.prices p ON si.price_id = p.id
    WHERE
 user_id in (select user_id from  m)

and meta_product_status = 'active' and meta_plan_name not like '%Trial%'
        AND pu.inserted_at >= '2025-05-01'
),
 paywall_users_2 as (SELECT
  user_id,
  MIN(inserted_at) as first_paywall_seen,
  MAX(inserted_at) as last_paywall_seen,
  COUNT(*) as total_paywall_views,
  MAX(
    CASE
      WHEN rn = 1 THEN product_status_at_time
    END
  ) as latest_product_status_at_paywall
FROM
  paywall_users_raw_2
GROUP BY
  user_id
),
 paywall_to_upgrade_conversions as (SELECT
  pu.user_id,
  pu.first_paywall_seen,
  pu.last_paywall_seen,
  pu.latest_product_status_at_paywall,
  pu.total_paywall_views,
  -- Upgrade modal conversion tracking
  ume.upgrade_modal_opened_at,
  ume.product_status_at_upgrade_modal,
  ume.meta_product_status,
  ume.meta_plan_name,
  -- Conversion timing analysis
  CASE
    WHEN ume.upgrade_modal_opened_at > pu.first_paywall_seen THEN 'Converted - Opened Upgrade Modal'
    WHEN ume.upgrade_modal_opened_at <= pu.first_paywall_seen THEN 'Pre-Existing - Opened Modal Before Paywall'
    ELSE 'No Conversion - No Upgrade Modal'
  END as conversion_status,
  -- Time to conversion (in hours)
  CASE
    WHEN ume.upgrade_modal_opened_at > pu.first_paywall_seen THEN ROUND(
      TIMESTAMPDIFF (
        HOUR,
        pu.first_paywall_seen,
        ume.upgrade_modal_opened_at
      ),
      1
    )
    ELSE NULL
  END as hours_to_upgrade_modal,
  -- Date components for analysis
  DATE(pu.first_paywall_seen) as first_paywall_date,
  DATE(ume.upgrade_modal_opened_at) as upgrade_modal_date,
  DATEDIFF(DATE(ume.upgrade_modal_opened_at), DATE(pu.first_paywall_seen)) as days_to_upgrade_modal
FROM
  paywall_users_2 AS pu
  LEFT JOIN upgrade_modal_events ume ON pu.user_id = ume.user_id
)

-- Individual user-level results with dates
SELECT
  user_id,
  first_paywall_seen,
  first_paywall_date,
  last_paywall_seen,
  total_paywall_views,
  latest_product_status_at_paywall,
  upgrade_modal_opened_at,
  upgrade_modal_date,
  meta_product_status as upgrade_modal_product_status,
  meta_plan_name as upgrade_modal_plan_name,
  conversion_status,
  hours_to_upgrade_modal,
  days_to_upgrade_modal,
  -- Time between first and last paywall view
  CASE 
    WHEN first_paywall_seen != last_paywall_seen 
    THEN ROUND(TIMESTAMPDIFF(HOUR, first_paywall_seen, last_paywall_seen), 1)
    ELSE 0
  END as hours_between_first_last_paywall,
  -- Days since first paywall
  DATEDIFF(CURRENT_DATE, DATE(first_paywall_seen)) as days_since_first_paywall
FROM
  paywall_to_upgrade_conversions
ORDER BY
  first_paywall_seen DESC, 
  CASE WHEN conversion_status = 'Converted - Opened Upgrade Modal' THEN 1 ELSE 2 END,
  hours_to_upgrade_modal ASC