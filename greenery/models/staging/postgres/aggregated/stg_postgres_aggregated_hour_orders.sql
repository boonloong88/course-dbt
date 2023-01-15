
{{
    config(
        materialized='view'
    )
}}

with aggregated_hour_orders as (
    select
        date_trunc('hour', created_at) as created_hour,
        count(*) as orders_number
    from {{ ref('stg_postgres_orders') }}
    where created_at is not null
    group by
        date_trunc('hour', created_at)
)

select *
from aggregated_hour_orders