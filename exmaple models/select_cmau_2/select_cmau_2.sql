select
    windows.start_day_inclusive,
    windows.end_day_inclusive,
    select_users.user_id,
    (users_rating.user_id is not null) as is_cmau,
    count(distinct users_rating.day) as days_culling_active,
    count(distinct select_users.day) as days_active
from {{ ref("window_28_days_cte_2") }} as windows
left outer join
    {{ ref("select_users_2") }} as select_users
    on select_users.day >= windows.start_day_inclusive
    and select_users.day <= windows.end_day_inclusive
left outer join
    {{ ref("users_rating_2") }} as users_rating
    on users_rating.user_id = select_users.user_id
    and users_rating.day >= windows.start_day_inclusive
    and users_rating.day <= windows.end_day_inclusive
group by
    windows.start_day_inclusive,
    windows.end_day_inclusive,
    select_users.user_id,
    users_rating.user_id
