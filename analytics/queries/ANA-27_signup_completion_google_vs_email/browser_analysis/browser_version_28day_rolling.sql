-- ANA-27: Browser Version 28-day Rolling Analysis with Desktop vs Mobile
-- Track browser version performance trends over time with detailed platform context
-- Date: 2025-06-26

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        DATE(occurred_at) AS start_date,
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
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'chrome' 
                THEN CONCAT('Chrome Windows v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'edge' 
                THEN CONCAT('Edge Windows v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'firefox' 
                THEN CONCAT('Firefox Windows v', COALESCE(REGEXP_EXTRACT(meta_browser_version, '^([0-9]+)', 1), '?'))
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
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'edge' THEN 'Edge Windows'
            WHEN meta_browser_os = 'Windows' AND meta_browser_name = 'firefox' THEN 'Firefox Windows'
            ELSE 'Other'
        END AS browser_platform,
        -- Desktop vs Mobile categorization
        CASE 
            WHEN meta_browser_os IN ('iOS', 'Android') THEN 'Mobile'
            WHEN meta_browser_user_agent LIKE '%Mobile%' OR meta_browser_user_agent LIKE '%Android%' THEN 'Mobile'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'Tablet'
            WHEN meta_browser_os IN ('macOS', 'Windows', 'Linux', 'Chrome OS') THEN 'Desktop'
            ELSE 'Unknown'
        END AS device_category,
        -- Platform category for grouping
        CASE 
            WHEN meta_browser_os = 'iOS' OR meta_browser_user_agent LIKE '%iPhone%' THEN 'iOS'
            WHEN meta_browser_os = 'Android' OR meta_browser_user_agent LIKE '%Android%' THEN 'Android'
            WHEN meta_browser_user_agent LIKE '%iPad%' THEN 'iPad'
            WHEN meta_browser_os = 'macOS' THEN 'macOS'
            WHEN meta_browser_os = 'Windows' THEN 'Windows'
            WHEN meta_browser_os = 'Linux' THEN 'Linux'
            ELSE 'Other'
        END AS platform_category,
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= '2023-03-01'  -- Full historical data
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
        s.browser_version_platform,
        s.browser_major_version,
        s.device_category,
        s.platform_category,
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
    -- Calculate metrics for each 28-day rolling window by browser version and device category
    SELECT 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.browser_platform,
        f.browser_major_version,
        f.device_category,
        f.platform_category,
        f.sign_up_method,
        COUNT(DISTINCT f.session_id) AS total_starts,
        COUNT(DISTINCT CASE WHEN f.completed = 1 THEN f.session_id END) AS total_completions
    FROM window_28_days w
    LEFT JOIN signup_funnel f 
        ON f.start_date >= w.start_day_inclusive 
        AND f.start_date <= w.end_day_inclusive
        AND f.sign_up_method IS NOT NULL
        AND f.browser_platform != 'Other'
        AND f.browser_major_version != 'Unknown'
    WHERE w.start_day_inclusive >= '2023-04-01'  -- Allow buffer for rolling window
        AND w.end_day_inclusive <= CURRENT_DATE - INTERVAL 1 DAY
    GROUP BY 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.browser_platform,
        f.browser_major_version,
        f.device_category,
        f.platform_category,
        f.sign_up_method
),

completion_rates AS (
    SELECT 
        start_day_inclusive,
        end_day_inclusive,
        browser_platform,
        browser_major_version,
        device_category,
        platform_category,
        sign_up_method,
        total_starts,
        total_completions,
        ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2) AS completion_rate_pct,
        -- Sample size quality
        CASE 
            WHEN total_starts >= 50 THEN 'High Confidence'
            WHEN total_starts >= 20 THEN 'Medium Confidence'
            WHEN total_starts >= 5 THEN 'Low Confidence'
            ELSE 'Very Low Confidence'
        END AS confidence_level
    FROM rolling_windows
    WHERE browser_platform IS NOT NULL
        AND sign_up_method IS NOT NULL
        AND total_starts >= 3  -- Minimum threshold for inclusion
),

google_email_gaps AS (
    -- Calculate the gap between Google and Email for each browser+version+device combo
    SELECT 
        cr.*,
        -- Calculate Google vs Email gap
        cr.completion_rate_pct - 
            LAG(cr.completion_rate_pct) OVER (
                PARTITION BY cr.start_day_inclusive, cr.browser_platform, cr.browser_major_version, cr.device_category 
                ORDER BY cr.sign_up_method DESC
            ) AS google_vs_email_gap
    FROM completion_rates cr
)

-- Final output with focus on major browsers and recent trends
SELECT 
    start_day_inclusive,
    end_day_inclusive,
    device_category,
    platform_category,
    browser_platform,
    browser_major_version,
    sign_up_method,
    total_starts,
    total_completions,
    completion_rate_pct,
    google_vs_email_gap,
    confidence_level,
    -- Version trend indicators
    CASE 
        WHEN browser_major_version = '137' AND browser_platform LIKE '%Chrome%' THEN 'Current Chrome'
        WHEN browser_major_version = '136' AND browser_platform LIKE '%Chrome%' THEN 'Previous Chrome'
        WHEN browser_major_version = '18' AND browser_platform LIKE '%Safari%' THEN 'Current Safari'
        WHEN browser_major_version = '17' AND browser_platform LIKE '%Safari%' THEN 'Previous Safari'
        ELSE 'Other Version'
    END AS version_category
FROM google_email_gaps
WHERE 
    -- Focus on major browsers and platforms
    (
        browser_platform IN ('Safari iOS', 'Chrome iOS', 'Chrome Android', 'Safari macOS', 'Chrome macOS', 'Chrome Windows', 'Edge Windows', 'Firefox Windows')
        OR (device_category = 'Mobile' AND total_starts >= 5)
    )
    -- Focus on recent data and meaningful sample sizes
    AND start_day_inclusive >= CURRENT_DATE - INTERVAL 120 DAYS  -- Last 4 months of rolling windows
    AND total_starts >= 3
ORDER BY 
    start_day_inclusive DESC,
    device_category,
    platform_category,
    browser_platform,
    CAST(browser_major_version AS INT) DESC,
    sign_up_method;