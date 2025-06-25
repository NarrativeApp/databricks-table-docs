{{ config(materialized="incremental") }}

select * from select_events where (topic like '%style%' or topic like '%edit%') and inserted_at > '2023-11-20' and topic != 'select_ship_disable_open_in_editing_program'



    {% if is_incremental() %}
        and inserted_at >= (select max(inserted_at) from {{ this }})
    {% endif %}