{% snapshot snapshot_users %}

    {{
        config(
            target_schema=target.schema,
            unique_key='user_id',
            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    select
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        created_at,
        updated_at,
        address_id
    from {{ source('postgres', 'users') }}

{% endsnapshot %}