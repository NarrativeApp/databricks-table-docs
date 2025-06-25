{{ 
config(
    materialized = 'incremental',
    unique_key = 'modal_id',
    merge_exclude_columns = ['ship_count', 'catalog_resolution', 'ship_confirmation_start_step_at', 'ship_confirmation_start' ],
)
}}
select
  data:modal_id::string,
  data:ship_count,
  data:catalog_resolution::string, 
  (
    occurred_at
  ) as ship_confirmation_start_step_at,
  topic as ship_confirmation_start
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_confirmation_start'
  and (occurred_at) > '2023-08-01'
{% if is_incremental() %}
and (occurred_at)
> (select max(ship_confirmation_start_step_at) from {{ this }})
{% endif %}
