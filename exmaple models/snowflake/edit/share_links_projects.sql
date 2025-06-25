SELECT distinct
  email,
  up.account_id, 
  pv.project_id,
  share_link_id,
  share_link_created_at,
  u.id AS user_id
FROM
  {{ ref('projects_select_filters') }} as projects_select_filters 
  JOIN core.user_permissions up ON up.account_id = projects_select_filters.account_id
  JOIN core.users u ON u.id = up.user_id
  JOIN core.project_versions pv ON pv.project_id = projects_select_filters.project_id
where
  share_link_created_at > '2023-12-01'