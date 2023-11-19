with

source as (

    select * from {{ source('shopify', 'customers') }}

),

customers as (

    select
        id as customer_id,
        note,
        to_json(addresses) as addresses,
        last_order_name,
        multipass_identifier,
        to_json(default_address) as default_address,
        accepts_marketing,
        shop_url,
        currency,
        state,
        marketing_opt_in_level,
        first_name,
        email,
        cast(total_spent as FLOAT64) as total_spent,
        last_order_id,
        tax_exempt,
        to_json(email_marketing_consent) as email_marketing_consent,
        last_name,
        verified_email,
        tags,
        orders_count,
        to_json(sms_marketing_consent) as sms_marketing_consent,
        phone,
        admin_graphql_api_id,
        tax_exemptions,
        to_json(accepts_marketing_updated_at) as accepts_marketing_updated_at,
        created_at,
        updated_at
        
    from source

)

select * from customers