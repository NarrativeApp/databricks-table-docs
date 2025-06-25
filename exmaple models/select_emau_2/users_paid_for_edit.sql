WITH
  ap AS (
    SELECT
      pack_id,
      stripe_payment_intent_id,
      p.name AS pack_name
    FROM
      core.account_packs ap
      JOIN core.packs p ON p.id = ap.pack_id
  )
SELECT
distinct u.id as user_id
FROM
  stripe.payment_intents PI
  JOIN ap ON ap.stripe_payment_intent_id = PI.id
  join core.users u on u.email = PI.receipt_email
WHERE
  PI.status = 'succeeded'
  AND receipt_email NOT LIKE '%narrative.so%'