{{ config(materialized="incremental") }}

select * from select_events where topic != 'select_image_viewed'



    {% if is_incremental() %}
        and inserted_at >= (select max(inserted_at) from {{ this }})
    {% endif %}