WITH raw_closed_deals AS (SELECT * FROM {{ source('bigquery', 'closed_deals_dataset') }}),

stg_brazillian_ecom__closed_deals AS (
    SELECT
        CAST(mql_id AS {{ dbt.type_string() }}) AS mql_id
        , CAST(seller_id AS {{ dbt.type_string() }}) AS seller_id
        , CAST(sdr_id AS {{ dbt.type_string() }}) AS sdr_id
        , CAST(sr_id AS {{ dbt.type_string() }}) AS sr_id
        , CAST(won_date AS timestamp) AS won_date
        , CAST(business_segment AS {{dbt.type_string() }}) AS business_segment
        , CAST(lead_type AS {{ dbt.type_string() }}) AS lead_type
        , CAST(lead_behaviour_profile AS {{ dbt.type_string() }}) AS lead_behaviour_profile
        , COALESCE(CAST(has_company AS {{ dbt.type_boolean() }}), FALSE) AS has_company
        , COALESCE(CAST(has_gtin AS {{ dbt.type_boolean() }}), FALSE) AS has_gtin
        , CAST(average_stock AS {{ dbt.type_string() }}) AS avg_stock
        , CAST(business_type AS {{ dbt.type_string() }}) AS biz_type
        , CAST(declared_product_catalog_size AS {{ dbt.type_int() }}) AS declared_prod_catalog_size
        , CAST(declared_monthly_revenue AS {{ dbt.type_int() }}) AS declared_monthly_revenue
    FROM raw_closed_deals
)
SELECT * FROM stg_brazillian_ecom__closed_deals