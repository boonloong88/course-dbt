select distinct 
    user_id,
    SUM(page_view) as sessions_with_page_view,
    SUM(add_to_cart) as sessions_with_add_to_cart,
    sum(checkout) as sessions_with_checkout
from {{ref('int_platform_events')}} 
group by 1