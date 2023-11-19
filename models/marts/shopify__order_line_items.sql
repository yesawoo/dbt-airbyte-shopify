with

orders as (

    select
        json_value(line_item, '$.id') as order_line_item_id,
        order_id,
        order_number,
        customer_id,
        json_value(line_item, '$.product_id') as product_id,
        json_value(line_item, '$.variant_id') as variant_id,
        json_value(line_item, '$.name') as product_title,
        json_value(line_item, '$.variant_title') as variant_title,
        coalesce(nullif(json_value(line_item, '$.sku'), ''), NULL) as sku,
        json_value(line_item, '$.quantity') as quantity,
        coalesce(nullif(json_value(line_item, '$.vendor'), ''), NULL) as vendor,
        json_value(line_item, '$.price_set.presentment_money.amount') as price,
        json_value(line_item, '$.price_set.shop_money.amount') as base_price,
        presentment_currency as currency_code,
        currency as base_currency_code,
        json_value(total_discounts_set, '$.presentment_money.amount') as total_discount_amount,
        json_value(total_discounts_set, '$.shop_money.amount') as base_total_discount_amount,
        created_at

    from {{ ref('stg_shopify__orders') }}

    cross join unnest(json_query_array(line_items)) as line_item

),

orders_line_items as (

    select
        order_line_item_id,
        order_id,
        customer_id,
        order_number,
        product_id,
        variant_id,
        sku,
        product_title,
        variant_title,
        cast(quantity as INT64) as quantity,
        vendor,
        currency_code,
        cast(price as FLOAT64) as price,
        cast(total_discount_amount as FLOAT64) as total_discount_amount,
        base_currency_code,
        cast(base_price as FLOAT64) as base_price,
        cast(base_total_discount_amount as FLOAT64) as base_total_discount_amount,
        created_at

    from orders

    order by order_number desc

)

select * from orders_line_items