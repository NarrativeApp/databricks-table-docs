-- ANA-27: iOS vs Android Rolling 28-day Analysis
-- See how platform-specific completion rates have changed over time
-- Date: 2025-06-25

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        DATE(occurred_at) AS start_date,
        meta_browser_os,
        meta_browser_user_agent,
        -- More granular device classification
        CASE 
            WHEN meta_browser_os = 'iOS' THEN 'iOS'
            WHEN meta_browser_os = 'Android' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPhone%' OR meta_browser_user_agent LIKE '%iOS%' THEN 'iOS'
            WHEN meta_browser_user_agent LIKE '%Android%' AND meta_browser_user_agent LIKE '%Mobile%' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'iPad'
            WHEN meta_browser_os IN ('macOS', 'Windows', 'Linux', 'Chrome OS') THEN 'Desktop'
            ELSE 'Other'
        END AS platform,
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
        s.platform,
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
    -- Use the window_28_days table for rolling periods
    SELECT 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.platform,
        f.sign_up_method,
        COUNT(DISTINCT f.session_id) AS total_starts,
        COUNT(DISTINCT CASE WHEN f.completed = 1 THEN f.session_id END) AS total_completions
    FROM window_28_days w
    LEFT JOIN signup_funnel f 
        ON f.start_date >= w.start_day_inclusive 
        AND f.start_date <= w.end_day_inclusive
        AND f.sign_up_method IS NOT NULL
        AND f.platform IN ('iOS', 'Android', 'Desktop')  -- Focus on main platforms
    WHERE w.start_day_inclusive >= '2023-04-01'  -- Allow buffer for rolling window
        AND w.end_day_inclusive <= CURRENT_DATE - INTERVAL 1 DAY
    GROUP BY 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.platform,
        f.sign_up_method
)

-- Calculate completion rates for each 28-day window by platform and method
SELECT 
    start_day_inclusive,
    end_day_inclusive,
    platform,
    sign_up_method,
    total_starts,
    total_completions,
    ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2) AS completion_rate_pct
FROM rolling_windows
WHERE platform IS NOT NULL
    AND sign_up_method IS NOT NULL
    AND total_starts >= 3  -- Lower minimum for mobile platforms
ORDER BY start_day_inclusive ASC, platform, sign_up_method;