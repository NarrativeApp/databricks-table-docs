-- ANA-27: Sign up completion rates - Google vs Email
-- Theory: Users who sign up with email + password are less likely to complete sign up
-- Date: 2025-01-25
-- Updated to use session_id for joining (transaction_id is null in the data)

-- Get all sign-up start events
WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        data:app::string AS app,
        id as start_event_id
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 365 DAYS  -- Last year of data
),

-- Get successful sign-up completions
signup_completes AS (
    SELECT 
        data:session_id::string AS session_id,
        user_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS completed_at,
        data:genre_array AS genre_array,
        data:personal_sign_up_source AS source,
        id as complete_event_id
    FROM web_events
    WHERE topic = 'web_sign_up_succeeded'
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 365 DAYS
),

-- Join starts with completions on session_id
signup_funnel AS (
    SELECT 
        s.session_id,
        s.sign_up_method,
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
        END AS minutes_to_complete,
        s.app,
        c.genre_array,
        c.source
    FROM signup_starts s
    LEFT JOIN signup_completes c 
        ON s.session_id = c.session_id
        AND c.completed_at >= s.started_at
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR  -- Within 24 hours
)

-- Calculate completion rates by method
SELECT 
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
    -- Recent trend (last 30 days)
    ROUND(100.0 * TRY_DIVIDE(
        COUNT(DISTINCT CASE WHEN completed = 1 AND started_at >= CURRENT_DATE - INTERVAL 30 DAYS THEN session_id END),
        COUNT(DISTINCT CASE WHEN started_at >= CURRENT_DATE - INTERVAL 30 DAYS THEN session_id END)
    ), 2) AS completion_rate_last_30_days
FROM signup_funnel
GROUP BY sign_up_method
ORDER BY sign_up_method;