with

source as (

    select * from {{ source('shopify', 'discount_codes') }}

),

discount_codes as (

    select
        id as discount_code_id,
        price_rule_id,
        code,
        usage_count,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from discount_codes