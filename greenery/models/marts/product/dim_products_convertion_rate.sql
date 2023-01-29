with products_convertion_rate as (
    SELECT
      product.name,
      order_items.product_id,
      round((
        count(DISTINCT order_id)::decimal
        /
        (
          SELECT COUNT (DISTINCT session_id)
          FROM {{ref('stg_postgres_events') }}
          WHERE split_part(page_url,'/',5) = order_items.product_id
        )::decimal
      )*100,2) as product_convertion_rate
    FROM {{ ref('stg_postgres_order_items') }} as order_items
      INNER JOIN {{ ref('dim_products') }} as product
      ON order_items.product_id = product.product_id
    GROUP BY
       product.name,
       order_items.product_id
)

SELECT *
FROM products_convertion_rate
