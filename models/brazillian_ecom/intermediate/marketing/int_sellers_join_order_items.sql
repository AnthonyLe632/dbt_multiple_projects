WITH
sellers AS (SELECT seller_id FROM {{ ref('base_brazillian_ecom__sellers') }}),
order_items AS (SELECT * FROM {{ ref('stg_brazillian_ecom__order_items') }}),
products AS (SELECT prod_id
                    ,prod_cat_name
                    , product_name_len
                    , prod_descr_len
                    , prod_photo_qty
            FROM {{ ref('base_brazillian_ecom__products') }}),

sellers_orders AS (
    SELECT
        s.seller_id
        , oi.order_id
        , oi.order_item_id
        , oi.prod_id
        , oi.ship_lim_datetime
        , oi.ship_lim_date
        , oi.ship_lim_time
        , oi.item_price
        , oi.freight_value
    FROM sellers AS s
    LEFT JOIN order_items AS oi ON s.seller_id = oi.seller_id
),
final AS (
    SELECT
        so.*
        , prod_cat_name
        , product_name_len
        , prod_descr_len
        , prod_photo_qty
    FROM sellers_orders AS so
    LEFT JOIN products AS p ON so.prod_id = p.prod_id
)
SELECT * FROM final