{{
    config(
        materialized="incremental",
    )
}}

select user_id, inserted_at, data:project_id
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

       and inserted_at > (select max(inserted_at) from {{ this }})
    {% endif %}