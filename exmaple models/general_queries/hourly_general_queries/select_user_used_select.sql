{{ config(materialized="incremental") }}

select distinct
    user_id,
    last_value(meta_app_version_number) over (
        partition by user_id, occurred_at
        order by occurred_at
        rows between unbounded preceding and unbounded following
    ) as version_number,
    occurred_at::date as day

from select_events
where
    user_id is not null

    {% if is_incremental() %}
        and occurred_at
        >= (select max(day) from {{ this }})
    {% endif %}
