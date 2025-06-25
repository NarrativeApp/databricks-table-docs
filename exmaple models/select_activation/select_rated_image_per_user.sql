{{ config(materialized="incremental") }}


select
    user_id,
    data:project_id,
    data:project_image_count,
    data:image_id,
    min(inserted_at) as rated_at
    
from select_events
where
    topic in (
        'select_color_images',
        'select_rate_images',
        'select_tag_images',
        'select_eliminate_images'
    )
    and inserted_at
    >= '2021-01-01'

    {% if is_incremental() %}
        and inserted_at
        >= (select max(rated_at) from {{ this }})
        and not exists (
            select image_id from {{ this }} t where t.image_id = data:image_id::string
        )
    {% endif %}
group by user_id, image_id, data:project_id, data:project_image_count
