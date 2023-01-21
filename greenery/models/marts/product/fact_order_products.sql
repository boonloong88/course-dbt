with order_products as (
    select
        o.order_id,
        o.created_at,
        o.order_total,
        count(*) as total_products
    from {{ ref('stg_postgres_orders') }} as o
        inner join {{ ref('stg_postgres_order_items') }} as o_item
        on o.order_id = o_item.order_id
    group by
        o.order_id,
        o.created_at,
        o.order_total
)

select *
from order_products