WITH 
stg_order_items AS (SELECT * FROM {{ ref('stg_order_items') }}),

dim_items AS (
    SELECT 
        order_id
        , seller_id
        , order_item_id
        , prod_id
        , item_price
        , freight_value
    FROM stg_order_items
)
SELECT * FROM dim_items