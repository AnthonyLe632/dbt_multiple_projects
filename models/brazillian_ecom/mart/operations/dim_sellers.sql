WITH 
stg_brazillian_ecom__sellers AS (SELECT * FROM {{ ref('stg_brazillian_ecom__sellers') }}),
stg_brazillian_ecom__order_items AS (SELECT * FROM {{ ref('stg_brazillian_ecom__order_items') }}),

dim_sellers AS (
    SELECT
        s.seller_id
        , seller_zip_code_prefix
        , COUNT(order_id) AS total_order_sold
        , COUNT(order_item_id) AS total_prod_sold
    FROM stg_brazillian_ecom__sellers AS s
    LEFT JOIN stg_brazillian_ecom__order_items AS oi ON s.seller_id = oi.seller_id
    GROUP BY s.seller_id, s.seller_zip_code_prefix
)
SELECT * FROM dim_sellers