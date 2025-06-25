{{ config(
    materialized = 'incremental'
) }}

select
distinct 
  e.user_id,
  e.account_id,
  se.data:style_id::string,
  e.share_link_id_used,
  e.time_saved_score_used,
  e.training_approach_used,
  sei.style_type,
  se.data:narrative_image_id::string,
  last_value(se.data:correction) OVER (
    partition by
      e.user_id, 
      e.share_link_id_used, 
      se.data:narrative_image_id::string
    ORDER BY
      se.data:correction ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) as correction,
     last_value(se.data:develop_settings::string) OVER (
    partition by
      e.user_id, 
      e.share_link_id_used, 
      se.data:narrative_image_id::string
    ORDER BY
      se.data:correction ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) as develop_settings,
  e.project_id::string,
     last_value(edited_at) OVER (
    partition by
      e.user_id, 
      e.share_link_id_used, 
      se.data:narrative_image_id::string
    ORDER BY
      se.data:correction ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) as edited_at,
  e.temperature,
  e.tint,
  e.exposure,
  e.contrast,
  e.whites,
  e.blacks,
  e.shadows,
  e.highlights, 
    last_value(inserted_at) OVER (
    partition by
      e.user_id, 
      e.share_link_id_used, 
      se.data:narrative_image_id::string
    ORDER BY
      se.data:correction ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) as inserted_at
from
  {{ ref('select_edit_style_related_events') }} se
  join {{ ref('edited_images_with_model_information') }} e on e.data:narrative_forever_image_id = se.data:narrative_image_id
  and se.data:style_id::string = e.style_id
  and edited_at < inserted_at
  join {{ ref('select_edit_inference_summary') }} sei on sei.style_id = se.data:style_id::string
where
  topic = 'select_select_edited_image_exported_from_lightroom'  

  {% if is_incremental() %}
            
              and se.inserted_at >= (
                    select max(edited_at)
                    from {{ this }} )
            
{% endif %}