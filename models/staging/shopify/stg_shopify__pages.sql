with

source as (

    select * from {{ source('shopify', 'pages') }}

),

pages as (

    select
        id as page_id,
        shop_id,
        admin_graphql_api_id,
        to_json(body_html) as body_html,
        template_suffix,
        author,
        handle,
        title,
        shop_url,
        published_at,
        created_at,
        updated_at

    from source

)

select * from pages