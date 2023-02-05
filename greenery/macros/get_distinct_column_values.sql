{% macro get_distinct_column_values(column_name, model_name) %}

{% set distinct_query %}
select distinct
{{ column_name }} 
from {{ model_name }}
{% endset %}
 

{% set results = run_query(distinct_query) %}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}