with

source as (

    select * from {{ source('shopify', 'balance_transactions') }}

),

balance_transactions as (

    select
        id as balance_transaction_id,
        cast(amount as FLOAT64) as amount,
        test,
        cast(fee as FLOAT64) as fee,
        source_type,
        source_order_id,
        payoucurrencyt_status,
        type,
        payout_id,
        payout_status,
        shop_url,
        source_order_transaction_id,
        source_id,
        cast(net as FLOAT64) as net,
        processed_at

    from source

)

select * from balance_transactions