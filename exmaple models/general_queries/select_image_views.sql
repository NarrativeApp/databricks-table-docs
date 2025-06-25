{{ config(materialized="incremental") }}

select
    user_id,
    data:project_id,
    data:image_id,
    occurred_at as viewed_at, 
    inserted_at
from select_events
where
    user_id is not null
    and topic = 'select_image_viewed'

    {% if is_incremental() %}
        and inserted_at
        >= (select max(inserted_at) from {{ this }})
    {% endif %}
