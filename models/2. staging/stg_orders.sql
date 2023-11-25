WITH raw_orders AS (SELECT * FROM {{ ref('raw_orders') }}),

stg_orders AS (

    SELECT 
        CAST(order_id AS {{ dbt.type_string() }}) AS po_id
        , CAST(customer_id AS {{ dbt.type_string() }}) AS customer_id
        , CAST(order_status AS {{ dbt.type_string() }}) AS po_status
        , CAST(order_purchase_timestamp AS timestamp) AS po_timestamp
        , CAST(order_approved_at AS timestamp) AS po_approved_at
        , CAST(order_delivered_carrier_date AS timestamp) AS po_delivered_carrier_date
        , CAST(order_delivered_customer_date AS timestamp) AS po_delivered_customer_date
        , CAST(order_estimated_delivery_date AS timestamp) AS po_est_delivery_date
    FROM raw_orders 

)

SELECT * FROM stg_orders