WITH
stg_order_payments AS (SELECT * FROM {{ ref('stg_order_payments') }}),
stg_orders AS (SELECT * FROM {{ ref('stg_orders') }}),

int_payments AS (
    SELECT
        p.order_id
        , payment_sequential
        , payment_type
        , payment_installments
        , payment_value
    FROM stg_order_payments AS p
    LEFT JOIN stg_orders USING(order_id)
)
SELECT * FROM int_payments