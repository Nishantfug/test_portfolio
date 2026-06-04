-- ============================================================
-- MIGRATION SCRIPT
-- ============================================================
-- Target: PROD.PROD_FILEFORMAT_CSV
-- ============================================================

USE DATABASE PROD;
USE SCHEMA PROD_FILEFORMAT_CSV;


-- ------------------------------------------------------------
-- CREATE OBJECTS
-- ------------------------------------------------------------

CREATE OR REPLACE FILE FORMAT "PROD"."PROD_FILEFORMAT_CSV"."FF_CSV_RECREATE"
  TYPE = CSV
  FIELD_DELIMITER = ';'
  DATE_FORMAT = 'MM/DD/YYYY'
  BINARY_FORMAT = 'UTF8'
  ESCAPE_UNENCLOSED_FIELD = 'NONE'
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  NULL_IF = ('')
  COMPRESSION = 'NONE'
  MULTI_LINE = true
  COMMENT = 'DEV RECREATE SCENARIO'
;

CREATE OR REPLACE FILE FORMAT "PROD"."PROD_FILEFORMAT_CSV"."FF_CSV_ALTER"
  TYPE = CSV
  RECORD_DELIMITER = '\r\n'
  FIELD_DELIMITER = '|'
  SKIP_HEADER = 2
  DATE_FORMAT = 'DD-MM-YYYY'
  TIME_FORMAT = 'HH24:MI'
  TIMESTAMP_FORMAT = 'DD-MM-YYYY HH24:MI'
  BINARY_FORMAT = 'BASE64'
  ESCAPE = '\\'
  TRIM_SPACE = true
  FIELD_OPTIONALLY_ENCLOSED_BY = ''''
  NULL_IF = ('N/A')
  COMPRESSION = 'BZ2'
  ERROR_ON_COLUMN_COUNT_MISMATCH = false
  SKIP_BLANK_LINES = true
  REPLACE_INVALID_CHARACTERS = true
  EMPTY_FIELD_AS_NULL = false
  MULTI_LINE = true
  COMMENT = 'DEV ALTER SCENARIO'
;


-- ============================================================
-- END - 2 statement(s)
-- ============================================================