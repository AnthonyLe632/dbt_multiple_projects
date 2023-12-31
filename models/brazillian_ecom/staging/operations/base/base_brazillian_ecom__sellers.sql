WITH 
raw_sellers AS (SELECT * FROM {{ source('bigquery', 'sellers') }}),

base_brazillian_ecom__sellers AS (
    SELECT
        CAST(seller_id AS {{ dbt.type_string() }}) AS seller_id
        , CAST(seller_zip_code_prefix AS {{dbt.type_int() }}) AS seller_zip_code_prefix
        , CAST(seller_city AS {{ dbt.type_string() }}) AS seller_city
        , CAST(seller_state AS {{dbt.type_string() }}) AS seller_state
    FROM raw_sellers
)
SELECT * FROM base_brazillian_ecom__sellers