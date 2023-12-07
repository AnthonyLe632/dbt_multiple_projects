{%- set payment_columns = ['order_id', 'payment_types', 'payment_value'] -%}
{%- set order_columns = ['order_id', 'order_status'] -%}

WITH
payments AS (SELECT {{payment_columns | join(', ') }}  FROM {{ ref('stg_brazillian_ecom__order_payments') }}),
orders AS (SELECT {{order_columns | join(', ') }} FROM {{ ref('stg_brazillian_ecom__orders') }}), 

payments_pivot AS (
    SELECT 
        payment_types
        , COUNT(order_id) AS transaction_total
        , SUM(payment_value) AS payment_value_total
        , SUM(CASE
                WHEN order_status IN ('delivered', 'invoiced') 
                THEN payment_value ELSE 0 END) AS success_payment_value_total
        , SUM(CASE 
                WHEN order_status IN ('delivered', 'invoiced') 
                THEN 1 ELSE 0 END) AS success_transaction_total
        , SUM(CASE 
                WHEN order_status IN ('canceled', 'unavailable') 
                THEN 1 ELSE 0 END) AS failed_transaction_total
        , SUM(CASE 
                WHEN order_status NOT IN ('delivered', 'invoiced', 'canceled','unavailable')
                THEN 1 ELSE 0 END) AS ongoing_transaction_total
FROM payments AS p
    INNER JOIN orders AS o USING(order_id)
    GROUP BY 1
),
final AS (
    SELECT
        *
        , success_transaction_total / transaction_total AS success_rate
        , ongoing_transaction_total / transaction_total AS ongoing_rate
    FROM payments_pivot
)
SELECT * FROM final