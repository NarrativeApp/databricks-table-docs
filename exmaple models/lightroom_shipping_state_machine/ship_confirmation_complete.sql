{{
config(
materialized = 'incremental',
unique_key = 'modal_id',
merge_exclude_columns = ['confirmed_count_final', 'top_level_image_final', 'ship_confirmation_complete_step_at', 'ship_confirmation_complete' ],
)
}}

select
  data:modal_id::string,
  data:confirmed_count as confirmed_count_final,
  data:top_level_images as top_level_image_final,
  (
    occurred_at
  ) as ship_confirmation_complete_step_at,
  topic as ship_confirmation_complete
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_confirmation_complete'
  and (occurred_at) > '2023-08-01'
{% if is_incremental() %}
  and (occurred_at) > 
  (select max(ship_confirmation_complete_step_at) from {{ this }})
{% endif %}
