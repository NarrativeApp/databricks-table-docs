SELECT
  *
from
  {{ ref('edit_projects_edited_ranked') }} as edit_projects_edited_ranked
where
  project_edited_at_ranked = 2