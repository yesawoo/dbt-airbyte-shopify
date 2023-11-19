with

source as (

    select * from {{ source('shopify', 'order_risks') }}

),

order_risks as (

    select
        id as order_risk_id,
        order_id,
        checkout_id,
        cast(score as FLOAT64) as score,
        display,
        recommendation,
        cause_cancel,
        merchant_message,
        source,
        message,
        shop_url

    from source

)

select * from order_risks