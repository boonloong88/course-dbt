{% snapshot snapshot_orders %}

    {{
        config(
            target_database = target.database,
            target_schema=target.schema,
            unique_key='order_id',
            strategy='check',
            check_cols=['status']
        )
    }}

    select
        order_id
        , user_id
        , promo_id
        , address_id
        , created_at::timestampntz as created_at
        , order_cost
        ,  shipping_cost
        , order_total 
        , tracking_id
        , shipping_service
        , estimated_delivery_at::timestampntz as estimated_delivery_at
        , delivered_at::timestampntz as delivered_at
        , status
    from {{ source('postgres', 'orders') }}

{% endsnapshot %}