{{ config(materialized="incremental") }}

select
    *,
    data:aftershoot::boolean,
    data:aftershoot_version::string,
    data:app_version_number::string,
    data:current_route::string,
    data:imagenAI::boolean,
    data:imagenAI_version::string,
    data:install_id::string,
    data:lightroom_cc::boolean,
    data:lightroom_cc_version::string,
    data:lightroom_classic::boolean,
    data:lightroom_classic_version::string,
    data:narrative_publish::boolean,
    data:narrative_publish_version::string,
    data:photo_mechanic::boolean,
    data:photo_mechanic_plus::boolean,
    data:photo_mechanic_plus_version::string,
    data:photo_mechanic_version::string,
    data:photoshop::boolean,
    data:photoshop_version::string
from select_events
where topic = 'select_installed_apps'


    {% if is_incremental() %}
        and inserted_at
        > (select max(inserted_at) from {{ this }})
    {% endif %}
