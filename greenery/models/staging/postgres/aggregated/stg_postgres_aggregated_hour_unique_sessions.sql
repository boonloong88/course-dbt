
{{
    config(
        materialized='view'
    )
}}

with aggregated_hour_unique_sessions as (
    select
        date_trunc('hour', created_at) as created_hour,
        count(distinct session_id) as unique_sessions_number
    from {{ ref('stg_postgres_events') }}
    group by
        date_trunc('hour', created_at)
)

select *
from aggregated_hour_unique_sessions