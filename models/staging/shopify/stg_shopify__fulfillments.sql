with

source as (

    select * from {{ source('shopify', 'fulfillments') }}

),

fulfillments as (

    select
        id as fulfillment_id,
        order_id,
        to_json(origin_address) as origin_address,
        to_json(line_items) as line_items,
        tracking_company,
        variant_inventory_management,
        to_json(tracking_urls) as tracking_urls,
        location_id,
        service,
        shop_url,
        admin_graphql_api_id,
        name,
        tracking_number,
        to_json(receipt) as receipt,
        to_json(tracking_numbers) as tracking_numbers,
        tracking_url,
        notify_customer,
        to_json(duties) as duties,
        status,
        shipment_status,
        created_at,
        updated_at

    from source

)

select * from fulfillments