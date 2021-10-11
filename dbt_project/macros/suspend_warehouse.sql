{% macro suspend_warehouse(warehouse_name) %}

    {% set sql %}
        alter warehouse {{warehouse_name}} resume
    {% endset %}

    {% set table = run_query(sql) %}
    {% do table.print_table() %}

{% endmacro %}



