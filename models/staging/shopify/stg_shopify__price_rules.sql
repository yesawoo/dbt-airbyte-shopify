with

source as (

    select * from {{ source('shopify', 'price_rules') }}

),

price_rules as (

    select
        id as price_rule_id,
        admin_graphql_api_id,
        title,
        value,
        value_type,
        usage_limit,
        once_per_customer,
        to_json(prerequisite_customer_ids) as prerequisite_customer_ids,
        to_json(entitled_collection_ids) as entitled_collection_ids,
        to_json(prerequisite_product_ids) as prerequisite_product_ids,
        to_json(prerequisite_shipping_price_range) as prerequisite_shipping_price_range,
        to_json(entitled_country_ids) as entitled_country_ids,
        to_json(entitled_variant_ids) as entitled_variant_ids,
        to_json(prerequisite_subtotal_range) as prerequisite_subtotal_range,
        allocation_method,
        to_json(prerequisite_to_entitlement_quantity_ratio) as prerequisite_to_entitlement_quantity_ratio,
        to_json(prerequisite_quantity_range) as prerequisite_quantity_range,
        allocation_limit,
        target_type,
        to_json(entitled_product_ids) as entitled_product_ids,
        to_json(customer_segment_prerequisite_ids) as customer_segment_prerequisite_ids,
        customer_selection,
        to_json(prerequisite_saved_search_ids) as prerequisite_saved_search_ids,
        to_json(prerequisite_variant_ids) as prerequisite_variant_ids,
        target_selection,
        to_json(prerequisite_to_entitlement_purchase) as prerequisite_to_entitlement_purchase,
        to_json(prerequisite_collection_ids) as prerequisite_collection_ids,
        shop_url,
        starts_at,
        ends_at,
        created_at,
        updated_at

    from source

)

select * from price_rules