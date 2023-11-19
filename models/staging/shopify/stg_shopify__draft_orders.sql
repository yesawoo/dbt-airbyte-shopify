with

source as (

    select * from {{ source('shopify', 'draft_orders') }}

),

draft_orders as (

    select
        id as draft_order_id,
        order_id,
        note,
        to_json(applied_discount) as applied_discount,
        to_json(billing_address) as billing_address,
        to_json(line_items) as line_items,
        taxes_included,
        payment_terms,
        po_number,
        to_json(tax_lines) as tax_lines,
        shop_url,
        currency,
        to_json(shipping_address) as shipping_address,
        email,
        subtotal_price,
        total_price,
        tax_exempt,
        total_tax,
        tags,
        to_json(note_attributes) as note_attributes,
        admin_graphql_api_id,
        name,
        to_json(shipping_line) as shipping_line,
        invoice_url,
        status,
        to_json(customer) as customer,
        invoice_sent_at,
        completed_at,
        created_at,
        updated_at

    from source

)

select * from draft_orders