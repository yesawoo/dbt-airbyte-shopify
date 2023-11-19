with

source as (

    select * from {{ source('shopify', 'abandoned_checkouts') }}

),

abandoned_checkouts as (

    select
        id as abandoned_checkout_id,
        user_id,
        device_id,
        note,
        to_json(billing_address) as billing_address,
        source,
        to_json(line_items) as line_items,
        taxes_included,
        presentment_currency,
        buyer_accepts_marketing,
        source_url,
        location_id,
        total_weight,
        landing_site,
        source_identifier,
        cast(total_discounts as FLOAT64) as total_discounts,
        to_json(tax_lines) as tax_lines,
        referring_site,
        customer_locale,
        currency,
        to_json(shipping_address) as shipping_address,
        abandoned_checkout_url,
        email,
        source_name,
        cast(subtotal_price as FLOAT64) as subtotal_price,
        cast(total_price as FLOAT64) as total_price,
        cast(total_line_items_price as FLOAT64) as total_line_items_price,
        cast(total_tax as FLOAT64) as total_tax,
        token,
        completed_at,
        to_json(shipping_lines) as shipping_lines,
        phone,
        to_json(note_attributes) as note_attributes,
        name,
        cart_token,
        to_json(discount_codes) as discount_codes,
        gateway,
        to_json(customer) as customer,
        shop_url,
        closed_at,
        created_at,
        updated_at

    from source

)

select * from abandoned_checkouts