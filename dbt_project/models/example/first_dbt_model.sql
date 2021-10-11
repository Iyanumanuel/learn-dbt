
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}

 -- {{ config(materialized='ephemeral') }}

 -- using alias
{{ config(materialized='table', alias = 'first_model') }}

with source_data as (

    select 1 as id, 'NY' as state, '2020-02-01 00:00:00.000'::timestamp as updated_at
    union all
    select null as id, 'CT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at
    union all
    select 3 as id, 'VT' as state, '2020-01-01 00:00:00.000'::timestamp as updated_at
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
