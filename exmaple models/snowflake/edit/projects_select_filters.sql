SELECT
  projects_share_links_filtered.*,
  s.account_id
FROM
  {{ ref('projects_share_links_filtered') }} as projects_share_links_filtered
  JOIN core.select s ON s.id = projects_share_links_filtered.select_id
ORDER BY
  projects_share_links_filtered.inserted_at DESC