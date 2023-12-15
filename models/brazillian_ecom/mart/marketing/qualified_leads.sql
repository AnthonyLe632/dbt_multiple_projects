WITH
qualified_leads AS (SELECT * FROM {{ ref('int_closed_deal_joins_qualified_leads') }}),
sellers_orders AS (SELECT * FROM {{ ref('int_sellers_join_order_items') }}),

final AS (
    SELECT
        ql.*
        , order_id
        , order_item_id
        , prod_id
        , ship_lim_datetime
        , ship_lim_date
        , ship_lim_time
        , item_price
        , freight_value
        , prod_cat_name
        , product_name_len
        , prod_descr_len
        , prod_photo_qty
    FROM sellers_orders AS so
    LEFT JOIN qualified_leads AS ql ON ql.seller_id = so.seller_id
)
SELECT * FROM final