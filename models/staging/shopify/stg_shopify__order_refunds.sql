with

source as (

    select * from {{ source('shopify', 'order_refunds') }}

),

order_refunds as (

    select
        id as order_refund_id,
        order_id,
        user_id,
        admin_graphql_api_id,
        note,
        to_json(order_adjustments) as order_adjustments,
        restock,
        to_json(total_duties_set) as total_duties_set,
        to_json(transactions) as transactions,
        to_json(refund_line_items) as refund_line_items,
        to_json(return) as return,
        duties,
        shop_url,
        created_at,
        processed_at

    from source

)

select * from order_refunds