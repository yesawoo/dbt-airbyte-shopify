with

source as (

    select * from {{ source('shopify', 'locations') }}

),

locations as (

    select
        id as location_id,
        admin_graphql_api_id,
        name,
        address1,
        address2,
        city,
        zip,
        province,
        localized_province_name,
        province_code,
        country,
        country_name,
        localized_country_name,
        country_code,
        phone,
        legacy,
        active, 
        shop_url,
        created_at,
        updated_at
        

    from source

)

select * from locations