
SELECT
  select_users.user_id,
  product_created_at,
  signed_in_at,
  -- Technically speaking this isn't when a user activated because if it happened
  -- more than seven days after they first signed in, then they won't have
  -- activated - they'll have the other criteria, but not the time window
  rated_fifth_image_at AS activated_at,
  CASE
    WHEN activated_at IS NULL THEN false
    ELSE (activated_at - signed_in_at) < INTERVAL '1 day'
  END AS activated_within_1_day,
  CASE
    WHEN activated_at IS NULL THEN false
    ELSE (activated_at - signed_in_at) < INTERVAL '7 days'
  END AS activated_within_7_days
FROM
{{ ref('select_signed_in_at') }} select_users

LEFT OUTER JOIN
{{ ref('select_product_created_at') }}
 product_created
ON
  product_created.user_id = select_users.user_id
LEFT OUTER JOIN
(
  SELECT
    user_id,
    MIN(rated_at) AS rated_fifth_image_at
  FROM
  (
    SELECT
      user_id,
      RANK() OVER (PARTITION BY user_id ORDER BY rated_at) AS image_rank,
      rated_at
    FROM
    {{ ref('select_rated_image_per_user') }} per_user_per_image
  ) ranked_image_views
  -- Check for 5 and above instead of directly 5 to handle the case where there's a tied rank and 5 is skipped over
  -- This then necessitates finding the image with the minimum rate time. Note this *can* slightly undercount in
  -- cases where a user rate exactly 5 images and had a tied rank such that for example there were two 4th ranked
  -- images.
  WHERE
    image_rank >= 5
  GROUP BY
    user_id
) rated_images
ON
  rated_images.user_id = select_users.user_id
--RequestID=64cd790c-0940-49ec-acfa-8e34fae0078e; TraceID=1-64b4677e-129b39ff7f151cb3344703ae;