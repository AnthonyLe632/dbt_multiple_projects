WITH 
stg_orders AS (SELECT * FROM {{ ref('stg_orders') }}),

fact_orders AS (
    SELECT
        o.*
    FROM stg_orders AS o
)
SELECT * FROM fact_orders

