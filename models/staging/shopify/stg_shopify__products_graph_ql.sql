with

source as (

    select * from {{ source('shopify', 'products_graph_ql') }}

),

products_graph_ql as (

    select
        id as product_graph_ql_id,
        legacyResourceId,
        productType,
        title,
        description,
        descriptionHtml,
        handle,
        onlineStorePreviewUrl,
        onlineStoreUrl,
        isGiftCard,
        totalVariants,
        totalInventory,
        tracksInventory,
        to_json(tags) as tags,
        vendor,
        to_json(options) as options,
        mediaCount,
        status,
        shop_url,
        publishedAt,
        createdAt,
        updatedAt

    from source

)

select * from products_graph_ql