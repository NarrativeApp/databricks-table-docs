SELECT
  p.name,
  p.select_id,
  share_links_filtered.*,
  share_links_filtered.id AS share_link_id,
  share_links_filtered.inserted_at as share_link_created_at
FROM
  core.projects p
  JOIN {{ ref('share_links_filtered') }} as share_links_filtered ON share_links_filtered.project_id = p.id
ORDER BY
  p.inserted_at DESC