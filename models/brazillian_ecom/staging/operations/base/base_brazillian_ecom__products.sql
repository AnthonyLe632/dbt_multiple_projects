WITH 
raw_products AS (SELECT * FROM {{ source('bigquery', 'products_dataset') }}),

base_brazillian_ecom__customers AS (
    SELECT
        CAST(product_id AS {{ dbt.type_string() }}) AS prod_id
        , CAST(product_category_name AS {{ dbt.type_string() }}) AS prod_cat_name
        , CAST(product_name_length AS {{ dbt.type_int() }}) AS product_name_len
        , CAST(product_description_length AS {{ dbt.type_int() }}) AS prod_descr_len
        , CAST(product_photos_qty AS {{ dbt.type_int() }}) AS prod_photo_qty
        , CAST(product_weight_g AS {{ dbt.type_float() }}) AS prod_wt_g
        , CAST(product_length_cm AS {{ dbt.type_float() }}) AS prod_len_cm
        , CAST(product_height_cm AS {{ dbt.type_float() }}) AS prod_h_cm
        , CAST(product_width_cm AS {{ dbt.type_float() }}) AS prod_w_cm
    FROM raw_products
    WHERE product_category_name IS NOT NULL
)
SELECT * FROM base_brazillian_ecom__customers