with

source as (

    select * from {{ source('shopify', 'product_images') }}

),

product_images as (

    select
        id as product_image_id,
        product_id,
        admin_graphql_api_id,
        to_json(variant_ids) as variant_ids,
        src,
        alt,
        width,
        height,
        position,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from product_images