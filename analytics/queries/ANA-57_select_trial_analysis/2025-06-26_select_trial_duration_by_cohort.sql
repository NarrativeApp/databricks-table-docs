WITH
  select_trials_1 AS (
    SELECT
      s.id AS subscription_id,
      s.customer_id,
      s.trial_start,
      s.trial_end,
      s.status,
      s.created AS subscription_created,
      c.created AS customer_created,
      p.nickname AS price_name,
      p.unit_amount / 100.0 AS price_usd,
      p.recurring_interval
    FROM
      narrative.stripe.subscriptions s
      JOIN narrative.stripe.subscription_items si ON s.id = si.subscription_id
      JOIN narrative.stripe.prices p ON si.price_id = p.id
      JOIN narrative.stripe.customers c ON s.customer_id = c.id
    WHERE
      p.product_id = 'prod_HE50j3A0xeeU2J' -- Select product
      AND s.trial_start IS NOT NULL -- Only subscriptions that had trials
      -- Include both active trials and completed trials (use broader filter for this analysis)
      AND s.trial_start > '2025-05-01' -- Filter for recent trials
      AND c.created > '2025-05-01'
      AND MONTH (c.created) = MONTH (s.trial_start)
  ),
  trial_days_with_cohort_1 AS (
    SELECT
      subscription_id,
      customer_id,
      trial_start,
      trial_end,
      status,
      price_name,
      price_usd,
      recurring_interval,
      customer_created,
      DATE_FORMAT (trial_start, 'yyyy-MM') AS creation_month,
      CASE
        WHEN status IN ('trialing', 'canceled') THEN DATEDIFF (CURRENT_DATE, DATE (trial_start))
        ELSE DATEDIFF (DATE (trial_end), DATE (trial_start))
      END AS days_in_trial,
      DATEDIFF (DATE (trial_end), DATE (trial_start)) + 1 AS total_trial_days,
      -- Determine trial completion status - simple logic
      CASE
        WHEN trial_start + INTERVAL '30 days' < CURRENT_DATE
        AND status != 'trialing' THEN 'Trial Finished'
        ELSE 'Active Trial'
      END AS trial_status
    FROM
      select_trials_1
    WHERE
      (
        (
          status = 'trialing'
          AND DATEDIFF (CURRENT_DATE, DATE (trial_start)) + 1 <= 35
        )
        OR (
          status != 'trialing'
          AND DATEDIFF (DATE (trial_end), DATE (trial_start)) + 1 <= 35
        )
      )
  )
SELECT
  creation_month,
  days_in_trial AS trial_day,
  trial_status,
  COUNT(*) AS user_count,
  -- Percentage within this cohort
  ROUND(
    COUNT(*) / SUM(COUNT(*)) OVER (
      PARTITION BY
        creation_month
    ),
    2
  ) AS pct_of_cohort,
  -- Show breakdown by pricing tier
  COUNT(
    CASE
      WHEN price_usd > 0 THEN 1
    END
  ) AS paid_tier_users,
  COUNT(
    CASE
      WHEN price_usd = 0 THEN 1
    END
  ) AS free_tier_users,
  -- Trial status breakdown
  COUNT(
    CASE
      WHEN trial_status = 'Active Trial' THEN 1
    END
  ) AS active_trial_users,
  COUNT(
    CASE
      WHEN trial_status = 'Trial Finished' THEN 1
    END
  ) AS finished_trial_users,
  -- Total cohort size for reference
  SUM(COUNT(*)) OVER (
    PARTITION BY
      creation_month
  ) AS total_cohort_size
FROM
  trial_days_with_cohort_1
GROUP BY
  creation_month,
  days_in_trial,
  trial_status
ORDER BY
  creation_month DESC,
  days_in_trial,
  trial_status