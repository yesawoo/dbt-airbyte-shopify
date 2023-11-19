with

product_variants as (

    select
        product_variant_id,
        product_id,
        image_id,
        inventory_item_id,
        sku,
        title,
        base_price,
        base_compare_at_price,
        option1,
        option2,
        option3,
        inventory_quantity,
        requires_shipping,
        barcode,
        taxable,
        weight,
        weight_unit,
        position,
        shop_url,
        created_at,
        updated_at

    from {{ ref('stg_shopify__product_variants') }}

)

select * from product_variants