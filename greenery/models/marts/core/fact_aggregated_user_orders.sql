with aggregated_user_orders as (
    select
        user_id,
        email,
        date_trunc('day', created_at) as aggregated_day,
        count(*) as total_day_orders
    from {{ ref('int_user_orders') }}
    group by
        user_id,
        email,
        date_trunc('day', created_at)
)

select *
from aggregated_user_orders