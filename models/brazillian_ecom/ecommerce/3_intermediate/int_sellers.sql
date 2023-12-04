WITH 
stg_sellers AS (SELECT * FROM {{ ref('stg_sellers') }}),
stg_order_items AS (SELECT * FROM {{ ref('stg_order_items') }}),

int_sellers AS (
    SELECT
        s.seller_id
        , seller_zip_code_prefix
        , COUNT(order_id) AS total_order_sold
        , COUNT(order_item_id) AS total_prod_sold
    FROM stg_sellers AS s
    LEFT JOIN stg_order_items AS oi ON s.seller_id = oi.seller_id
    GROUP BY s.seller_id, s.seller_zip_code_prefix
)
SELECT * FROM int_sellers