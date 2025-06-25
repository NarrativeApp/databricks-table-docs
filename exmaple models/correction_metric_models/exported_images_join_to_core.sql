{{ config(
    materialized = 'incremental'
) }}

select
  *
from
  core.asset_previews
where
  asset_id in (
    select
      narrative_image_id::string
    from
      {{ ref('edited_images_joined_to_corrections') }}
  ) {% if is_incremental() %}
            
               and inserted_at >= (
                    select max(inserted_at)
                    from {{ this }} )
            
{% endif %}