{{ config(materialized="incremental") }}


select data:current_route::string, data:previous_route::string, data:tab_entity_type::string, * from select_events where topic  in (
'select_tab_opened',
'select_tab_focused',
'select_tab_evolved', 
'select_all_tabs_closed',
'select_tab_opened',
'select_tab_replaced',
'select_tab_bar_blurred',
'select_tab_closed',
'select_other_tabs_closed'
)


    {% if is_incremental() %}
        and inserted_at
        >= (select max(inserted_at) from {{ this }})
    {% endif %}
