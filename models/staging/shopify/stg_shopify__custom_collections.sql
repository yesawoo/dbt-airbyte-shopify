with

source as (

    select * from {{ source('shopify', 'custom_collections') }}

),

custom_collections as (

    select
        id as custom_collection_id,
        published_scope,
        to_json(image) as image,
        body_html,
        template_suffix,
        shop_url,
        admin_graphql_api_id,
        handle,
        title,
        sort_order,
        published_at,
        updated_at

    from source

)

select * from custom_collections