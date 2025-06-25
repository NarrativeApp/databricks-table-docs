-- Query Template
-- Author: 
-- Date: 
-- Purpose: 
-- Related to: [OKR/Feature/Bug/Analysis]
-- Tables used: 
-- Expected runtime: 

-- Context and assumptions
/*
Describe the business context and any assumptions made in this query
*/

-- Main query
WITH base_data AS (
  -- Base dataset preparation
  SELECT 
    -- Add your columns here
  FROM narrative.default.your_table
  WHERE 
    -- Add your filters here
    created_at >= CURRENT_DATE - INTERVAL 30 DAYS
),

aggregated_data AS (
  -- Aggregations and calculations
  SELECT 
    -- Add your aggregated columns here
  FROM base_data
  GROUP BY 1, 2
)

-- Final result
SELECT *
FROM aggregated_data
ORDER BY 1
LIMIT 1000;

-- Validation queries (optional)
-- SELECT COUNT(*) FROM base_data; -- Expected: ~X rows
-- SELECT MIN(created_at), MAX(created_at) FROM base_data; -- Date range check