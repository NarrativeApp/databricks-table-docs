{{ config(materialized="incremental") }}

select *
from select_events
where
    topic in (
        'select_ship_modal_closed',
        'select_image_rotated',
        'select_rename_images_dialog_closed',
        'select_tag_images',
        'select_rate_images',
        'select_color_images',
        'select_ship_modal_closed',
        'select_move_files',
        'select_image_rotated',
        'select_ingestion_started',
        'select_info_panel',
        'select_filter_used',
        'select_set_zoomed_face',
        'select_delete_project',
        'select_delete_images',
        'select_crop_applied',
        'select_copy_files',
        'select_change_capture_times_modal_closed',
        'select_close_ups'
    )

    {% if is_incremental() %}
        and inserted_at >= (select max(inserted_at) from {{ this }})

    {% endif %}
