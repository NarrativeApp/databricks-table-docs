SELECT
    id,
    user_id,
    data:session_id AS session_id,
    CAST(inserted_at AS DATE) AS day,
    CASE
        WHEN
            meta_browser_os = 'macOS'
            OR data:mobile_sign_up_os = 'mac'
            OR data:tablet_sign_up_os = 'mac'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'mac_and_windows'
            OR data:linux_sign_up_os = 'mac_and_linux'
        THEN true
        ELSE false
    END AS is_mac_user,
    CASE
        WHEN
            meta_browser_os = 'Windows'
            OR data:mobile_sign_up_os = 'windows'
            OR data:tablet_sign_up_os = 'windows'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'windows'
            OR data:linux_sign_up_os = 'windows_and_linux'
        THEN true
        ELSE false
    END AS is_windows_user,
    vertical != 'I’m not a professional photographer' AS is_professional,
    CASE
        WHEN
            (meta_browser_os = 'Windows'
            OR data:mobile_sign_up_os = 'windows'
            OR data:tablet_sign_up_os = 'windows'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'windows'
            OR data:linux_sign_up_os = 'windows_and_linux')
            AND CAST(inserted_at AS DATE) < '2023-06-14'
        THEN false
        WHEN vertical != 'I’m not a professional photographer' THEN true
        ELSE false
    END AS is_qualified,
    CASE
        WHEN data:mobile_sign_up_os IS NOT NULL OR data:tablet_sign_up_os IS NOT NULL
        THEN true
        ELSE false
    END AS is_mobile,
    data:app AS app,
    data:genre_array,

    data:personal_sign_up_source[0] AS source,
    data:solution_wanted as solution_wanted, 
    CONCAT_WS(', ', COLLECT_LIST(vertical)) AS vertical
FROM web_events ev
LATERAL VIEW EXPLODE(from_json(data:genre_array, 'array<string>')) AS vertical
WHERE topic = 'web_sign_up_succeeded'
GROUP BY
    id,
    user_id,
    data:session_id,
    CAST(inserted_at AS DATE),
    CASE
        WHEN
            meta_browser_os = 'macOS'
            OR data:mobile_sign_up_os = 'mac'
            OR data:tablet_sign_up_os = 'mac'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'mac_and_windows'
            OR data:linux_sign_up_os = 'mac_and_linux'
        THEN true
        ELSE false
    END,
    CASE
        WHEN
            meta_browser_os = 'Windows'
            OR data:mobile_sign_up_os = 'windows'
            OR data:tablet_sign_up_os = 'windows'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'windows'
            OR data:linux_sign_up_os = 'windows_and_linux'
        THEN true
        ELSE false
    END,
    (vertical != 'I’m not a professional photographer'),
    CASE
        WHEN
            (meta_browser_os = 'Windows'
            OR data:mobile_sign_up_os = 'windows'
            OR data:tablet_sign_up_os = 'windows'
            OR data:mobile_sign_up_os = 'both'
            OR data:tablet_sign_up_os = 'both'
            OR data:windows_sign_up_os = 'windows'
            OR data:linux_sign_up_os = 'windows_and_linux')
            AND CAST(inserted_at AS DATE) < '2023-06-14'
        THEN false
        WHEN vertical != 'I’m not a professional photographer' THEN true
        ELSE false
    END,
    CASE
        WHEN data:mobile_sign_up_os IS NOT NULL OR data:tablet_sign_up_os IS NOT NULL
        THEN true
        ELSE false
    END,
    data:app,
    data:genre_array,
    data:personal_sign_up_source[0],
    data:solution_wanted
