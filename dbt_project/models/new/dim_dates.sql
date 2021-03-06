--{{ config(materialized='table') }}

-- CREATE OR REPLACE TABLE MY_DATE_DIMENSION (
--    DATEKEY          BIGINT      NOT NULL
--   ,STANDARD_DATE    DATE        NOT NULL
--   ,YEAR             SMALLINT    NOT NULL
--   ,MONTH            SMALLINT    NOT NULL
--   ,MONTH_NAME       CHAR(3)     NOT NULL
--   ,DAY_OF_MONTH     SMALLINT    NOT NULL
--   ,DAY_NAME         CHAR(3)     NOT NULL
--   ,DAY_OF_WEEK      VARCHAR(9)  NOT NULL
--   ,WEEK_OF_YEAR     SMALLINT    NOT NULL
--   ,DAY_OF_YEAR      SMALLINT    NOT NULL
-- )
-- AS

 WITH CTE_MY_DATE AS (
    SELECT DATEADD(DAY, SEQ4(), '2000-01-01') AS MY_DATE
      FROM TABLE(GENERATOR(ROWCOUNT=>10000))  -- Number of days after reference date in previous line
  )
  SELECT REPLACE (LEFT(MY_DATE,10), '-', '') AS DATEKEY 
        ,MY_DATE AS STANDARD_DATE
        ,cast(YEAR(MY_DATE) as char(4)) as YEAR
        ,MONTH(MY_DATE) AS MONTH
        ,MONTHNAME(MY_DATE) AS MONTH_NAME
        ,DAY(MY_DATE) AS DAY_OF_MONTH
        ,DAYNAME(MY_DATE) AS DAY_NAME
        ,DAYOFWEEK(MY_DATE) AS DAY_OF_WEEK
        ,WEEKOFYEAR(MY_DATE) AS WEEK_OF_YEAR
        ,DAYOFYEAR(MY_DATE) AS DAY_OF_YEAR
    FROM CTE_MY_DATE