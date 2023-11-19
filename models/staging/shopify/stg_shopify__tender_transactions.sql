with

source as (

    select * from {{ source('shopify', 'tender_transactions') }}

),

tender_transactions as (

    select
        id as tender_transaction_id,
        order_id,
        user_id,
        amount,
        test,
        to_json(payment_details) as payment_details,
        remote_reference,
        currency,
        payment_method,
        shop_url,
        processed_at

    from source

)

select * from tender_transactions