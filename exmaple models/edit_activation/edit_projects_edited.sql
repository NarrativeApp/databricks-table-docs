SELECT
  user_id,
  project_id,
  MIN(edited_at) AS first_edited_at
FROM
  (
    SELECT
      user_id,
      project_id,
      MIN(edited_at) AS edited_at,
      COUNT(DISTINCT image_id) AS images
    FROM
     {{ ref('select_edited_images') }}
    GROUP BY
      1,
      2
  )
WHERE
  images >= 50
  
GROUP BY
  1,
  2