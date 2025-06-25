SELECT
  user_id,
  run_id,
  min(first_scanned_at) as first_scan_start_at,
  max(first_scanned_at) as last_scan_start_at,
  sum(available_images)::int total_images_available_for_index,
  sum(edited_images)::int total_images_edited_for_index,
  sum(exports_and_edited_images)::int total_images_edited_and_exported_for_index
FROM
  (
    select
      user_id,
      data:run_id,
      case
        when SPLIT_PART(data:catalog_path, '-v1', 2) = '' then SPLIT_PART(data:catalog_path, '.lrcat', 1)
        else SPLIT_PART(data:catalog_path, '-v1', 1)
      end as reformed_path,
      data:external_volume,
      max(data:available_image_count) as available_images,
      max(data:edited_images_count) as edited_images,
      max(data:exports_and_edited_images_count) as exports_and_edited_images,
      min(inserted_at) as first_scanned_at
    from
      {{ ref("select_edit_style_related_events") }}
    where
      topic = 'select_style_end_index_catalog'
      and data:available_image_count > 0
    group by
      1,
      2,
      3,
      4
    order by
      2,
      3
  )
where
  available_images > 0
group by
  1,
  2