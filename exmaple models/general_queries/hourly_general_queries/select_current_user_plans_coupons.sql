WITH
  stripe_sub_coupons AS (
    WITH
      stripe_sub AS (
        SELECT
          id AS stripe_sub_id,
          discount_coupon_id
        FROM
          stripe.subscriptions
      )
    SELECT
      discount_coupon_id,
      stripe_sub_id,
      name AS coupon_name
    FROM
      stripe.coupons
      JOIN stripe_sub ON id = discount_coupon_id
  ),
  select_current_user_plans AS (
    WITH
      core_select AS (
        SELECT
          account_id,
          plan_id,
          name AS plan_name,
          stripe_sub_id,
          INTERVAL,
          stripe_status
        FROM
          core.select
      ),
      core_plans AS (
        SELECT
          id AS plan_id,
          name AS detailed_plan_name,
          status AS plan_status,
          slug
        FROM
          core.plans
      )
    SELECT
      account_id,
      plan_id,
      plan_name,
      detailed_plan_name,
      plan_status,
      slug,
      stripe_sub_id,
      interval,
      stripe_status,
      up.user_id
    FROM
      core_select AS s
      JOIN core_plans AS p USING (plan_id)
      JOIN core.user_permissions AS up USING (account_id)
  )
SELECT
  *
FROM
  select_current_user_plans
  LEFT JOIN stripe_sub_coupons USING (stripe_sub_id)