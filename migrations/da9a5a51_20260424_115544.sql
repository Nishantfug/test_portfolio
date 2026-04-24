-- ============================================================
-- MIGRATION SCRIPT
-- ============================================================
-- Target: PROD.CORE
-- ============================================================

USE DATABASE PROD;
USE SCHEMA CORE;


-- ------------------------------------------------------------
-- CREATE OBJECTS
-- ------------------------------------------------------------

CREATE OR REPLACE secure materialized view SECURE_MV(
	COL1,
	CNT
) as
SELECT col1, COUNT(*) AS cnt
FROM source_table
GROUP BY col1;

CREATE OR REPLACE materialized view MV_EXAMPLE(
	COL1,
	TOTAL
) as
SELECT col1, SUM(col2) AS total
FROM source_table
GROUP BY col1;

CREATE OR REPLACE view RECURSIVE_VIEW(
	ID,
	PARENT_ID
) as
WITH RECURSIVE cte (id, parent_id) AS (
    SELECT id, parent_id FROM source_table WHERE parent_id IS NULL
    UNION ALL
    SELECT t.id, t.parent_id
    FROM source_table t
    JOIN cte ON t.parent_id = cte.id
)
SELECT * FROM cte;

CREATE OR REPLACE dynamic table DYN_TABLE(
	COL1,
	CNT
) target_lag = '1 minute' refresh_mode = AUTO initialize = ON_CREATE warehouse = COMPUTE_WH
 as
SELECT col1, COUNT(*) cnt
FROM source_table
GROUP BY col1;


-- ============================================================
-- END - 4 statement(s)
-- ============================================================