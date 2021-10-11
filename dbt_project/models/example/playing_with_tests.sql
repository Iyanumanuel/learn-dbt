SELECT 
c_custkey,
c_mktsegment,
{{rename_segments('c_mktsegment')}} mkt_grouped_segment
FROM  {{ source('sf_sample', 'customer') }}