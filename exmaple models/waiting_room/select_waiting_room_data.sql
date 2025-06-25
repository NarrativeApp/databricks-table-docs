{{ config(materialized="incremental") }}

select *
from select_events
where
    topic in (

        'select_project_creation_loading_screen_closed',
        'select_project_creation_loading_screen_estimate_ready',
        'select_project_creation_loading_screen_opened'

    )

    {% if is_incremental() %}
        and occurred_at > (select max(occurred_at) from {{ this }})
    {% endif %}
