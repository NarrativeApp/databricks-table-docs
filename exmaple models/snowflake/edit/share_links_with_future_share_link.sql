SELECT *, lag(share_link_created_at, 1)

OVER ( PARTITION BY project_id  ORDER BY share_link_created_at ) as previous_share_link_created_at FROM {{ ref('share_links_projects') }} as share_links_projects