-- ANA-27: UTM Traffic Source Analysis
-- Investigate if traffic source affects Google vs Email completion rates
-- Date: 2025-06-25

WITH signup_starts AS (
    SELECT 
        data:session_id::string AS session_id,
        data:sign_up_method::string AS sign_up_method,
        occurred_at AS started_at,
        meta_utm_source,
        meta_utm_medium,
        meta_utm_campaign,
        data:personal_sign_up_source as personal_source,
        -- Classify traffic source
        CASE 
            WHEN meta_utm_source IS NOT NULL THEN meta_utm_source
            WHEN meta_utm_medium IS NOT NULL THEN meta_utm_medium
            WHEN data:personal_sign_up_source IS NOT NULL THEN 'Personal Source'
            ELSE 'Direct/Unknown'
        END AS traffic_source_category,
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
        s.traffic_source_category,
        s.meta_utm_source,
        s.meta_utm_medium,
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
        AND c.completed_at <= s.started_at + INTERVAL 24 HOUR  -- Within 24 hours
)

-- Calculate completion rates by method and traffic source
SELECT 
    traffic_source_category,
    sign_up_method,
    COUNT(DISTINCT session_id) AS total_starts,
    COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END) AS total_completions,
    -- Use try_divide to handle potential divide by zero
    ROUND(100.0 * TRY_DIVIDE(
        COUNT(DISTINCT CASE WHEN completed = 1 THEN session_id END), 
        COUNT(DISTINCT session_id)
    ), 2) AS completion_rate_pct,
    -- Sample sizes for statistical significance
    CASE 
        WHEN COUNT(DISTINCT session_id) >= 100 THEN 'Significant'
        WHEN COUNT(DISTINCT session_id) >= 30 THEN 'Medium'
        ELSE 'Small Sample'
    END AS sample_size_category
FROM signup_funnel
GROUP BY traffic_source_category, sign_up_method
HAVING COUNT(DISTINCT session_id) >= 10  -- Only show meaningful sample sizes
ORDER BY total_starts DESC;