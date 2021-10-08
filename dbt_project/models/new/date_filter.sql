{{ config(materialized='incremental', unique_key = 'DATEKEY') }}


SELECT 
*
FROM ANALYTICS.DBT.DIM_DATES
WHERE STANDARD_DATE <= current_date

{% if is_incremental() %}
    and DATEKEY > (Select max(DATEKEY) from {{ this }})
{% endif %}
