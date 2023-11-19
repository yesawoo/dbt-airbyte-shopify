with

products as (

    select * from {{ ref('stg_shopify__products')}}

),

orders_line_items as (

    select
        cast(product_id as INT64) as product_id,
        sum(quantity) as sold_quantity,
        min(created_at) as first_order_date,
        max(created_at) as most_recent_order_date

    from {{ ref('shopify__order_line_items') }}

    group by 1

),

products_final as (

    select
        products.product_id,
        products.title,
        products.handle,
        coalesce(nullif(products.product_type, ''), NULL) as product_type,
        products.status,
        products.vendor,
        coalesce(orders_line_items.sold_quantity, 0) as sold_quantity,
        products.shop_url,
        orders_line_items.first_order_date,
        orders_line_items.most_recent_order_date,
        products.created_at,
        products.published_at
        
    from products

    left join orders_line_items using (product_id)

    order by sold_quantity desc

)

select * from products_final