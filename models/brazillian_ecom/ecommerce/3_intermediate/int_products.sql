WITH
stg_products AS (SELECT * FROM {{ ref('stg_products') }}),
stg_prdct_cat_name_trans AS (SELECT * FROM {{ ref('stg_prdct_cat_name_trans') }}),

int_products AS (
    SELECT
        prod_id
        , prod_cat_name_en AS prod_category
        , prod_descr_len
        , prod_photo_qty
        , prod_wt_g
        , prod_len_cm
        , prod_h_cm
        , prod_w_cm
    FROM stg_products
    LEFT JOIN stg_prdct_cat_name_trans USING(prod_cat_name)
)
SELECT * FROM int_products