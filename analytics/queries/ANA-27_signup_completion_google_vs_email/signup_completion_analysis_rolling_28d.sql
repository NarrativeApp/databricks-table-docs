-- ANA-27: Sign up completion rates over time - Google vs Email (Rolling 28-day windows)
-- Shows how completion rates change over time using rolling 28-day periods
-- Updated to include ALL available historical data from 2023 onwards
-- Date: 2025-06-25

WITH signup_starts AS (
    -- Get all sign-up start events with date (ALL TIME)
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        DATE(occurred_at) AS start_date,
        data:app::string AS app,
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= '2023-03-01'  -- Start from when data begins (March 2023)
),

signup_completes AS (
    -- Get successful sign-up completions with date (ALL TIME)
    SELECT 
        data:session_id::string AS session_id,
        user_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS completed_at,
        DATE(occurred_at) AS complete_date,
        data:genre_array AS genre_array,
        data:personal_sign_up_source AS source,
        id as complete_event_id
    FROM web_events
    WHERE topic = 'web_sign_up_succeeded'
        AND data:session_id IS NOT NULL
        AND occurred_at >= '2023-03-01'
),

signup_funnel AS (
    -- Join starts with completions on session_id
    SELECT 
        s.session_id,
        s.sign_up_method,
        s.started_at,
        s.start_date,
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
        END AS minutes_to_complete,
        s.app,
        c.genre_array,
        c.source
    FROM signup_starts s
    LEFT JOIN signup_completes c 
        ON s.session_id = c.session_id
        AND c.completed_at >= s.started_at
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR  -- Within 24 hours
),

rolling_windows AS (
    -- Use the window_28_days table for rolling periods - ALL AVAILABLE HISTORY
    SELECT 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.sign_up_method,
        COUNT(DISTINCT f.session_id) AS total_starts,
        COUNT(DISTINCT CASE WHEN f.completed = 1 THEN f.session_id END) AS total_completions,
        AVG(CASE WHEN f.completed = 1 THEN f.minutes_to_complete END) AS avg_minutes_to_complete
    FROM window_28_days w
    LEFT JOIN signup_funnel f 
        ON f.start_date >= w.start_day_inclusive 
        AND f.start_date <= w.end_day_inclusive
        AND f.sign_up_method IS NOT NULL
    WHERE w.start_day_inclusive >= '2023-04-01'  -- Allow one month buffer for rolling window
        AND w.end_day_inclusive <= CURRENT_DATE - INTERVAL 1 DAY  -- Don't include incomplete periods
    GROUP BY 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.sign_up_method
)

-- Calculate completion rates for each 28-day window - FULL HISTORICAL TREND
SELECT 
    start_day_inclusive,
    end_day_inclusive,
    sign_up_method,
    total_starts,
    total_completions,
    -- Use try_divide to handle potential divide by zero
    ROUND(100.0 * TRY_DIVIDE(total_completions, total_starts), 2) AS completion_rate_pct,
    ROUND(avg_minutes_to_complete, 2) AS avg_minutes_to_complete
FROM rolling_windows
WHERE sign_up_method IS NOT NULL  -- Filter out windows with no sign-up data
    AND total_starts >= 10  -- Only include windows with meaningful sample size
ORDER BY start_day_inclusive ASC, sign_up_method  -- Chronological order to see full trend