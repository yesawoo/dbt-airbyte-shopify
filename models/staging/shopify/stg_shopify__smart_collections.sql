with

source as (

    select * from {{ source('shopify', 'smart_collections') }}

),

smart_collections as (

    select
        id as smart_collection_id,
        admin_graphql_api_id,
        title,
        body_html,
        to_json(rules) as rules,
        handle,
        published_scope,
        template_suffix,
        disjunctive,
        sort_order,
        shop_url,
        published_at,
        updated_at

    from source

)

select * from smart_collections