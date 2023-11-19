with

customers as (

    select
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        accepts_marketing,
        shop_url,
        created_at

    from {{ ref('stg_shopify__customers') }}

),

orders as (

    select
        cast(customer_id as INT64) as customer_id,
        min(created_at) as first_order_date,
        max(created_at) as most_recent_order_date,
        count(order_id) as orders_count,
        max(order_id) as last_order_id,
        sum(base_total_price) as base_lifetime_value,
        min(base_currency_code) as base_currency_code

    from {{ ref('shopify__orders') }}

    where customer_id IS NOT NULL

    group by 1

),

customer_address as (

    select
        customer_id,
        company,
        address1,
        address2,
        city,
        zip,
        province,
        province_code,
        country,
        country_code
        
    from {{ ref('stg_shopify__customer_address') }}
    
    where `default` = true
    
),

customers_final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customers.email,
        customers.phone,
        customer_address.company,
        customer_address.address1,
        customer_address.address2,
        customer_address.city,
        customer_address.zip,
        customer_address.province,
        customer_address.province_code,
        customer_address.country,
        customer_address.country_code,
        coalesce(orders.orders_count, 0) as orders_count,
        orders.last_order_id,
        orders.base_currency_code,
        round(orders.base_lifetime_value, 2) as base_lifetime_value,
        customers.accepts_marketing,
        customers.shop_url,
        orders.first_order_date,
        orders.most_recent_order_date,
        customers.created_at

    from customers

    left join orders using (customer_id)
    left join customer_address using (customer_id)

)

select * from customers_final