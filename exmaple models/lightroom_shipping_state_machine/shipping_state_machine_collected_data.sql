select
  user_id,
  project_id,
  so.modal_id,
  ship_start_at,
  select_ship_modal_opened,
  so.numeric_version, 
  smc.choice,
  smc.selected_ship_to,
  smc.selected_images_to_be_shipped,
  smc.selected_ratings_to_be_shipped,
  smc.selected_ship_image_count_ui,
  select_ship_modal_closed_step_at,
  select_ship_modal_closed,
  select_ship_modal_closed_canceled_step_at, 
  select_ship_modal_closed_canceled,
  scss.ship_command_sent_successfully_step_at,
  scss.ship_command_sent_successfully,
  scs.ship_count,
  scs.catalog_resolution,
  scs.ship_confirmation_start_step_at,
  scs.ship_confirmation_start,
  snp.ship_confirmation_not_possible_step_at,
  snp.ship_confirmation_not_possible,
  spp.confirmed_count_partial,
  spp.top_level_image_partial,
  spp.ship_confirmation_partial_progress_step_at,
  spp.ship_confirmation_partial_progress,
  scc.confirmed_count_final,
  scc.top_level_image_final,
  scca.reason, 
  scca.ship_confirmation_cancelled_step_at, 
  scca.ship_confirmation_cancelled,
  scc.ship_confirmation_complete_step_at,
  scc.ship_confirmation_complete
from
  {{ ref('select_ship_modal_opened') }} as so
  left join {{ ref('select_ship_modal_closed_shipped') }} AS smc on smc.modal_id = so.modal_id
  left join {{ ref('select_ship_modal_closed_canceled') }} as smcc on smcc.modal_id = so.modal_id
  left join {{ ref('ship_command_sent_successfully') }} scss on scss.modal_id = so.modal_id
  left join {{ ref('ship_confirmation_start') }} scs on scs.modal_id = so.modal_id
  left join {{ ref('ship_confirmation_not_possible') }} snp on snp.modal_id = so.modal_id
  left join {{ ref('ship_confirmation_partial_progress') }} spp on spp.modal_id = so.modal_id
  left join {{ ref('ship_confirmation_cancelled') }} scca on scca.modal_id = so.modal_id
  left join {{ ref('ship_confirmation_complete') }} scc on scc.modal_id = so.modal_id