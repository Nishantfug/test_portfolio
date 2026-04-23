-- ============================================================
-- MIGRATION SCRIPT
-- ============================================================
-- Target: PROD.CARDB
-- ============================================================

USE DATABASE PROD;
USE SCHEMA CARDB;


-- ------------------------------------------------------------
-- CREATE OBJECTS
-- ------------------------------------------------------------

CREATE OR REPLACE view RECURSIVE_VIEW(
	ID,
	PARENT_ID,
	LEVEL
) as
WITH RECURSIVE cte (id, parent_id, level) AS (
    SELECT id, parent_id, 1
    FROM SOURCE_TABLE
    WHERE parent_id IS NULL

    UNION ALL

    SELECT t.id, t.parent_id, c.level + 1
    FROM SOURCE_TABLE t
    JOIN cte c ON t.parent_id = c.id
)
SELECT * FROM cte;

CREATE OR REPLACE secure materialized view SECURE_MV(
	COL1,
	CNT
) as
SELECT COL1, COUNT(*) AS CNT
FROM SOURCE_TABLE
GROUP BY COL1;

CREATE OR REPLACE materialized view MV_EXAMPLE(
	COL1,
	TOTAL
) as
SELECT COL1, SUM(COL2) AS TOTAL
FROM SOURCE_TABLE
GROUP BY COL1;

CREATE OR REPLACE TABLE SOURCE_TABLE (
	ID NUMBER(38,0),
	PARENT_ID NUMBER(38,0),
	COL1 VARCHAR(16777216),
	COL2 NUMBER(38,0),
	CREATED_AT TIMESTAMP_NTZ(9)
);


-- ============================================================
-- END - 4 statement(s)
-- ============================================================