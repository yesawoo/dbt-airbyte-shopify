with

refunds as (

    select
        order_refund_id,
        order_id,
        user_id,
        coalesce(nullif(note, ''), NULL) as note,
        restock,
        json_value(transactions, '$[0].currency') as refund_currency,
        json_value(transactions, '$[0].amount') as refund_amount,
        shop_url,
        created_at,
        processed_at
    
    from {{ ref('stg_shopify__order_refunds')}}

)

select * from refunds