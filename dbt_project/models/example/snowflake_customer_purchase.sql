-- {{ config(materialized='table') }}

with sample_customer AS
(
    SELECT * 
    FROM {{ source('sf_sample', 'customer') }}
),

sample_orders AS
(
    SELECT * 
    FROM {{ source('sf_sample', 'orders') }}
)


SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    SUM(o.o_totalprice) as total_price
FROM sample_customer c
LEFT JOIN  sample_orders o
ON c.c_custkey = o.o_custkey
GROUP BY
    c.c_custkey,
    c.c_name,
    c.c_nationkey

{% if target.name == 'dev' %}
HAVING SUM(o.o_totalprice) >0
{% endif %}