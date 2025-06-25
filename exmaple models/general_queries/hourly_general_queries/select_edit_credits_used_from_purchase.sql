
-- This query joins credit uses onto the pack that they were used on so that we can tell if they are paid eMAU, pay artists and so on. 


WITH
  credit_increases AS (
    SELECT
      *
    FROM
      core.credit_transactions
    WHERE
      credits > 0
  ),
  credit_decreases AS (
    SELECT
      *
    FROM
      core.credit_transactions
    WHERE
      credits < 0
  ),
  total_credits_added AS (
    SELECT
      SUM(credits) OVER (
        PARTITION BY
          account_id
        ORDER BY
          inserted_at ROWS BETWEEN UNBOUNDED PRECEDING
          AND CURRENT ROW
      ) AS credits_increased_rolling_total,
      *
    FROM
      credit_increases
    ORDER BY
      account_id,
      inserted_at
  ),
  total_credits_decreased_rolling_total AS (
    SELECT
      SUM(credits) OVER (
        PARTITION BY
          account_id
        ORDER BY
          inserted_at ROWS BETWEEN UNBOUNDED PRECEDING
          AND CURRENT ROW
      ) AS credits_decreased_rolling_total,
      *
    FROM
      credit_decreases
    ORDER BY
      account_id,
      inserted_at
  ),
  credit_pack_used_from_logic AS (
    SELECT
      cu.account_id,
      credits_decreased_rolling_total,
      credits_increased_rolling_total,
      ta.credits AS credits_increased_instance,
      credits_decreased_rolling_total + credits_increased_rolling_total,
      credits_decreased_rolling_total + credits_increased_rolling_total - ta.credits AS pack_used_logic,
      credits_decreased_rolling_total + credits_increased_rolling_total - ta.credits < 0 AS pack_used,
      ta.description,
      ta.inserted_at credits_increased_instance_inserted_at,
      ta.id AS credit_pack_purchase_id,
      cu.id,
      cu.entry_id,
      cu.credits AS credits_decreased_rolling_total_in_this_inference,
      cu.inserted_at AS credits_decreased_rolling_total_at
    FROM
      total_credits_decreased_rolling_total cu
      JOIN total_credits_added ta ON ta.account_id = cu.account_id
      AND ta.inserted_at < cu.inserted_at
    ORDER BY
      ta.account_id,
      cu.inserted_at
  )
SELECT DISTINCT
  account_id,
  id AS credit_use_id,
  LAST_VALUE(credit_pack_purchase_id) OVER (
    PARTITION BY
      account_id,
      id
    ORDER BY
      credits_increased_instance_inserted_at ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) AS pack_purchased_from
FROM
  credit_pack_used_from_logic
WHERE
  pack_used = TRUE