-- ANA-27: Sign up completion rates - Pivot view for trend analysis
-- Pivots the rolling 28-day data to show email vs google side by side
-- Date: 2025-01-25

WITH rolling_data AS (
    SELECT 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.sign_up_method,
        COUNT(DISTINCT f.session_id) AS total_starts,
        COUNT(DISTINCT CASE WHEN f.completed = 1 THEN f.session_id END) AS total_completions,
        AVG(CASE WHEN f.completed = 1 THEN f.minutes_to_complete END) AS avg_minutes_to_complete
    FROM window_28_days w
    LEFT JOIN (
        SELECT 
            s.session_id,
            s.sign_up_method,
            s.started_at,
            DATE(s.occurred_at) AS start_date,
            CASE 
                WHEN c.completed_at IS NOT NULL THEN 1 
                ELSE 0 
            END AS completed,
            CASE 
                WHEN c.completed_at IS NOT NULL 
                THEN TIMESTAMPDIFF(MINUTE, s.started_at, c.completed_at)
                ELSE NULL 
            END AS minutes_to_complete
        FROM web_events s
        LEFT JOIN web_events c 
            ON s.data:session_id::string = c.data:session_id::string
            AND c.topic = 'web_sign_up_succeeded'
            AND c.occurred_at >= s.occurred_at
            AND c.occurred_at <= s.occurred_at + INTERVAL 24 HOUR
        WHERE s.topic = 'web_lead_sign_up_started'
            AND s.data:sign_up_method IN ('email', 'google')
            AND s.data:session_id IS NOT NULL
            AND s.occurred_at >= '2024-01-01'
    ) f ON f.start_date >= w.start_day_inclusive 
        AND f.start_date <= w.end_day_inclusive
    WHERE w.start_day_inclusive >= '2024-02-01'
        AND w.end_day_inclusive <= CURRENT_DATE - INTERVAL 1 DAY
    GROUP BY 
        w.start_day_inclusive,
        w.end_day_inclusive,
        f.sign_up_method
)

SELECT 
    start_day_inclusive,
    end_day_inclusive,
    -- Email metrics
    MAX(CASE WHEN sign_up_method = 'email' THEN total_starts END) AS email_starts,
    MAX(CASE WHEN sign_up_method = 'email' THEN total_completions END) AS email_completions,
    ROUND(100.0 * TRY_DIVIDE(
        MAX(CASE WHEN sign_up_method = 'email' THEN total_completions END),
        MAX(CASE WHEN sign_up_method = 'email' THEN total_starts END)
    ), 2) AS email_completion_rate,
    
    -- Google metrics
    MAX(CASE WHEN sign_up_method = 'google' THEN total_starts END) AS google_starts,
    MAX(CASE WHEN sign_up_method = 'google' THEN total_completions END) AS google_completions,
    ROUND(100.0 * TRY_DIVIDE(
        MAX(CASE WHEN sign_up_method = 'google' THEN total_completions END),
        MAX(CASE WHEN sign_up_method = 'google' THEN total_starts END)
    ), 2) AS google_completion_rate,
    
    -- Difference (Email - Google)
    ROUND(
        ROUND(100.0 * TRY_DIVIDE(
            MAX(CASE WHEN sign_up_method = 'email' THEN total_completions END),
            MAX(CASE WHEN sign_up_method = 'email' THEN total_starts END)
        ), 2) -
        ROUND(100.0 * TRY_DIVIDE(
            MAX(CASE WHEN sign_up_method = 'google' THEN total_completions END),
            MAX(CASE WHEN sign_up_method = 'google' THEN total_starts END)
        ), 2)
    , 2) AS email_advantage_pct
    
FROM rolling_data
WHERE sign_up_method IS NOT NULL
GROUP BY start_day_inclusive, end_day_inclusive
HAVING MAX(CASE WHEN sign_up_method = 'email' THEN total_starts END) >= 10
   AND MAX(CASE WHEN sign_up_method = 'google' THEN total_starts END) >= 10
ORDER BY start_day_inclusive DESC;