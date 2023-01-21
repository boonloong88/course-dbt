with user_orders as (
    select
        u.user_id,
        u.email,
        o.order_id,
        o.created_at
    from {{ ref('stg_postgres_users') }} as u
        inner join {{ ref('stg_postgres_orders') }} as o
        on u.user_id = o.user_id
)

select *
from user_orders