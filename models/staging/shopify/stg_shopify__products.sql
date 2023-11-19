with

source as (

    select * from {{ source('shopify', 'products') }}

),

products as (

    select
        id as product_id,
        admin_graphql_api_id,
        title,
        body_html,
        handle,
        to_json(image) as image,
        to_json(images) as images,
        to_json(variants) as variants,
        to_json(options) as options,
        tags,
        published_scope,
        product_type,
        template_suffix,
        vendor,
        status,
        shop_url,
        published_at,
        created_at,
        updated_at

    from source

)

select * from products