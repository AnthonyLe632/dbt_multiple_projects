WITH
stg_brazillian_ecom__order_payments AS (SELECT * FROM {{ ref('stg_brazillian_ecom__order_payments') }}),
stg_brazillian_ecom__orders AS (SELECT * FROM {{ ref('stg_brazillian_ecom__orders') }}),

dim_payments AS (
    SELECT
        p.order_id
        , payment_sequential
        , payment_types
        , payment_installments
        , payment_value
    FROM stg_brazillian_ecom__order_payments AS p
    LEFT JOIN stg_brazillian_ecom__orders USING(order_id)
)
SELECT * FROM dim_payments