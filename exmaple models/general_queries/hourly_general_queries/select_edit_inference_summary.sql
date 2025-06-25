SELECT
  user_id,
  data:run_id::string AS run_id,
  data:modal_id::string AS inference_id,
  data:project_id::string,
  data:style_id::string,
  CASE
    WHEN seas.style_id IS NOT NULL THEN 'artist'
    WHEN sefs.style_id IS NOT NULL THEN 'free'
    ELSE 'personal'
  END AS style_type,
  COUNT(DISTINCT data:image_id) AS images,
  MIN(edited_at) AS inference_start_time,
  MAX(edited_at) AS inference_end_time,
  DATEDIFF(
    SECOND,
    MIN(edited_at),
    MAX(edited_at)
  ) AS time_difference,
  CASE
    WHEN COUNT(DISTINCT data:image_id) = 0 THEN NULL
    WHEN DATEDIFF(SECOND, MIN(edited_at), MAX(edited_at)) = 0 THEN NULL
    ELSE DATEDIFF(SECOND, MIN(edited_at), MAX(edited_at)) 
         / (COUNT(DISTINCT data:image_id) * 1.0)
  END AS seconds_per_image
FROM {{ ref('select_edited_images') }} se
LEFT JOIN select_edit_artist_styles seas 
       ON seas.style_id = se.style_id
      AND (se.edited_at <= seas.deleted_at OR seas.deleted_at IS NULL)
LEFT JOIN select_edit_free_styles sefs
       ON sefs.style_id = se.style_id
      AND (se.edited_at >= sefs.added_at OR sefs.added_at IS NULL)
GROUP BY 1, 2, 3, 4, 5, 6