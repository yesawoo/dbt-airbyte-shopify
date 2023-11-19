with

source as (

    select * from {{ source('shopify', 'customer_saved_search') }}

),

customer_saved_search as (

    select
        id as customer_saved_search_id,
        query,
        name,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from customer_saved_search