SELECT 
distinct
  edited_images_joined_to_corrections.*, 
  exported_images_join_to_core.asset_id, 
  exported_images_join_to_core.id as asset_preview_id
FROM
  {{ ref('edited_images_joined_to_corrections') }}
  left join {{ ref('exported_images_join_to_core') }} exported_images_join_to_core on exported_images_join_to_core.asset_id = narrative_image_id