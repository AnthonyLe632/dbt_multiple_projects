WITH 
raw_geolocation AS (SELECT * FROM {{ source('bigquery', 'geolocation') }}),

stg_brazillian_ecom__geoloc AS (
    SELECT
        CAST(geolocation_zip_code_prefix AS {{ dbt.type_int() }}) AS geoloc_zip_code_prefix
        , CAST(geolocation_lat AS {{ dbt.type_float() }}) AS geoloc_lat
        , CAST(geolocation_lng AS {{ dbt.type_float() }}) AS geoloc_lng
        , CAST(geolocation_city AS {{ dbt.type_string() }}) AS geoloc_city
        , CAST(geolocation_state AS {{ dbt.type_string() }}) AS geoloc_state
    FROM raw_geolocation
)
SELECT * FROM stg_brazillian_ecom__geoloc