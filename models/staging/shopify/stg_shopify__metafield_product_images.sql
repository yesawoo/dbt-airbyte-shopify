with

source as (

    select * from {{ source('shopify', 'metafield_product_images') }}

),

metafield_product_images as (

    select
        id as metafield_product_image_id,
        admin_graphql_api_id,
        owner_id,
        key,
        value,
        value_type,
        namespace,
        description,
        type,
        owner_resource,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from metafield_product_images