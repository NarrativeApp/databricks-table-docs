{{
  config(
    materialized = 'incremental',
  )
}}

select *
from select_events
where
    topic in (
        'select_ship_modal_opened',
        'select_ship_modal_closed',
        'select_ship_modal_closed',
        'select_ship_command_sent_successfully',
        'select_ship_confirmation_not_possible', 
        'select_ship_confirmation_complete', 
        'select_ship_confirmation_partial_progress', 
        'select_ship_confirmation_cancelled', 
        'select_ship_confirmation_start'
    )
    
{% if is_incremental() %}
and occurred_at > (select max(occurred_at) from {{ this }})
{% endif %}