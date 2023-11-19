with

source as (

    select * from {{ source('shopify', 'shop') }}

),

shop as (

    select
        id as shop_id,
        country,
        has_gift_cards,
        multi_location_enabled,
        source,
        province_code,
        money_with_currency_in_emails_format,
        plan_display_name,
        province,
        eligible_for_payments,
        longitude,
        latitude,
        zip,
        has_discounts,
        force_ssl,
        password_enabled,
        eligible_for_card_reader_giveaway,
        iana_timezone,
        auto_configure_tax_inclusivity,
        to_json(enabled_presentment_currencies) as enabled_presentment_currencies,
        plan_name,
        requires_extra_payments_agreement,
        country_code,
        weight_unit,
        cookie_consent_level,
        phone,
        domain,
        customer_email,
        name,
        county_taxes,
        money_with_currency_format,
        money_in_emails_format,
        finances,
        shop_owner,
        pre_launch_enabled,
        city,
        timezone,
        taxes_included,
        checkout_api_supported,
        setup_required,
        money_format,
        country_name,
        currency,
        email,
        primary_location_id,
        google_apps_login_enabled,
        address1,
        address2,
        primary_locale,
        has_storefront,
        tax_shipping,
        transactional_sms_disabled,
        google_apps_domain,
        myshopify_domain,
        visitor_tracking_consent_preference,
        marketing_sms_consent_enabled_at_checkout,
        shop_url,
        created_at,
        updated_at

    from source

)

select * from shop