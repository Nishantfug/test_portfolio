-- ============================================================
-- MIGRATION SCRIPT
-- ============================================================
-- Target: PROD.TEST1
-- ============================================================

USE DATABASE PROD;
USE SCHEMA TEST1;


-- ------------------------------------------------------------
-- DROP OBJECTS
-- ------------------------------------------------------------

DROP SEQUENCE IF EXISTS "PROD"."TEST1"."SHARED_SEQ";
DROP PROCEDURE IF EXISTS "PROD"."TEST1".PROD_ONLY_PROCEDURE();
DROP SEQUENCE IF EXISTS "PROD"."TEST1"."PROD_ONLY_SEQ";
DROP PROCEDURE IF EXISTS "PROD"."TEST1".SHARED_PROCEDURE(NUMBER);

-- ============================================================
-- END - 4 statement(s)
-- ============================================================