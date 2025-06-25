{{ config(materialized="incremental") }}

select distinct
    data:session_id::string as session_id,
    first_value(id) over (
        partition by data:session_id
        order by occurred_at
        rows between unbounded preceding and unbounded following
    ) as first_event_id,
    first_value(
        occurred_at
    ) over (
        partition by data:session_id
        order by occurred_at
        rows between unbounded preceding and unbounded following
    ) as first_visit_at
from
    web_events 
    where occurred_at > '2020-01-01'  and topic = 'web_page_load_finish'

    {% if is_incremental() %}
        and occurred_at
        > (select max(first_visit_at) from {{ this }})
        and not exists (select 1 from {{ this }} t where data:session_id::string = t.session_id)
    {% endif %}
