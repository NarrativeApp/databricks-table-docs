select
  data:modal_id::string,
  topic as ship_confirmation_partial_progress,
  max(data:confirmed_count) as confirmed_count_partial,
  max(data:top_level_images) as top_level_image_partial,
  max(
    (
      occurred_at
    )
  ) as ship_confirmation_partial_progress_step_at,
  count(*) as progress_updates
from
  {{ ref('select_shipping_events') }}
where
  topic = 'select_ship_confirmation_partial_progress'
  and occurred_at > '2023-08-01'
group by
  1,
  2