with

source as (

    select * from {{ source('shopify', 'product_variants') }}

),

product_variants as (

    select
        id as product_variant_id,
        product_id,
        image_id,
        inventory_item_id,
        admin_graphql_api_id,
        coalesce(nullif(sku, '')) as sku,
        to_json(presentment_prices) as presentment_prices,
        inventory_management,
        requires_shipping,
        old_inventory_quantity,
        title,
        cast(price as FLOAT64) as base_price,
        option1,
        option2,
        option3,
        grams,
        barcode,
        inventory_quantity,
        compare_at_price as base_compare_at_price,
        taxable,
        fulfillment_service,
        cast(weight as FLOAT64) as weight,
        inventory_policy,
        weight_unit,
        position,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from product_variants