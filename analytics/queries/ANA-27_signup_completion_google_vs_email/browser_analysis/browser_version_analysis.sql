-- ANA-27: Browser Version Analysis
-- Analyze if specific browser versions have different OAuth performance
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
        -- Extract major version number
        CASE 
            WHEN meta_browser_version RLIKE '^[0-9]+' 
            THEN REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1)
            ELSE 'Unknown'
        END AS browser_major_version,
        -- Detailed browser + version + platform
        CASE 
            -- iOS Safari versions
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'safari' 
                THEN CONCAT('Safari iOS v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            -- iOS Chrome versions
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'chrome' 
                THEN CONCAT('Chrome iOS v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            -- Android Chrome versions
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'chrome' 
                THEN CONCAT('Chrome Android v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            -- Desktop browsers with versions
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'safari' 
                THEN CONCAT('Safari macOS v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'chrome' 
                THEN CONCAT('Chrome macOS v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            ELSE 'Other'
        END AS browser_version_platform,
        -- Simplified browser+platform (without version)
        CASE 
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'safari' THEN 'Safari iOS'
            WHEN meta_browser_os = 'iOS' AND meta_browser_name = 'chrome' THEN 'Chrome iOS'
            WHEN meta_browser_os = 'Android' AND meta_browser_name = 'chrome' THEN 'Chrome Android'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'safari' THEN 'Safari macOS'
            WHEN meta_browser_os = 'macOS' AND meta_browser_name = 'chrome' THEN 'Chrome macOS'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'chrome' THEN 'Chrome Windows'
            ELSE 'Other'
        END AS browser_platform,
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 90 DAYS  -- Recent data for version relevance
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
        AND occurred_at >= CURRENT_DATE - INTERVAL 90 DAYS
),

signup_funnel AS (
    SELECT 
        s.session_id,
        s.sign_up_method,
        s.browser_platform,
        s.browser_version_platform,
        s.browser_major_version,
        s.meta_browser_name,
        s.meta_browser_os,
        s.started_at,
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
)

-- Analyze by browser version for problematic platforms
SELECT 
    browser_platform,
    browser_major_version,
    sign_up_method,
    COUNT(DISTINCT session_id) AS total_starts,
    COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END) AS total_completions,
    ROUND(100.0 * TRY_DIVIDE(
        COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END), 
        COUNT(DISTINCT session_id)
    ), 2) AS completion_rate_pct,
    -- Version-specific insights
    CASE 
        WHEN COUNT(DISTINCT session_id) >= 50 THEN 'Good Sample'
        WHEN COUNT(DISTINCT session_id) >= 20 THEN 'Medium Sample'
        ELSE 'Small Sample'
    END AS sample_quality
FROM signup_funnel
WHERE browser_platform IN ('Safari iOS', 'Chrome iOS', 'Chrome Android', 'Safari macOS', 'Chrome macOS')
    AND browser_major_version != 'Unknown'
GROUP BY 
    browser_platform,
    browser_major_version,
    sign_up_method
HAVING COUNT(DISTINCT session_id) >= 10
ORDER BY 
    browser_platform,
    CAST(browser_major_version AS INT) DESC,
    sign_up_method;