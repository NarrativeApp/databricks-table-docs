SELECT
  *,
  rank() over (
    partition by
      user_id
    order by
      first_edited_at asc
  ) as project_edited_at_ranked
FROM
  {{ ref('edit_projects_edited') }} as edit_projects_edited