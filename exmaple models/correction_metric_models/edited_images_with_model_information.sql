select distinct
  i.account_id,
  i.share_link_id as share_link_id_used,
  i.model_info_super.time_saved_score as time_saved_score_used,
  sei.*,
  share_link_id,
  next_share_link_id_inserted_at, 
  i.training_approach as training_approach_used
from
  {{ ref('select_edited_images') }} sei
  join (
    select
      *,
      LEAD(inserted_at) OVER (
        PARTITION BY
          user_id,
          style_id
        ORDER BY
          inserted_at
      ) AS next_share_link_id_inserted_at
    from
      {{ ref('select_edit_styles_created') }}
  ) i on sei.style_id = i.style_id
  and (
    sei.edited_at < i.next_share_link_id_inserted_at
    or next_share_link_id_inserted_at is null
  )
  and sei.edited_at >= inserted_at