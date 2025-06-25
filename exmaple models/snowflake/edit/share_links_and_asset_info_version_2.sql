{{ config(materialized="incremental") }}

   select
        sl.user_id,
        sl.account_id,
        sl.project_id as model_id,
        sl.share_link_id as model_version_id,
        av.asset_id,
        av.inserted_at::string as asset_versions_inserted_at,
        case
            when sl.previous_share_link_created_at is not null
            then 'correction'
            else 'base_model'
        end as model_version_type,
        sl.share_link_created_at as model_created_at,
        rank() over (
            partition by user_id, sl.project_id order by share_link_created_at asc
        ) as model_version_number
    from {{ ref("share_links_with_future_share_link") }} as sl
    join core.project_versions pv on pv.project_id = sl.project_id
    join core.set_asset_locations sa on sa.set_id = replace(replace(pv.set_ids, '{', ''), '}', '')
    join core.asset_locations al on al.id = sa.asset_location_id
    join core.asset_versions av on al.id = av.asset_location_id
        and (
            av.inserted_at >= previous_share_link_created_at
            or previous_share_link_created_at is null
        )
        and av.inserted_at <= share_link_created_at
    where
        av.inserted_at > '2023-12-01'
        {% if is_incremental() %}
            and av.inserted_at > (select max(asset_versions_inserted_at) from {{this}})
        {% endif %}