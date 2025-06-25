WITH
  select_processed_images AS (
    SELECT
      user_id,
      data:image_id,
      data:narrative_forever_image_id,
      data:project_id,
      data:style_id,
      data:success::boolean,
      data:temperature,
      data:tint,
      data,
      ROUND(data:exposure::float, 3) AS exposure,
      ROUND(data:contrast::float, 3) AS contrast,
      ROUND(data:blacks::float, 3) AS blacks,
      ROUND(data:whites::float, 3) AS whites,
      ROUND(data:shadows::float, 3) AS shadows,
      ROUND(data:highlights::float, 3) AS highlights,
      data:auto_level_apply::boolean,
      ROUND(data:auto_level_value::float, 3) AS auto_level_value,
      data:cluster_index::int AS cluster_index,
      inserted_at AS edited_at,
      occurred_at,
      meta_app_run_id
    FROM
       {{ ref("select_edit_style_related_events") }}
    WHERE
      topic = 'select_edit_image_edited_post_processed'
  ),
  intital_edit_outcomes AS (
    SELECT
      user_id,
      data:image_id,
      data:narrative_forever_image_id,
      data:project_id,
      data:style_id,
      data:success::boolean,
      data:temperature,
      data:tint,
      data,
      ROUND(data:exposure::float, 3) AS exposure,
      ROUND(data:contrast::float, 3) AS contrast,
      ROUND(data:blacks::float, 3) AS blacks,
      ROUND(data:whites::float, 3) AS whites,
      ROUND(data:shadows::float, 3) AS shadows,
      ROUND(data:highlights::float, 3) AS highlights,
      data:auto_level_apply::boolean,
      ROUND(data:auto_level_value::float, 3) AS auto_level_value,
      inserted_at AS edited_at,
      occurred_at,
      meta_app_run_id
    FROM
      {{ ref("select_edit_style_related_events") }}
    WHERE
      topic = 'select_edit_image_edited_outcome'
  )
SELECT DISTINCT
  user_id,
  narrative_forever_image_id,
  style_id,
  ie.project_id, 
  ie.image_id,
  ie.data, 
  ie.edited_at,
  ie.success,
  ie.temperature AS initial_temperature,
  COALESCE(PI.temperature, ie.temperature) AS temperature,
  ie.tint AS initial_tint,
  COALESCE(PI.tint, ie.tint) AS tint,
  ie.exposure AS intital_exposure,
  COALESCE(PI.exposure, ie.exposure) AS exposure,
  ie.contrast AS intital_contrast,
  COALESCE(PI.contrast, ie.contrast) AS contrast,
  ie.whites AS initial_whites,
  COALESCE(PI.whites, ie.whites) AS whites,
  ie.blacks AS initial_blacks,
  COALESCE(PI.blacks, ie.blacks) AS blacks,
  ie.highlights AS intial_highlights,
  COALESCE(PI.highlights, ie.highlights) AS highlights,
  ie.shadows AS intial_shadows,
  COALESCE(PI.shadows, ie.shadows) AS shadows,
  ie.auto_level_apply,
  ie.auto_level_value,
  PI.cluster_index
FROM
  intital_edit_outcomes ie
  LEFT JOIN select_processed_images PI USING (
    narrative_forever_image_id,
    user_id,
    style_id,
    meta_app_run_id
  )