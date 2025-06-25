{{ config(
    materialized = 'incremental',
    unique_key = 'user_id',
    merge_exclude_columns = ['user_id', 'signed_in_at']
) }}
select *
from
    (
        select
            user_id,
            min(
                inserted_at
            ) as signed_in_at, 
            max(inserted_at) as last_signed_in_at
        from select_events s

        {% if is_incremental() %}
            where
                inserted_at >= (
                    select max(signed_in_at)
                    from {{ this }} )
             and not exists (select user_id from {{ this }} t where s.user_id = t.user_id)
        {% endif %}

        group by user_id
    )
where signed_in_at >= '2021-01-01'
