-- ANA-27: Detailed Browser + Platform Rolling 28-day Analysis
-- Track browser-specific performance trends over time with full platform context
-- Date: 2025-06-26

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        DATE(occurred_at) AS start_date,
        meta_browser_os,
        meta_browser_name,
        meta_browser_user_agent,
        meta_browser_version,
        -- Ultra-detailed browser + platform classification
        CASE 
            -- iOS Browsers (all use WebKit but different wrappers)
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'safari' THEN 'Safari iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'chrome' THEN 'Chrome iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'firefox' THEN 'Firefox iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'edge' THEN 'Edge iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'opera' THEN 'Opera iOS'
            WHEN meta_browser_user_agent LIKE '%iPhone%' AND meta_browser_name = 'safari' THEN 'Safari iOS'
            WHEN meta_browser_user_agent LIKE '%iPhone%' AND meta_browser_name = 'chrome' THEN 'Chrome iOS'
            WHEN meta_browser_user_agent LIKE '%CriOS%' THEN 'Chrome iOS'  -- Chrome iOS user agent
            
            -- iPad Browsers (separate from iPhone)
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'safari' THEN 'Safari iPad'
            WHEN meta_browser_user_agent LIKE '%iPad%' AND meta_browser_name = 'chrome' THEN 'Chrome iPad'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'Safari iPad'  -- Default iPad to Safari
            
            -- Android Browsers
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'chrome' THEN 'Chrome Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'firefox' THEN 'Firefox Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'samsung' THEN 'Samsung Browser'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'opera' THEN 'Opera Android'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'edge' THEN 'Edge Android'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_name = 'chrome' THEN 'Chrome Android'
            WHEN meta_browser_user_agent LIKE '%SamsungBrowser%' THEN 'Samsung Browser'
            
            -- macOS Browsers
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'safari' THEN 'Safari macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'chrome' THEN 'Chrome macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'firefox' THEN 'Firefox macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'edge' THEN 'Edge macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'opera' THEN 'Opera macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'brave' THEN 'Brave macOS'
            
            -- Windows Browsers
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'chrome' THEN 'Chrome Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'edge' THEN 'Edge Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'firefox' THEN 'Firefox Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'safari' THEN 'Safari Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'opera' THEN 'Opera Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'brave' THEN 'Brave Windows'
            
            -- Linux Browsers
            WHEN meta_browser_os = 'Linux' AND meta_browser_name = 'chrome' THEN 'Chrome Linux'
            WHEN meta_browser_os = 'Linux' AND meta_browser_name = 'firefox' THEN 'Firefox Linux'
            WHEN meta_browser_os = 'Linux' AND meta_browser_name = 'opera' THEN 'Opera Linux'
            
            -- Fallback classifications
            WHEN meta_browser_name IS NOT NULL AND meta_browser_os IS NOT NULL 
                THEN CONCAT(meta_browser_name, ' ', meta_browser_os)
            ELSE 'Unknown Browser'
        END AS browser_platform,
        
        -- Platform category for grouping
        CASE 
            WHEN meta_browser_os = 'iOS' OR meta_browser_user_agent LIKE '%iPhone%' THEN 'iOS'
            WHEN meta_browser_os = 'Android' OR meta_browser_user_agent LIKE '%Android%' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'iPad'
            WHEN meta_browser_os IN ('macOS', 'Windows', 'Linux', 'Chrome OS') THEN 'Desktop'
            ELSE 'Other'
        END AS platform_category,
        
        -- Mobile vs Desktop
        CASE 
            WHEN meta_browser_os IN ('iOS', 'Android') THEN 'Mobile'
            WHEN meta_browser_user_agent LIKE '%Mobile%' OR meta_browser_user_agent LIKE '%Android%' THEN 'Mobile'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'Tablet'
            ELSE 'Desktop'
        END AS device_category,
        
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= '2023-03-01'  -- Start from when data begins
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
        AND occurred_at >= '2023-03-01'
),

signup_funnel AS (
    SELECT 
        s.session_id,
        s.sign_up_method,
        s.browser_platform,
        s.platform_category,
        s.device_category,
        s.started_at,
        s.start_date,
        c.completed_at,
        c.user_id,
        CASE 
            WHEN c.completed_at IS NOT NULL THEN 1 
            ELSE 0 
        END AS completed
    FROM signup_starts s
    LEFT JOIN signup_completes c 
        ON s.session_id = c.session_id
        AND c.completed_at >= s.started_at
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR
),

rolling_windows AS (
    -- Calculate metrics for each 28-day rolling window
    SELECT 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.browser_platform,
        f.platform_category,
        f.device_category,
        f.sign_up_method,
        COUNT(DISTINCT f.session_id) AS total_starts,
        COUNT(DISTINCT CASE WHEN f.completed = 1 THEN f.session_id END) AS total_completions
    FROM window_28_days w
    LEFT JOIN signup_funnel f 
        ON f.start_date >= w.start_day_inclusive 
        AND f.start_date <= w.end_day_inclusive
        AND f.sign_up_method IS NOT NULL
        AND f.browser_platform != 'Unknown Browser'
    WHERE w.start_day_inclusive >= '2023-04-01'  -- Allow buffer for rolling window
        AND w.end_day_inclusive <= CURRENT_DATE - INTERVAL 1 DAY
    GROUP BY 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.browser_platform,
        f.platform_category,
        f.device_category,
        f.sign_up_method
)

-- Calculate completion rates with focus on problematic browser+platform combinations
SELECT 
    start_day_inclusive,
    end_day_inclusive,
    browser_platform,
    platform_category,
    device_category,
    sign_up_method,
    total_starts,
    total_completions,
    ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2) AS completion_rate_pct,
    -- Calculate the gap between google and email for each browser
    ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2) - 
        LAG(ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2)) 
        OVER (PARTITION BY start_day_inclusive, browser_platform ORDER BY sign_up_method DESC) AS google_vs_email_gap
FROM rolling_windows
WHERE browser_platform IS NOT NULL
    AND sign_up_method IS NOT NULL
    AND total_starts >= 5  -- Lower threshold to capture more browser variations
    -- Focus on key problematic combinations
    AND (
        browser_platform IN ('Safari iOS', 'Chrome iOS', 'Chrome Android', 'Safari iPad')
        OR (device_category = 'Desktop' AND total_starts >= 20)
    )
ORDER BY 
    start_day_inclusive DESC, 
    device_category,
    platform_category,
    browser_platform, 
    sign_up_method;