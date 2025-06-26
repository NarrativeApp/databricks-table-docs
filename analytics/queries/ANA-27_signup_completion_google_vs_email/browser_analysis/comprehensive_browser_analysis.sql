-- ANA-27: Comprehensive Browser + Platform Analysis
-- Detailed analysis by specific browser/platform combinations
-- Date: 2025-06-25

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        meta_browser_os,
        meta_browser_name,
        meta_browser_user_agent,
        -- Detailed browser + platform classification
        CASE 
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'safari' THEN 'Safari iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'chrome' THEN 'Chrome iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'firefox' THEN 'Firefox iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'edge' THEN 'Edge iOS'
            WHEN meta_browser_user_agent LIKE '%iPhone%' AND meta_browser_name = 'safari' THEN 'Safari iOS'
            WHEN meta_browser_user_agent LIKE '%iPhone%' AND meta_browser_name = 'chrome' THEN 'Chrome iOS'
            
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'chrome' THEN 'Chrome Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'firefox' THEN 'Firefox Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'samsung' THEN 'Samsung Android'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_name = 'chrome' THEN 'Chrome Android'
            
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'safari' THEN 'Safari iPad'
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'chrome' THEN 'Chrome iPad'
            
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'safari' THEN 'Safari macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'chrome' THEN 'Chrome macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'firefox' THEN 'Firefox macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'edge' THEN 'Edge macOS'
            
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'chrome' THEN 'Chrome Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'edge' THEN 'Edge Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'firefox' THEN 'Firefox Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'safari' THEN 'Safari Windows'
            
            WHEN meta_browser_os = 'Linux' AND meta_browser_name = 'chrome' THEN 'Chrome Linux'
            WHEN meta_browser_os = 'Linux' AND meta_browser_name = 'firefox' THEN 'Firefox Linux'
            
            ELSE 'Other/Unknown'
        END AS browser_platform,
        
        -- Simplified categories for grouping
        CASE 
            WHEN meta_browser_os = 'iOS' THEN 'iOS'
            WHEN meta_browser_os = 'Android' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPhone%' THEN 'iOS'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_user_agent LIKE '%Mobile%' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'iPad'
            WHEN meta_browser_os IN ('macOS', 'Windows', 'Linux', 'Chrome OS') THEN 'Desktop'
            ELSE 'Other'
        END AS platform_category,
        
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 365 DAYS  -- Last year of data
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
        AND occurred_at >= CURRENT_DATE - INTERVAL 365 DAYS
),

signup_funnel AS (
    SELECT 
        s.session_id,
        s.sign_up_method,
        s.browser_platform,
        s.platform_category,
        s.meta_browser_os,
        s.meta_browser_name,
        s.started_at,
        c.completed_at,
        c.user_id,
        CASE 
            WHEN c.completed_at IS NOT NULL THEN 1 
            ELSE 0 
        END AS completed,
        -- Time to complete in minutes
        CASE 
            WHEN c.completed_at IS NOT NULL 
            THEN TIMESTAMPDIFF(MINUTE, s.started_at, c.completed_at)
            ELSE NULL 
        END AS minutes_to_complete
    FROM signup_starts s
    LEFT JOIN signup_completes c 
        ON s.session_id = c.session_id
        AND c.completed_at >= s.started_at
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR  -- Within 24 hours
)

-- Calculate completion rates by detailed browser+platform combination
SELECT 
    browser_platform,
    platform_category,
    sign_up_method,
    COUNT(DISTINCT session_id) AS total_starts,
    COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END) AS total_completions,
    -- Use try_divide to handle potential divide by zero
    ROUND(100.0 * TRY_DIVIDE(
        COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END), 
        COUNT(DISTINCT session_id)
    ), 2) AS completion_rate_pct,
    -- Additional metrics
    AVG(CASE WHEN completed = 1 THEN minutes_to_complete END) AS avg_minutes_to_complete,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CASE WHEN completed = 1 THEN minutes_to_complete END) AS median_minutes_to_complete,
    -- Sample sizes for statistical significance
    CASE 
        WHEN COUNT(DISTINCT session_id) >= 100 THEN 'Significant'
        WHEN COUNT(DISTINCT session_id) >= 30 THEN 'Medium'
        WHEN COUNT(DISTINCT session_id) >= 10 THEN 'Small'
        ELSE 'Very Small'
    END AS sample_size_category
FROM signup_funnel
WHERE browser_platform != 'Other/Unknown'  -- Focus on identifiable combinations
GROUP BY browser_platform, platform_category, sign_up_method
HAVING COUNT(DISTINCT session_id) >= 10  -- Only show meaningful sample sizes
ORDER BY platform_category, total_starts DESC;