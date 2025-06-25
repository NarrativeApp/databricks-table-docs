select
    wes.*,
    qs.user_id,
    qs.day,
    qs.is_professional,
    qs.is_qualified,
    qs.vertical,
    qs.source,
    os.macos,
    os.windows,
    pcr.projects_created,
    case when cmau is null then false else true end as is_cmau, 
    case when activation.user_id is null then false else true end as is_activated,


from {{ ref("select_web_entry_source") }} wes
left join
    {{ ref("qualified_signups") }} qs
    on wes.session_id = qs.session_id
    and app = 'select'

left join {{ ref("select_user_os_used") }} os on os.user_id = qs.user_id
left join
    (
        select user_id, max(project_number) as projects_created
        from {{ ref("select_projects_created_at_ranked") }}
        group by 1
    ) pcr
    on pcr.user_id = qs.user_id
left join (
    select distinct user_id, 
           last_value(is_cmau) over (partition by user_id order by end_day_inclusive rows between unbounded preceding and current row) as cmau
    from {{ref("select_cmau")}} 
    where is_cmau
    and end_day_inclusive >= current_date - interval '48 hours'
) cmau on cmau.user_id = qs.user_id
left join (
    select user_id
    from {{ref("select_activation")}}
    where activated_at is not null
) activation on activation.user_id = qs.user_id


where qs.user_id is not null
