{{ config(materialized="incremental", unique_key="project_id") }}

select
DISTINCT	
    user_id,
    data_project_id as project_id,
    data:project_image_count::int, 
     FIRST_VALUE(meta_app_version_number) OVER (partition by user_id, data_project_id  ORDER BY occurred_at ROWS BETWEEN UNBOUNDED PRECEDING
          AND UNBOUNDED FOLLOWING) as meta_app_version_number, 
      FIRST_VALUE(inserted_at) OVER (partition by user_id, data_project_id  ORDER BY occurred_at ROWS BETWEEN UNBOUNDED PRECEDING
          AND UNBOUNDED FOLLOWING) as first_inserted_at,
FIRST_VALUE(occurred_at) OVER (partition by user_id, data_project_id  ORDER BY occurred_at ROWS BETWEEN UNBOUNDED PRECEDING
          AND UNBOUNDED FOLLOWING) as first_occurred_at
from select_events se
where
    vsn = 4 and data_project_id is not null

    {% if is_incremental() %}
        and occurred_at > (select max(first_occurred_at) from {{ this }})
        and not exists (select 1 from {{ this }} t where t.project_id = data_project_id)
    {% endif %}

