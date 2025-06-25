{{ config(materialized="incremental") }}

select
    user_id,
    min(inserted_at) as product_created_at
from service_events s
where
    topic = 'product_created' and data:resource.name = 'Select' and user_id is not null 

    {% if is_incremental() %}
        and inserted_at
        >= (select max(product_created_at) from {{ this }})
        and not exists (select user_id from {{ this }} t where s.user_id = t.user_id)
    {% endif %}
group by user_id
