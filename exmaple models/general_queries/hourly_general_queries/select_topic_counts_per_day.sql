{{ config(materialized="incremental") }}

select inserted_at::date, topic, count(id) as count
from select_events

{% if is_incremental() %}
    where inserted_at::date >= (select max(inserted_at) from {{ this }})
{% endif %}
group by 1, 2
