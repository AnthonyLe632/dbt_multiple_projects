WITH 
stg_customers AS (SELECT * FROM {{ ref('stg_customers') }}),
stg_orders AS (SELECT * FROM {{ ref('stg_orders') }}),
stg_order_items AS (SELECT * FROM {{ ref('stg_order_items') }}),

dim_customers AS (
    SELECT 
        customer_id
        , customer_unique_id
        , customer_zip_code_prefix
        , SUM(is_completed) AS orders_completed_total
        , SUM(is_failed) AS orders_failed_total
        , SUM(is_ongoing) AS orders_ongoing_total
        , COUNT(o.order_id) AS total_order_purchased
        , COUNT(oi.order_item_id) AS total_item_purchased
        , SUM(oi.item_price) AS total_gmv_bought
        , SUM(oi.freight_value) AS total_freight_value_paid
    FROM stg_customers AS c
    LEFT JOIN stg_orders AS o USING (customer_id)
    LEFT JOIN stg_order_items AS oi USING (order_id)
    GROUP BY c.customer_id, c.customer_unique_id, c.customer_zip_code_prefix
)
SELECT * FROM dim_customers