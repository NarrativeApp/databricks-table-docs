WITH
  a AS (
    SELECT
      *,
      from_json(model_info, 'STRUCT<
  training_accuracy: FLOAT,
  training_image_count: INT,
  model_image_count: INT,
  time_saved_score: INT,
  ml_version: STRING,
  training_approach: STRING
>') AS model_info_super   FROM
      core.share_link_trainings
    ORDER BY
      inserted_at DESC
  )
SELECT
  email,
  u.id as user_id, 
  a.id,
  a.kind,
  p.name as style_name, 
  p.id as style_id, 
  sl.status, 
  sl.id as share_link_id, 
  model_info_super.training_accuracy::float as training_accuracy,
  model_info_super.training_image_count::int as training_image_count,
  model_info_super.model_image_count::int as model_image_count, 
  model_info_super.time_saved_score::int as  time_saved_score, 
  model_info_super.ml_version as ml_version,
  model_info_super.training_approach::string as training_approach,
  a.inserted_at,
  pu.account_id,
  model_info_super FROM
  a
  JOIN core.share_links sl ON sl.id = a.share_link_id
  JOIN core.projects p ON p.id = sl.project_id
  JOIN core.`select` pu ON pu.id = p.select_id
  JOIN core.user_permissions up ON up.account_id = pu.account_id
  JOIN core.users u ON u.id = up.user_id