{{ config(materialized="incremental") }}


select
    ws.session_id,
    case
        when
            data:landing_page is null
            and (meta_utm_source is null or meta_utm_source = '')
            and (meta_utm_medium is null or meta_utm_medium = '')
        then 'direct/organic'
        when
            meta_utm_source = 'ytorganic'
            or meta_utm_source = 'instagram.com'
            or meta_utm_source = 'fborganic'
            or meta_utm_source = 'tiktokorganic'
        then 'organic social'
        when
            meta_utm_medium = 'fb_paid'
            or meta_utm_medium = 'fbpaid'
            or meta_utm_medium = 'ytpaid'
            or meta_utm_medium = 'tiktok_paid'
            or meta_utm_medium = 'linkedin_paid'
        then 'performance ads social'
        when meta_utm_medium = 'cpc' or meta_utm_medium = 'cpm'
        then 'performance ads google'
        when meta_utm_source = 'paid_content'
        then 'paid content'
        when meta_utm_source = 'email'
        then 'email'
        when meta_utm_source != '' and meta_utm_source != 'select_app'
        then 'other'
        when
            data:landing_page like '%?affiliate=%'
            or data:landing_page like '%?fp_ref=%'
            or data:landing_page like '%&affiliate=%'
            or data:landing_page like '%&fp_ref=%'
        then 'affiliate'
        when data:landing_page like '%?referral=%'
        then 'referral'
        when meta_utm_source = 'select_app'
        then 'FROM_SELECT'
        else 'DUN FUCKED UP'
    end as channel,
    meta_utm_term,
    meta_utm_medium,
    meta_utm_source,
    meta_utm_content,
    meta_utm_campaign,
    data:path::string,
    first_visit_at
from web_events we
join
    {{ ref("web_first_sessions") }} ws on we.id = ws.first_event_id

    {% if is_incremental() %}
        and (occurred_at)
        > (select max(first_visit_at) from {{ this }})
        and not exists (
            select 1 from {{ this }} t where data:session_id::string = t.session_id
        )
    {% endif %}
