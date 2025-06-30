

-- 1️⃣  New Narrative plan nicknames (compact VALUES list)
WITH plan_names(nickname) AS (
  VALUES
    ('Narrative Lite-Month'),
    ('Narrative Lite-Year'),
    ('Narrative Premium-Month'),
    ('Narrative Premium-Year'),
    ('Narrative Standard-Month'),
    ('Narrative Standard-Year'),
    ('Narrative Ultra-Month'),
    ('Narrative Ultra-Year')
),

-- 2️⃣  Every positive-amount, paid invoice-line for the *Select* product
select_charges AS (
  SELECT
      i.id                    AS invoice_id,
      i.customer_id,
      i.date               AS invoice_created,      -- epoch seconds
      li.id                   AS line_item_id,
      li.amount               AS line_amount_cents,
      COALESCE(li.price_id, si.price_id) AS price_id
  FROM  stripe.invoices            i
  JOIN  stripe.invoice_line_items  li ON li.invoice_id = i.id
  LEFT  JOIN stripe.subscription_items si
            ON si.id = li.subscription_item_id
  JOIN  stripe.prices p            ON p.id = COALESCE(li.price_id, si.price_id)
  WHERE i.amount_paid  > 0
    AND li.amount      > 0
    AND (
          p.product_id = 'prod_HE50j3A0xeeU2J'           -- <-- put your real Select-product ID here
          OR LOWER(p.nickname) LIKE '%select%'      -- fallback if ID not handy
        )
),

-- 3️⃣  Among those Select charges, grab only the *new-nickname* ones
new_plan_charges AS (
  SELECT sc.*,
         p.nickname               AS plan_nickname,
         p.unit_amount            AS unit_price_cents,
         p.recurring_interval
  FROM   select_charges sc
  JOIN   stripe.prices   p ON p.id = sc.price_id
  WHERE  p.nickname IN (SELECT nickname FROM plan_names)
),

-- 4️⃣  First time each customer pays for a *new* plan
first_new_plan AS (
  SELECT  customer_id,
          MIN(invoice_created) AS first_new_created
  FROM    new_plan_charges
  GROUP BY customer_id
),

-- 5️⃣  Did the customer have any Select charge *before* that moment?
prior_select_payers AS (
  SELECT  DISTINCT fn.customer_id
  FROM    first_new_plan fn
  JOIN    select_charges  sc
         ON sc.customer_id    = fn.customer_id
        AND sc.invoice_created < fn.first_new_created
)

-- 6️⃣  Final result: every line for the new plans, plus two flags
SELECT
    npc.plan_nickname,
    npc.price_id,
    npc.unit_price_cents / 100   AS unit_price,
    npc.recurring_interval,
    npc.invoice_created as date, 
    npc.customer_id,
    c.created as customer_created_at,
    npc.invoice_id,
    npc.line_item_id,
    npc.line_amount_cents / 100  AS line_amount,

    i.amount_paid / 100 as amount_paid,  
    -- Is this *the* first new-plan charge for that customer?
    CASE
        WHEN npc.invoice_created = fn.first_new_created
             THEN TRUE ELSE FALSE
    END AS is_first_new_plan_charge,
    -- Did they pay for Select earlier (i.e. were they migrated)?
    CASE
        WHEN psp.customer_id IS NOT NULL
             THEN TRUE ELSE FALSE
    END AS had_prior_select_charge
FROM   new_plan_charges npc
JOIN   first_new_plan    fn  ON fn.customer_id = npc.customer_id
join stripe.customers c on c.id = npc.customer_id 
LEFT   JOIN prior_select_payers psp
           ON psp.customer_id  = npc.customer_id
join stripe.invoices i on i.id = npc.invoice_id 
ORDER  BY npc.invoice_id, npc.plan_nickname;


SELECT
  g.customer_id AS customer_id,
  g.had_prior_select_charge AS had_prior_select_charge,
  g.invoice_id AS invoice_id,
  g.is_first_new_plan_charge AS is_first_new_plan_charge,
  g.line_item_id AS line_item_id,
  g.plan_nickname AS plan_nickname,
  g.price_id AS price_id,
  g.recurring_interval AS recurring_interval,
  g.amount_paid AS amount_paid,
  g.line_amount AS line_amount,
  g.unit_price AS unit_price,
  g.date AS date
FROM
  g
WHERE
  (
    (
      DATE_TRUNC(
        'DAY',
        CAST(CAST(g.customer_created_at AS TIMESTAMP) AS DATE)
      ) > CAST('2025-05-28' AS DATE)
    )
    AND (g.had_prior_select_charge = FALSE)
  )




SELECT (SUM(CASE WHEN (plan_nickname LIKE '%Year%') THEN (amount_paid / 12) ELSE amount_paid END) / COUNT(DISTINCT customer_id)) AS sum_case_when_plan_nickname_like_Year_then_amount_paid_12_else_amount_paid_end_count_distinct_customer_id FROM h_4