{{
    config(
        materialized="incremental",
    )
}}

select distinct user_id, inserted_at::date as day, max(inserted_at) as last_event_date
from select_events
where
    user_id is not null
    {% if is_incremental() %}
        and inserted_at > (select max(last_event_date) from {{ this }})
    {% endif %}
group by 1, 2