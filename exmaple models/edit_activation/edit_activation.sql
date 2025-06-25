SELECT
  efi.user_id, 
  efi.first_edit_interaction,
  epse.first_edited_at as activated_at, 
  UNIX_TIMESTAMP(epse.first_edited_at) - UNIX_TIMESTAMP(efi.first_edit_interaction) as time_to_activate,
  CASE
    WHEN DATEDIFF(epse.first_edited_at, efi.first_edit_interaction) <= 1 THEN true
    ELSE false
  END as activated_within_1_day,
  CASE
    WHEN DATEDIFF(epse.first_edited_at, efi.first_edit_interaction) <= 14 THEN true
    ELSE false
  END as activated_within_14_days,
  CASE
    WHEN epse.first_edited_at IS NOT NULL THEN true
    ELSE false
  END as activated
FROM
  {{ ref('edit_first_interaction') }} efi
  LEFT JOIN {{ ref('edit_projects_second_edited') }} as epse ON epse.user_id = efi.user_id
