WITH raw_mkt_qualified_leads AS (SELECT * FROM {{ ref('raw_mkt_qualified_leads') }}),

stg_mkt_qualified_leads AS (

    SELECT
        CAST(mql_id AS {{ dbt.type_string() }}) AS mql_id
        , CAST(first_contact_date AS timestamp) AS first_contact_date
        , CAST(landing_page_id AS {{ dbt.type_string() }}) AS landing_page_id
        , CAST(origin AS {{ dbt.type_string()}}) AS origin
    FROM raw_mkt_qualified_leads

)

SELECT * FROM stg_mkt_qualified_leads