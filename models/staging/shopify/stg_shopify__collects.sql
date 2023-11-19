with

source as (

    select * from {{ source('shopify', 'collects') }}

),

collects as (

    select
        id as collect_id,
        collection_id,
        shop_url,
        product_id,
        position,
        sort_value,
        created_at,
        updated_at

    from source

)

select * from collects