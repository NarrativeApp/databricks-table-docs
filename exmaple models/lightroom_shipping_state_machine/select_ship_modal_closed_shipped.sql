
{{
  config(
    materialized = 'incremental',
    unique_key = 'modal_id',
    merge_exclude_columns = ['selected_ship_to', 'choice', 'selected_images_to_be_shipped', 'selected_ratings_to_be_shipped', 'selected_ship_image_count', 'select_ship_modal_closed_step_at', 'select_ship_modal_closed' ],
  )
}}

select
  data:modal_id::string,
  data:selected_ship_to::string,
  data:choice::string,
  data:selected_images_to_be_shipped::string,
  data:selected_ratings_to_be_shipped,
  data:selected_ship_image_count as selected_ship_image_count_ui,
  
  (
    occurred_at
  ) as select_ship_modal_closed_step_at,
  topic as select_ship_modal_closed
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_modal_closed'
  and data:choice::string = 'ship_images'
  and occurred_at > '2023-08-01'

     {% if is_incremental() %}
        and (occurred_at)
        > (select max(select_ship_modal_closed_step_at) from {{ this }})
    {% endif %}