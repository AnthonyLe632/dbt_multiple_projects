{{
    config(
        materialized='incremental'
    )
}}

SELECT
    *
FROM {{ ref('stg_bq__bytes_processed_by_project') }}

{% if is_incremental() %}

WHERE creation_time >= (SELECT MAX(creation_time) FROM {{ this }})

{% endif %}