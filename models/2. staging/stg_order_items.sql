WITH raw_order_items as (SELECT * FROM {{ ref('raw_order_items') }}),

stg_order_items AS (

    SELECT
        CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(order_item_id AS {{ dbt.type_int() }}) AS order_item_id
        , CAST(product_id AS {{ dbt.type_string() }}) AS product_id
        , CAST(seller_id AS {{ dbt.type_string() }}) AS seller_id
        , CAST(shipping_limit_date AS timestamp) AS shipping_limit_date
        , CAST(shipping_limit_date AS DATE) AS extracted_date
        , CAST(shipping_limit_date AS time) AS extracted_time
        , CAST(price AS {{ dbt.type_float() }}) AS item_price
        , CAST(freight_value as {{ dbt.type_float() }}) AS freight_value
    FROM raw_order_items 

)

SELECT * FROM stg_order_items