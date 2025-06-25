SELECT
  *
FROM
  core.share_links
WHERE
  inserted_at > '2023-10-01'
  AND kind = 'style'
ORDER BY
  inserted_at DESC