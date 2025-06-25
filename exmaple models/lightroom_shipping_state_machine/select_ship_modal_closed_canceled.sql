{{
  config(
    materialized = 'incremental',
    unique_key = 'modal_id',
    merge_exclude_columns = ['select_ship_modal_closed_canceled_step_at', 'select_ship_modal_closed_canceled'],
  )
}}

select


  data:modal_id::string,

  (
    occurred_at
  ) as select_ship_modal_closed_canceled_step_at,
  'select_ship_modal_closed_canceled' as select_ship_modal_closed_canceled
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_modal_closed'



  and data:choice::string = 'cancel'

  and occurred_at > '2023-08-01' 
{% if is_incremental() %}
      and occurred_at
      > (select max(select_ship_modal_closed_canceled_step_at) from {{ this }})
{% endif %}

