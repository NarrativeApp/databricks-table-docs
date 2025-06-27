WITH
  all_completed_trials AS (
    SELECT
      s.id AS subscription_id,
      s.customer_id,
      s.trial_start,
      s.trial_end,
      s.status,
      s.created AS subscription_created,
      c.created AS customer_created,
      p.id AS price_id,
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
      AND (
        s.trial_end < CURRENT_DATE
        AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE()
      ) -- Trial has ended
      AND s.status != 'trialing' -- Currently active (converted)
      -- AND p.unit_amount > 0
      AND trial_start > '2025-05-01'
  ),
  cohort_upgrade_rates AS (
    SELECT
      DATE_FORMAT (customer_created, 'yyyy-MM') AS creation_month,
      COUNT(DISTINCT customer_id) AS total_completed_trials,
      COUNT(
        DISTINCT CASE
          WHEN price_usd > 0
          AND status = 'active' THEN customer_id
        END
      ) AS paid_upgrades,
      COUNT(
        DISTINCT CASE
          WHEN price_usd = 0
          OR status != 'active' THEN customer_id
        END
      ) AS not_converted,
      ROUND(
        AVG(DATEDIFF (DATE (trial_end), DATE (trial_start))),
        1
      ) AS avg_trial_length_days,
      ROUND(
        AVG(
          CASE
            WHEN price_usd > 0
            AND status = 'active' THEN price_usd
          END
        ),
        2
      ) AS avg_paid_upgrade_price
    FROM
      all_completed_trials
    WHERE
      customer_created >= '2022-01-01' -- Focus on recent cohorts
    GROUP BY
      DATE_FORMAT (customer_created, 'yyyy-MM')
  )
SELECT
  creation_month,
  total_completed_trials,
  paid_upgrades,
  not_converted,
  -- Key metric: Paid upgrade percentage
  ROUND(paid_upgrades * 100.0 / total_completed_trials, 2) AS paid_upgrade_rate_pct,
  ROUND(not_converted * 100.0 / total_completed_trials, 2) AS not_converted_rate_pct,
  -- Additional context
  avg_trial_length_days,
  avg_paid_upgrade_price
FROM
  cohort_upgrade_rates
WHERE
  total_completed_trials >= 5 -- Only cohorts with meaningful volume
ORDER BY
  creation_month DESC