WITH 
raw_prodct_cat_name_trans AS (SELECT * FROM {{ source('bigquery', 'product_category_name_translation') }}),

stg_brazillian_ecom__prdct_cat_name_trans AS (
    SELECT
        CAST(product_category_name AS {{ dbt.type_string() }}) AS prod_cat_name
        , CAST(product_category_name_english AS {{ dbt.type_string() }}) AS prod_cat_name_en
    FROM raw_prodct_cat_name_trans
)
SELECT * FROM stg_brazillian_ecom__prdct_cat_name_trans