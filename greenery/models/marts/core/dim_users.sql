with dim_users as (
    select
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        address_id
    from {{ ref('stg_postgres_users') }}
)

select *
from dim_users