WITH 
base_brazillian_ecom__customers AS (SELECT * FROM {{ ref('base_brazillian_ecom__customers') }}),
stg_brazillian_ecom__orders AS (SELECT * FROM {{ ref('stg_brazillian_ecom__orders') }}),
stg_brazillian_ecom__order_items AS (SELECT * FROM {{ ref('stg_brazillian_ecom__order_items') }}),

dim_customers AS (
    SELECT 
        customer_id
        , customer_unique_id
        , customer_zip_code_prefix
        , SUM(CASE
                WHEN order_status IN ('delivered', 'invoiced') 
                THEN 1 ELSE 0 END) orders_completed_total
        , SUM(CASE 
                WHEN order_status IN ('canceled', 'unavailable') 
                THEN 1 ELSE 0 END) AS orders_failed_total
        , SUM(CASE 
                WHEN order_status NOT IN ('delivered', 'invoiced', 'canceled','unavailable')
                THEN 1 ELSE 0 END) AS orders_ongoing_total
        , COUNT(o.order_id) AS total_order_purchased
        , COUNT(oi.order_item_id) AS total_item_purchased
        , SUM(oi.item_price) AS total_gmv_bought
        , SUM(oi.freight_value) AS total_freight_value_paid
    FROM base_brazillian_ecom__customers AS c
    LEFT JOIN stg_brazillian_ecom__orders AS o USING (customer_id)
    LEFT JOIN stg_brazillian_ecom__order_items AS oi USING (order_id)
    GROUP BY c.customer_id, c.customer_unique_id, c.customer_zip_code_prefix
)
SELECT * FROM dim_customers