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
  pu.latest_product_status_at_paywall,
  pu.total_paywall_views,
  -- Upgrade modal conversion tracking
  ume.upgrade_modal_opened_at,
  ume.product_status_at_upgrade_modal,
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
  END as hours_to_upgrade_modal
FROM
  paywall_users_2 AS pu
  LEFT JOIN upgrade_modal_events ume ON pu.user_id = ume.user_id
),
 conversion_summary as (SELECT
  COALESCE(latest_product_status_at_paywall, 'null/unknown') as product_status_at_paywall,
  COUNT(DISTINCT user_id) as total_users_who_saw_paywall,
  -- Conversion metrics
  COUNT(
    DISTINCT CASE
      WHEN conversion_status = 'Converted - Opened Upgrade Modal' THEN user_id
    END
  ) as users_opened_upgrade_modal,
  COUNT(
    DISTINCT CASE
      WHEN conversion_status = 'Pre-Existing - Opened Modal Before Paywall' THEN user_id
    END
  ) as users_opened_modal_before_paywall,
  COUNT(
    DISTINCT CASE
      WHEN conversion_status = 'No Conversion - No Upgrade Modal' THEN user_id
    END
  ) as users_no_upgrade_modal,
  -- Engagement metrics
  ROUND(AVG(total_paywall_views), 1) as avg_paywall_views_per_user,
  ROUND(
    AVG(
      CASE
        WHEN conversion_status = 'Converted - Opened Upgrade Modal' THEN hours_to_upgrade_modal
      END
    ),
    1
  ) as avg_hours_to_upgrade_modal,
  -- Additional upgrade modal insights
  COUNT(
    CASE
      WHEN conversion_status = 'Converted - Opened Upgrade Modal' THEN 1
    END
  ) as total_upgrade_modal_opens_post_paywall,
  ROUND(
    AVG(
      CASE
        WHEN conversion_status = 'Converted - Opened Upgrade Modal' THEN hours_to_upgrade_modal
      END
    ),
    2
  ) as median_hours_to_upgrade_modal
FROM
  paywall_to_upgrade_conversions
GROUP BY
  COALESCE(latest_product_status_at_paywall, 'null/unknown')
),
 total_summary_1 as (SELECT
  'TOTAL - All Product Statuses' as product_status_at_paywall,
  SUM(total_users_who_saw_paywall) as total_users_who_saw_paywall,
  SUM(users_opened_upgrade_modal) as users_opened_upgrade_modal,
  SUM(users_opened_modal_before_paywall) as users_opened_modal_before_paywall,
  SUM(users_no_upgrade_modal) as users_no_upgrade_modal,
  ROUND(AVG(avg_paywall_views_per_user), 1) as avg_paywall_views_per_user,
  ROUND(AVG(avg_hours_to_upgrade_modal), 1) as avg_hours_to_upgrade_modal,
  SUM(total_upgrade_modal_opens_post_paywall) as total_upgrade_modal_opens_post_paywall,
  ROUND(AVG(median_hours_to_upgrade_modal), 2) as median_hours_to_upgrade_modal
FROM
  conversion_summary
)
-- 6️⃣ Final results with conversion rates for individual statuses
SELECT
  product_status_at_paywall,
  total_users_who_saw_paywall,
  users_opened_upgrade_modal,
  users_opened_modal_before_paywall,
  users_no_upgrade_modal,
  avg_paywall_views_per_user,
  avg_hours_to_upgrade_modal,
  total_upgrade_modal_opens_post_paywall,
  -- Conversion rate calculations
  ROUND(
    users_opened_upgrade_modal * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as paywall_to_upgrade_modal_conversion_pct,
  ROUND(
    users_opened_modal_before_paywall * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as had_opened_modal_before_paywall_pct,
  ROUND(
    users_no_upgrade_modal * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as no_upgrade_modal_interaction_pct
FROM
  conversion_summary
UNION ALL
-- 7️⃣ Add total row
SELECT
  product_status_at_paywall,
  total_users_who_saw_paywall,
  users_opened_upgrade_modal,
  users_opened_modal_before_paywall,
  users_no_upgrade_modal,
  avg_paywall_views_per_user,
  avg_hours_to_upgrade_modal,
  total_upgrade_modal_opens_post_paywall,
  -- Conversion rate calculations for totals
  ROUND(
    users_opened_upgrade_modal * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as paywall_to_upgrade_modal_conversion_pct,
  ROUND(
    users_opened_modal_before_paywall * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as had_opened_modal_before_paywall_pct,
  ROUND(
    users_no_upgrade_modal * 100.0 / NULLIF(total_users_who_saw_paywall, 0),
    2
  ) as no_upgrade_modal_interaction_pct
FROM
  total_summary_1
ORDER BY
  CASE
    WHEN product_status_at_paywall = 'TOTAL - All Product Statuses' THEN 1
    ELSE 0
  END,
  total_users_who_saw_paywall DESC