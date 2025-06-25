select
    *,
    rank() over (partition by user_id order by first_occurred_at asc) as project_number
from {{ ref('select_projects_created_at') }}
