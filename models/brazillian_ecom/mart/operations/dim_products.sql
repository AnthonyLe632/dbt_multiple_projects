WITH
stg_brazillian_ecom__products AS (SELECT * FROM {{ ref('stg_brazillian_ecom__products') }}),
stg_brazillian_ecom__prdct_cat_name_trans AS (SELECT * FROM {{ ref('stg_brazillian_ecom__prdct_cat_name_trans') }}),

dim_products AS (
    SELECT
        prod_id
        , prod_cat_name_en AS prod_category
        , prod_descr_len
        , prod_photo_qty
        , prod_wt_g
        , prod_len_cm
        , prod_h_cm
        , prod_w_cm
    FROM stg_brazillian_ecom__products
    LEFT JOIN stg_brazillian_ecom__prdct_cat_name_trans USING(prod_cat_name)
)
SELECT * FROM dim_products