with

source as (

    select * from {{ source('shopify', 'customer_address') }}

),

customer_address as (

    select
        id customer_address_id,
        customer_id,
        first_name,
        last_name,
        name,
        company,
        address1,
        address2,
        city,
        zip,
        province,
        province_code,
        country,
        country_name,
        country_code,
        phone,
        `default`,
        shop_url
        
    from source

)

select * from customer_address