 SELECT user_id,
       (MAX(CASE WHEN meta_system_os = 'macos' THEN 1 ELSE 0 END) = 1) as macos,
       (MAX(CASE WHEN meta_system_os = 'windows' THEN 1 ELSE 0 END) = 1) as windows
FROM select_events
GROUP BY user_id 