WITH raw_prodct_cat_name_trans AS (SELECT * FROM {{ ref('raw_prodct_cat_name_trans') }}),

stg_prdct_cat_name_trans AS (

    SELECT
        CAST(product_category_name AS {{ dbt.type_string() }}) AS prod_cat_name
        , CAST(product_category_name_english AS {{ dbt.type_string() }}) AS prod_cat_name_en
    FROM raw_prodct_cat_name_trans

)

SELECT * FROM stg_prdct_cat_name_trans