with

source as (

    select * from {{ source('shopify', 'disputes') }}

),

disputes as (

    select
        id as dispute_id,
        order_id,
        reason,
        amount,
        currency,
        type,
        network_reason_code,
        status,
        initiated_at,
        evidence_due_by,
        evidence_sent_on,
        finalized_on

    from source

)

select * from disputes