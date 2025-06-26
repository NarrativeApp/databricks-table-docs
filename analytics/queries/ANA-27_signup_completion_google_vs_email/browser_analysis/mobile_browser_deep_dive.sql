-- ANA-27: Mobile Browser Deep Dive
-- Detailed analysis of mobile browser behaviors with user agent parsing
-- Date: 2025-06-26

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        meta_browser_os,
        meta_browser_name,
        meta_browser_version,
        meta_browser_user_agent,
        data:referrer::string AS referrer,
        data:utm_source::string AS utm_source,
        data:utm_medium::string AS utm_medium,
        
        -- Ultra-detailed mobile browser detection
        CASE 
            -- iOS Browsers with specific detection
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'safari' AND meta_browser_user_agent NOT LIKE '%CriOS%' THEN 'Safari iOS (Native)'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'chrome' THEN 'Chrome iOS (WebKit)'
            WHEN meta_browser_user_agent LIKE '%CriOS%' THEN 'Chrome iOS (WebKit)'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'firefox' THEN 'Firefox iOS (WebKit)'
            WHEN meta_browser_user_agent LIKE '%FxiOS%' THEN 'Firefox iOS (WebKit)'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'edge' THEN 'Edge iOS (WebKit)'
            WHEN meta_browser_user_agent LIKE '%EdgiOS%' THEN 'Edge iOS (WebKit)'
            
            -- In-app browsers on iOS
            WHEN meta_browser_user_agent LIKE '%FBAN%' OR meta_browser_user_agent LIKE '%FBAV%' THEN 'Facebook iOS Browser'
            WHEN meta_browser_user_agent LIKE '%Instagram%' THEN 'Instagram iOS Browser'
            WHEN meta_browser_user_agent LIKE '%LinkedIn%' THEN 'LinkedIn iOS Browser'
            WHEN meta_browser_user_agent LIKE '%Twitter%' THEN 'Twitter iOS Browser'
            
            -- Android Browsers with specific detection
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'chrome' AND meta_browser_user_agent NOT LIKE '%SamsungBrowser%' THEN 'Chrome Android (Native)'
            WHEN meta_browser_user_agent LIKE '%SamsungBrowser%' THEN 'Samsung Browser'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'firefox' THEN 'Firefox Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'edge' THEN 'Edge Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'opera' THEN 'Opera Android'
            
            -- In-app browsers on Android
            WHEN meta_browser_user_agent LIKE '%Android%' AND (meta_browser_user_agent LIKE '%FBAN%' OR meta_browser_user_agent LIKE '%FBAV%') THEN 'Facebook Android Browser'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_user_agent LIKE '%Instagram%' THEN 'Instagram Android Browser'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_user_agent LIKE '%LinkedIn%' THEN 'LinkedIn Android Browser'
            
            -- WebView detection
            WHEN meta_browser_user_agent LIKE '%wv)%' OR meta_browser_user_agent LIKE '%WebView%' THEN 'Android WebView'
            
            -- iPad specific
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'safari' THEN 'Safari iPad'
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'chrome' THEN 'Chrome iPad'
            
            ELSE 'Other Mobile Browser'
        END AS detailed_browser,
        
        -- In-app browser detection
        CASE 
            WHEN meta_browser_user_agent LIKE '%FBAN%' OR meta_browser_user_agent LIKE '%FBAV%' THEN 'Facebook App'
            WHEN meta_browser_user_agent LIKE '%Instagram%' THEN 'Instagram App'
            WHEN meta_browser_user_agent LIKE '%LinkedIn%' THEN 'LinkedIn App'
            WHEN meta_browser_user_agent LIKE '%Twitter%' THEN 'Twitter App'
            WHEN meta_browser_user_agent LIKE '%Snapchat%' THEN 'Snapchat App'
            WHEN meta_browser_user_agent LIKE '%Pinterest%' THEN 'Pinterest App'
            WHEN meta_browser_user_agent LIKE '%wv)%' OR meta_browser_user_agent LIKE '%WebView%' THEN 'WebView'
            ELSE 'Native Browser'
        END AS app_context,
        
        -- iOS version detection
        CASE 
            WHEN meta_browser_user_agent LIKE '%OS 17%' THEN 'iOS 17'
            WHEN meta_browser_user_agent LIKE '%OS 16%' THEN 'iOS 16'
            WHEN meta_browser_user_agent LIKE '%OS 15%' THEN 'iOS 15'
            WHEN meta_browser_user_agent LIKE '%OS 14%' THEN 'iOS 14'
            WHEN meta_browser_os = 'iOS' THEN 'iOS (Other)'
            WHEN meta_browser_user_agent LIKE '%Android 14%' THEN 'Android 14'
            WHEN meta_browser_user_agent LIKE '%Android 13%' THEN 'Android 13'
            WHEN meta_browser_user_agent LIKE '%Android 12%' THEN 'Android 12'
            WHEN meta_browser_user_agent LIKE '%Android 11%' THEN 'Android 11'
            WHEN meta_browser_os = 'Android' THEN 'Android (Other)'
            ELSE 'Unknown OS Version'
        END AS os_version,
        
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 180 DAYS  -- Last 6 months
        AND (meta_browser_os IN ('iOS', 'Android') OR meta_browser_user_agent LIKE '%Mobile%')
),

signup_completes AS (
    SELECT 
        data:session_id::string AS session_id,
        user_id,
        occurred_at AS completed_at,
        id as complete_event_id
    FROM web_events
    WHERE topic = 'web_sign_up_succeeded'
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 180 DAYS
),

signup_funnel AS (
    SELECT 
        s.session_id,
        s.sign_up_method,
        s.detailed_browser,
        s.app_context,
        s.os_version,
        s.utm_source,
        s.utm_medium,
        s.started_at,
        c.completed_at,
        c.user_id,
        CASE 
            WHEN c.completed_at IS NOT NULL THEN 1 
            ELSE 0 
        END AS completed,
        -- Time to complete
        CASE 
            WHEN c.completed_at IS NOT NULL 
            THEN TIMESTAMPDIFF(MINUTE, s.started_at, c.completed_at)
            ELSE NULL 
        END AS minutes_to_complete
    FROM signup_starts s
    LEFT JOIN signup_completes c 
        ON s.session_id = c.session_id
        AND c.completed_at >= s.started_at
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR
)

-- Analyze by detailed browser and app context
SELECT 
    detailed_browser,
    app_context,
    sign_up_method,
    COUNT(DISTINCT session_id) AS total_starts,
    COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END) AS total_completions,
    ROUND(100.0 * TRY_DIVIDE(
        COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END), 
        COUNT(DISTINCT session_id)
    ), 2) AS completion_rate_pct,
    -- Additional insights
    AVG(CASE WHEN completed = 1 THEN minutes_to_complete END) AS avg_minutes_to_complete,
    COUNT(DISTINCT CASE WHEN utm_source IS NOT NULL THEN session_id END) AS sessions_with_utm,
    -- Traffic source breakdown
    COUNT(DISTINCT CASE WHEN utm_source = 'google' THEN session_id END) AS google_traffic,
    COUNT(DISTINCT CASE WHEN utm_source = 'facebook' THEN session_id END) AS facebook_traffic,
    COUNT(DISTINCT CASE WHEN utm_source = 'instagram' THEN session_id END) AS instagram_traffic,
    -- Sample size indicator
    CASE 
        WHEN COUNT(DISTINCT session_id) >= 100 THEN 'High Confidence'
        WHEN COUNT(DISTINCT session_id) >= 30 THEN 'Medium Confidence'
        ELSE 'Low Confidence'
    END AS confidence_level
FROM signup_funnel
WHERE detailed_browser != 'Other Mobile Browser'
GROUP BY 
    detailed_browser,
    app_context,
    sign_up_method
HAVING COUNT(DISTINCT session_id) >= 10
ORDER BY 
    total_starts DESC,
    detailed_browser,
    sign_up_method;