{% set payment_pivot_columns = ['ongoing_rate','ongoing_transaction_total','payment_types', 
                                'transaction_total', 'payment_value_total', 'success_rate', 
                                'success_payment_value_total', 'success_transaction_total'] %}

WITH 
payments_pivot AS (SELECT {{payment_pivot_columns | join(', ') }} FROM {{ ref('int_orders_pivoted_to_payments') }}),

payments_pivot_usd AS (
    SELECT 
        payment_types
        , transaction_total
        , success_transaction_total
        , ongoing_transaction_total
        , success_rate
        , ongoing_rate
        , (payment_value_total * (SELECT real_to_usd FROM {{ ref('exchange_rate_real_to_usd') }})) AS payment_value_total_usd
        , (success_payment_value_total * (SELECT real_to_usd FROM {{ ref('exchange_rate_real_to_usd') }})) AS success_payment_value_total_usd
    FROM payments_pivot

),
final AS (
    SELECT
        *
    FROM payments_pivot_usd
    ORDER BY success_payment_value_total_usd ASC
)
SELECT * FROM final
