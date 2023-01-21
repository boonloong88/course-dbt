with country_inhabitants as (
    select
        address.country,
        address.state,
        count(*) as country_inhabitants
    from {{ ref('stg_postgres_addresses') }} as address
        right join {{ ref('stg_postgres_users') }} as u
        on address.address_id = u.address_id
    group by
        address.country,
        address.state
)

select *
from country_inhabitants