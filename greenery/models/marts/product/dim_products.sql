with dim_products as (
    select
        product_id,
        name,
        price,
        inventory
    from {{ ref('stg_postgres_products') }}
)

select *
from dim_products
