{% snapshot snapshot_orders %}

    {{
        config(
            target_database = target.database,
            target_schema='snapshots',
            unique_key='order_guid',
            strategy='check',
            check_cols=['status']
        )
    }}

    select
        order_id as order_guid
        , user_id as user_guid
        , promo_id as promo_desc
        , address_id as address_guid
        , created_at::timestampntz as created_at
        , order_cost
        ,  shipping_cost
        , order_total 
        , tracking_id as tracking_guid
        , shipping_service
        , estimated_delivery_at::timestampntz as estimated_delivery_at
        , delivered_at::timestampntz as delivered_at
        , status
    from {{ source('postgres', 'orders') }}

{% endsnapshot %}