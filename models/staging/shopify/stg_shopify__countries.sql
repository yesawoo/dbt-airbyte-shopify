with

source as (

    select * from {{ source('shopify', 'countries') }}

),

countries as (

    select
        id as country_id,
        to_json(provinces) as provinces,
        code,
        shop_url,
        tax_name,
        name,
        cast(tax as FLOAT64) as tax

    from source

)

select * from countries