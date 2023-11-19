with

source as (

    select * from {{ source('shopify', 'transactions') }}

),

transactions as (

    select
        id as transaction_id,
        order_id,
        payment_id,
        user_id,
        parent_id,
        device_id,
        cast(amount as FLOAT64) as amount,
        test,
        to_json(payment_details) as payment_details,
        kind,
        message,
        location_id,
        authorization,
        admin_graphql_api_id,
        to_json(total_unsettled_set) as total_unsettled_set,
        to_json(receipt) as receipt,
        currency,
        error_code,
        gateway,
        source_name,
        status,
        shop_url,
        created_at,
        processed_at

    from source

)

select * from transactions