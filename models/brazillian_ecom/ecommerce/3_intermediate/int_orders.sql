WITH 
stg_orders AS (SELECT * FROM {{ ref('stg_orders') }}),
stg_order_items AS (SELECT * FROM {{ ref('stg_order_items') }}),

int_orders AS (
    SELECT
        o.*
        , order_item_id
        , seller_id
        , item_price
        , freight_value
        , (item_price + freight_value) AS order_total_value
    FROM stg_orders AS o
    LEFT JOIN stg_order_items AS oi ON oi.order_id = o.order_id
)
SELECT * FROM int_orders

