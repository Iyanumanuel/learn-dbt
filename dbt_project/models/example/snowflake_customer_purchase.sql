-- {{ config(materialized='table') }}


SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    SUM(o.o_totalprice) as total_price
FROM {{ source('sf_sample', 'customer') }} c
LEFT JOIN  {{ source('sf_sample', 'orders') }} o
ON c.c_custkey = o.o_custkey
GROUP BY
    c.c_custkey,
    c.c_name,
    c.c_nationkey
--HAVING SUM(o.o_totalprice) >0