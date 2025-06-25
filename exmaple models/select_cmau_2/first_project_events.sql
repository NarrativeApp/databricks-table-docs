
{{ config(materialized="incremental", 
          unique_key=["user_id","project_id"]) }}

with new_events as (
  select
    user_id,
    data:project_id::string as project_id,
    min(inserted_at) as first_inserted_at
  from select_events
  where vsn = 4
    and data:project_id is not null

    {% if is_incremental() %}
      and inserted_at > (select max(first_inserted_at) from {{ this }})
    {% endif %}
  group by 1,2
)

select
  user_id,
  project_id,
  first_inserted_at
from new_events
