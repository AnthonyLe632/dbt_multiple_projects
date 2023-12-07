WITH 
stg_brazillian_ecom__orders AS (SELECT * FROM {{ ref('stg_brazillian_ecom__orders') }}),

fact_orders AS (
    SELECT
        o.*
    FROM stg_brazillian_ecom__orders AS o
)
SELECT * FROM fact_orders

