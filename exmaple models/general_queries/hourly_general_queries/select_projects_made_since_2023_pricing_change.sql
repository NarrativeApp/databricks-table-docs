select
    sp.*,
    rank() over (partition by user_id order by first_occurred_at asc) as project_number
from {{ ref("select_projects_created_at") }} sp
join {{ ref("select_versions")}} sv on sv.version_number = sp.meta_app_version_number  
where numeric_version >= 1004007.0