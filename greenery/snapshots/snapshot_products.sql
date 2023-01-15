{% snapshot snapshot_products %}

    {{
        config(
            target_schema='snapshots',
            unique_key='product_id',
            strategy='check',
            check_cols=['inventory']
        )
    }}

    select
        product_id,
        name,
        price,
        inventory
    from {{ source('postgres', 'products') }}

{% endsnapshot %}