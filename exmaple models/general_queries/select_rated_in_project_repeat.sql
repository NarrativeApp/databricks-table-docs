{{ config(materialized="incremental") }}

select
    user_id,
    data:project_id,
    data:project_image_count::int,
   inserted_at::date as day
from select_events
where
    user_id is not null
    and topic in (
        'select_color_images',
        'select_rate_images',
        'select_tag_images',
        'select_eliminate_images'
    )

    {% if is_incremental() %}
        and inserted_at
        >= (select max(day) from {{ this }})
    {% endif %}
