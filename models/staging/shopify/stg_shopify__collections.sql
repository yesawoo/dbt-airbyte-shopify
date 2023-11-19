with

source as (

    select * from {{ source('shopify', 'collections') }}

),

collections as (

    select
        id as collection_id,
        body_html,
        products_count,
        handle,
        title,
        collection_type,
        published_scope,
        template_suffix,
        shop_url,
        admin_graphql_api_id,
        sort_order,
        published_at,
        updated_at

    from source

)

select * from collections