{{ config(materialized="incremental",
          unique_key="project_id") }}

with ranked as (
  select
    user_id,
    project_id,
    first_inserted_at,
    rank() over (
      partition by user_id
      order by first_inserted_at
    ) as project_number
  from {{ ref('first_project_events') }}
  where first_inserted_at >= '2021-01-01'
)

select *
from ranked
where project_number >= 2

{% if is_incremental() %}
  -- only load newly-ranked projects
  and project_id not in (select project_id from {{ this }})
{% endif %}