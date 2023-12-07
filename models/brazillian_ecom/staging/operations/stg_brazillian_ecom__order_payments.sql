WITH 
raw_order_payments AS (SELECT * FROM {{ source('bigquery', 'order_payments') }}),

stg_brazillian_ecom__order_payments AS (
    SELECT
        CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(payment_sequential AS {{ dbt.type_int() }}) AS payment_sequential
        , CAST(payment_type AS {{ dbt.type_string() }}) AS payment_types
        , CAST(payment_installments AS {{ dbt.type_int() }}) AS payment_installments
        , CAST(payment_value AS {{dbt.type_float() }}) AS payment_value
    FROM raw_order_payments
)
SELECT * FROM stg_brazillian_ecom__order_payments