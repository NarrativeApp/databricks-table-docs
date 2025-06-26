-- Explore additional dimensions available in sign-up events
-- Look for mobile/desktop, UTM sources, and other potential factors

SELECT 
    id,
    data:sign_up_method::string as sign_up_method,
    data:session_id::string as session_id,
    
    -- Device/Platform information  
    data:mobile_sign_up_os as mobile_os,
    data:tablet_sign_up_os as tablet_os,
    meta_browser_os,
    meta_browser_name,
    meta_browser_user_agent,
    
    -- UTM and traffic source
    data:personal_sign_up_source as sign_up_source,
    meta_utm_source,
    meta_utm_medium,
    meta_utm_campaign,
    meta_utm_content,
    meta_utm_term,
    
    -- User context
    data:app as app,
    occurred_at
    
FROM web_events
WHERE topic = 'web_lead_sign_up_started'
    AND data:sign_up_method IN ('email', 'google')
    AND data:session_id IS NOT NULL
    AND occurred_at >= CURRENT_DATE - INTERVAL 3 DAYS;