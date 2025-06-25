{{ 
config(
  materialized = 'incremental',
  unique_key = 'modal_id',
  merge_exclude_columns = ['ship_command_sent_successfully_step_at', 'ship_command_sent_successfully' ],
)
}}
select
  data:modal_id::string,
  (occurred_at) as ship_command_sent_successfully_step_at,
  topic as ship_command_sent_successfully
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_command_sent_successfully'
  and (occurred_at) > '2023-08-01'
{% if is_incremental() %}
and (occurred_at)
> (select max(ship_command_sent_successfully_step_at) from {{ this }})
{% endif %}
