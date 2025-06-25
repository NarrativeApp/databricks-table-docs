select
  user_id,
  project_id,
  modal_id,
  numeric_version,
  case
    when ship_confirmation_complete is not null then 'ship_confirmation_complete'
    when ship_confirmation_partial_progress is not null then 'ship_confirmation_partial_progress'
    when ship_confirmation_start is not null then 'ship_confirmation_start'
    when ship_command_sent_successfully is not null then 'ship_command_sent_successfully'
    when ship_confirmation_not_possible is not null then 'ship_confirmation_not_possible'
    when select_ship_modal_closed_canceled is not null then 'select_ship_modal_closed_canceled'
    when select_ship_modal_closed is not null then 'select_ship_modal_closed'
    when select_ship_modal_opened is not null then 'select_ship_modal_opened'
    else null
  end as state,
  case
    when ship_confirmation_complete is not null then 8
    when ship_confirmation_partial_progress is not null then 7
    when ship_confirmation_start is not null then 6
    when ship_command_sent_successfully is not null then 5
    when ship_confirmation_not_possible is not null then 4
    when select_ship_modal_closed is not null then 3
    when select_ship_modal_closed_canceled is not null then 2
    when select_ship_modal_opened is not null then 1
    else null
  end as state_step,
  ship_start_at,
  coalesce(
    ship_confirmation_complete_step_at,
    ship_confirmation_partial_progress_step_at,
    ship_confirmation_start_step_at,
    ship_command_sent_successfully_step_at,
    select_ship_modal_closed_canceled_step_at,
    select_ship_modal_closed_step_at,
    ship_start_at
  ) as ship_end_at,
  catalog_resolution,
  selected_images_to_be_shipped,
  selected_ratings_to_be_shipped,
  selected_ship_image_count_ui,
  cast(ship_count as int) as ship_count,
  cast(greatest(confirmed_count_final, confirmed_count_partial) as int) as confirmed_count,
  cast(greatest(top_level_image_final, top_level_image_partial) as int) as top_level_image,
  -- ensure ship_count is treated as integer before comparing to 1
  greatest(cast(ship_count as int), 1) as non_zero_ship_count,
  -- calculate confirmation percentage safely
  confirmed_count * 1.0 / non_zero_ship_count as percentage_confirmed
from
  {{ ref('shipping_state_machine_collected_data') }}
where
  numeric_version > 1005005;
