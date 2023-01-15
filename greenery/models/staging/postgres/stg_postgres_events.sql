with events as (
    select
        event_id,
        session_id,
        user_id,
        page_url,
        created_at,
        event_type
    from {{ source('postgres', 'events') }}
)

select *
from events