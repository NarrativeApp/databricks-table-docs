-- ANA-27: Sign up method proportions over time
-- Shows trend of Google vs Email signup method preferences
-- Date: 2025-01-25

WITH signup_trends AS (
    SELECT 
        DATE(occurred_at) AS signup_date,
        data:sign_up_method::string AS sign_up_method,
        COUNT(DISTINCT data:session_id::string) AS daily_starts
    FROM web_events
    WHERE topic = 'web_lead_sign_up_started'
        AND data:sign_up_method IN ('email', 'google')
        AND data:session_id IS NOT NULL
        AND occurred_at >= CURRENT_DATE - INTERVAL 90 DAYS  -- Last 3 months
    GROUP BY DATE(occurred_at), data:sign_up_method::string
),

daily_totals AS (
    SELECT 
        signup_date,
        SUM(daily_starts) AS total_daily_starts
    FROM signup_trends
    GROUP BY signup_date
)

SELECT 
    s.signup_date,
    s.sign_up_method,
    s.daily_starts,
    t.total_daily_starts,
    ROUND(100.0 * s.daily_starts / t.total_daily_starts, 2) AS method_percentage
FROM signup_trends s
JOIN daily_totals t ON s.signup_date = t.signup_date
ORDER BY s.signup_date DESC, s.sign_up_method;