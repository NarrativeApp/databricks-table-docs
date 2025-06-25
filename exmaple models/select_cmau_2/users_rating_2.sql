select distinct rating.user_id, rating.inserted_at::date as day
from {{ ref("rating_2") }} as rating
join
    {{ ref("second_and_later_projects_2") }} as second_and_later_projects
    on second_and_later_projects.project_id = rating.project_id
