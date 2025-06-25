{{ config(materialized="incremental") }}

select * from select_events 

where topic in ('select_feedback_dialog_opened', 'select_feedback_dialog_closed')

    {% if is_incremental() %}
        and inserted_at
        >= (select max(inserted_at) from {{ this }})
    {% endif %}
