{{ config(materialized="incremental") }}

with excluded_versions as (
    select *
    from (
        select '0.2.3' as version_number
        union all
        select '0.2.4'
        union all
        select '8.5.2'
        union all
        select '8.5.5'
        union all
        select '1.1.7'
        union all
        select '1.1.9'
        union all
        select '1.2.1'
        union all
        select '1.2.11'
        union all
        select '1.2.12'
        union all
        select '1.2.13'
        union all
        select '1.2.14'
        union all
        select '1.2.15'
    )
),
filtered_events as (
    select
        meta_app_version_number as version_number,
        (
            COALESCE(try_cast(from_json(meta_app_version_number_array, 'array<int>')[0] AS INTEGER), 0) * 1000000
        ) +
        (
            COALESCE(try_cast(from_json(meta_app_version_number_array, 'array<int>')[1] AS INTEGER), 0) * 1000
        ) +
        (
            COALESCE(try_cast(from_json(meta_app_version_number_array, 'array<int>')[2] AS INTEGER), 0)
        ) AS numeric_version,
        min(inserted_at) as released_at
    from select_events
    where meta_app_version_number is not null
      and meta_app_version_number not in (select version_number from excluded_versions)
      and meta_app_version_channel = 'stable'
      and meta_app_version_number not like '%alpha%'
    
    {% if is_incremental() %}
      and occurred_at >= 
          (select max(released_at) from {{ this }})
      and NOT EXISTS (
          select 1
          from {{ this }} t
          where meta_app_version_number = t.version_number
      )
    {% endif %}
    group by meta_app_version_number, meta_app_version_number_array
)

select *, rank() over (order by released_at) as release_order
from filtered_events
