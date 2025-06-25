{{ 
config(
  materialized = 'incremental',
  unique_key = 'modal_id',
  merge_exclude_columns = ['ship_confirmation_not_possible_step_at', 'ship_confirmation_not_possible'],
)
}}
select
  data:modal_id::string,
  (
    occurred_at
  ) as ship_confirmation_not_possible_step_at,
  topic as ship_confirmation_not_possible
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_confirmation_not_possible'
  and occurred_at > '2023-08-01'
{% if is_incremental() %}
and (occurred_at)
> (select max(ship_confirmation_not_possible_step_at) from {{ this }})
{% endif %}
