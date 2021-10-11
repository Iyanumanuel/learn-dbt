{% snapshot first_model_snapshot %}
    {{
            config(
                target_database= 'analytics',
                target_schema= 'snapshots',
                unique_key= 'id',

                strategy= 'timestamp',
                updated_at= 'updated_at',
            )
    }}


    --Pro- tip: Use source in snapshots!

    SELECT * 
    FROM  {{ ref('first_dbt_model') }}

{% endsnapshot %}