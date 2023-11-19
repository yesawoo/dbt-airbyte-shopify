with

orders as  (

    select * from {{ ref('stg_shopify__orders' )}}
    -- where NOT test

),

orders_final as (

    select
        order_id,
        customer_id,
        order_number,
        confirmation_number,
        po_number,
        fulfillment_status,
        financial_status,
        presentment_currency as currency_code,
        cast(json_value(total_line_items_price_set, '$.presentment_money.amount') as FLOAT64) as total_line_items_price,
        cast(json_value(total_discounts_set, '$.presentment_money.amount') as FLOAT64) as total_discount,
        cast(json_value(subtotal_price_set, '$.presentment_money.amount') as FLOAT64) as subtotal_price,
        cast(json_value(total_tax_set, '$.presentment_money.amount') as FLOAT64) as total_tax,
        cast(json_value(total_shipping_price_set, '$.presentment_money.amount') as FLOAT64) as total_shipping_price,
        cast(json_value(total_price_set, '$.presentment_money.amount') as FLOAT64) as total_price,
        currency as base_currency_code,
        cast(json_value(total_line_items_price_set, '$.shop_money.amount') as FLOAT64) as base_total_line_items_price,
        cast(json_value(total_discounts_set, '$.shop_money.amount') as FLOAT64) as base_total_discount,
        cast(json_value(subtotal_price_set, '$.shop_money.amount') as FLOAT64) as base_subtotal_price,
        cast(json_value(total_tax_set, '$.shop_money.amount') as FLOAT64) as base_total_tax,
        cast(json_value(total_shipping_price_set, '$.shop_money.amount') as FLOAT64) as base_total_shipping_price,
        cast(json_value(total_price_set, '$.shop_money.amount') as FLOAT64) as base_total_price,
        coalesce(nullif(email, ''), NULL) as email,
        phone,
        json_value(shipping_lines, '$[0].title') as shipping_title,
        coalesce(nullif(json_value(shipping_address, '$.first_name'), ''), NULL) as shipping_fname,
        coalesce(nullif(json_value(shipping_address, '$.last_name'), ''), NULL) as shipping_lname,
        coalesce(nullif(json_value(shipping_address, '$.name'), ''), NULL) as shipping_name,
        coalesce(nullif(json_value(shipping_address, '$.company'), ''), NULL) as shipping_company,
        coalesce(nullif(json_value(shipping_address, '$.address1'), ''), NULL) as shipping_address_1,
        coalesce(nullif(json_value(shipping_address, '$.address2'), ''), NULL) as shipping_address_2,
        coalesce(nullif(json_value(shipping_address, '$.city'), ''), NULL) as shipping_city,
        coalesce(nullif(json_value(shipping_address, '$.province'), ''), NULL) as shipping_province,
        coalesce(nullif(json_value(shipping_address, '$.province_code'), ''), NULL) as shipping_province_code,
        coalesce(nullif(json_value(shipping_address, '$.zip'), ''), NULL) as shipping_zip,
        coalesce(nullif(json_value(shipping_address, '$.country'), ''), NULL) as shipping_country,
        coalesce(nullif(json_value(shipping_address, '$.country_code'), ''), NULL) as shipping_country_code,
        coalesce(nullif(json_value(shipping_address, '$.latitude'), ''), NULL) as shipping_latitude,
        coalesce(nullif(json_value(shipping_address, '$.longitude'), ''), NULL) as shipping_longitude,
        coalesce(nullif(json_value(shipping_address, '$.phone'), ''), NULL) as shipping_phone,
        shop_url,
        processed_at,
        closed_at,
        cancelled_at,
        created_at,
        updated_at   

    from orders

)

select * from orders_final