WITH raw_orders AS (SELECT * FROM {{ ref('raw_orders') }}),

stg_orders AS (

    SELECT 
        CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(customer_id AS {{ dbt.type_string() }}) AS customer_id
        , CAST(order_status AS {{ dbt.type_string() }}) AS order_status
        , CAST(order_purchase_timestamp AS timestamp) AS order_purchase_timestamp
        , CAST(order_approved_at AS timestamp) AS order_approved_at
        , CAST(order_delivery_carrier_date AS timestamp) AS order_delivery_carrier_date
        , CAST( order_deliverty_customer_date AS timestamp) AS order_deliverty_customer_date
        , CAST(order_estimated_delivery_date AS timestamp) AS order_estimated_delivery_date
    FROM raw_orders 

)

SELECT * FROM stg_orders