with

source as (

    select * from {{ source('shopify', 'metafield_draft_orders') }}

),

metafield_draft_orders as (

    select
        id as metafield_draft_order_id,
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

select * from metafield_draft_orders