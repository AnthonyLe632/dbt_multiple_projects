WITH 
raw_geo_data AS (SELECT * FROM {{ ref('raw_geo_data') }}),

stg_geo_data AS (
    SELECT
        CAST(id AS {{ dbt.type_int() }}) AS row_id
        , CAST(geolocation_lat AS {{ dbt.type_float() }}) AS geoloc_lat
        , CAST(geolocation_lng AS {{ dbt.type_float() }}) AS geoloc_lng
        , CAST(geolocation_city AS {{ dbt.type_string() }}) AS geoloc_city
        , CAST(geolocation_state AS {{ dbt.type_string() }}) AS geoloc_state
    FROM raw_geo_data
)
SELECT * FROM stg_geo_data