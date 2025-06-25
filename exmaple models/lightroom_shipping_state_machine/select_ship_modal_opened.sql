{{
  config(
    materialized = 'incremental',
    unique_key = 'modal_id',
    merge_exclude_columns = ['ship_start_at', 'select_ship_modal_opened'],
  )
}}

select
  user_id,
  data:project_id::string,
  data:modal_id::string,
  (
    occurred_at
  ) as ship_start_at,
  topic as select_ship_modal_opened, 
  version_number, 
  numeric_version
  
from
  {{ ref('select_shipping_events') }} se 
  join {{ ref('select_versions') }} sv on se.meta_app_version_number = sv.version_number
where
  topic = 'select_ship_modal_opened'
  and occurred_at > '2023-08-01'

     {% if is_incremental() %}
        and (occurred_at)
        > (select max(ship_start_at) from {{ this }})
    {% endif %}