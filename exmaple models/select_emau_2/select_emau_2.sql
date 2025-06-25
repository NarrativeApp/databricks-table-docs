WITH
  window_28_days_ AS (
    SELECT *
    FROM window_28_days
  ),

  max_date AS (
    SELECT MAX(inserted_at)::date - interval '1 day' AS end_date
    FROM select_events
  ),

  windows AS (
    SELECT
      start_day_inclusive,
      end_day_inclusive
    FROM window_28_days_, max_date
    WHERE
      start_day_inclusive >= '2023-10-01'
      AND end_day_inclusive <= end_date
  ),

  base_projects AS (
    SELECT
      user_id,
      data:project_id::string AS project_id,
      MIN(inserted_at) AS first_inserted_at,
      MIN(occurred_at) AS first_occurred_at
    FROM {{ ref('select_edit_style_related_events') }}
    WHERE
      vsn = 4
      AND data:project_id IS NOT NULL
      AND topic = 'select_edit_image_edited_outcome'
      AND inserted_at > '2023-10-01'
    GROUP BY
      user_id,
      data:project_id
  ),

  ranked_projects AS (
    SELECT
      *,
      RANK() OVER (
        PARTITION BY user_id
        ORDER BY first_occurred_at ASC
      ) AS project_number
    FROM base_projects
  ),

  second_and_later_projects AS (
    SELECT DISTINCT project_id
    FROM ranked_projects
    WHERE
      first_inserted_at >= '2023-10-01'
      AND project_number >= 2
  ),

  users_editing AS (
    SELECT DISTINCT
      editing.user_id,
      day,
      MAX(inference_payment_type) AS is_paid
    FROM (
      SELECT
        eis.user_id,
        inference_start_time::date AS day,
        project_id,
        CASE
          WHEN lsp.user_id IS NOT NULL THEN 1
          ELSE 0
        END AS inference_payment_type
      FROM {{ ref('select_edit_inference_summary') }} eis
      LEFT JOIN {{ ref('users_paid_for_edit') }} AS lsp ON eis.user_id = lsp.user_id
    ) editing
    JOIN second_and_later_projects ON second_and_later_projects.project_id = editing.project_id
    GROUP BY editing.user_id, day
  )

SELECT
  w.start_day_inclusive,
  w.end_day_inclusive,
  u.user_id,
  r.is_paid,
  (r.user_id IS NOT NULL) AS is_emau,
  COUNT(DISTINCT r.day) AS days_editing_active,
  COUNT(DISTINCT u.day) AS days_active
FROM
  windows w
  LEFT OUTER JOIN {{ ref('select_users_2') }} u
    ON u.day >= w.start_day_inclusive
    AND u.day <= w.end_day_inclusive
  LEFT OUTER JOIN users_editing AS r
    ON r.user_id = u.user_id
    AND r.day >= w.start_day_inclusive
    AND r.day <= w.end_day_inclusive
GROUP BY
  w.start_day_inclusive,
  w.end_day_inclusive,
  u.user_id,
  r.user_id,
  r.is_paid;