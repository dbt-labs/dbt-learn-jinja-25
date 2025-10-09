select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount::decimal(10,4) / 100 as amount,
    created as created_at

from {{ source('stripe','payment') }}