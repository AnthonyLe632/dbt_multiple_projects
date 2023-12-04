WITH 
raw_orders AS (SELECT * FROM {{ ref('raw_orders') }}),

stg_orders AS (
    SELECT 
        CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(customer_id AS {{ dbt.type_string() }}) AS customer_id
        , CAST(order_status AS {{ dbt.type_string() }}) AS order_status
        , CASE 
            WHEN order_status IN ('delivered', 'invoiced') THEN 1
            ELSE 0 END AS is_completed
        , CASE
            WHEN order_status IN ('canceled', 'unavailable') THEN 1
            ELSE 0 END AS is_failed
        , CASE 
            WHEN order_status NOT IN ('delivered', 'invoiced', 'canceled','unavailable') THEN 1
            ELSE 0 END AS is_ongoing
        , CAST(order_purchase_timestamp AS timestamp) AS order_timestamp
        , CAST(order_approved_at AS timestamp) AS order_approved_at
        , CAST(order_delivered_carrier_date AS timestamp) AS order_delivered_carrier_date
        , CAST(order_delivered_customer_date AS timestamp) AS order_delivered_customer_date
        , CAST(order_estimated_delivery_date AS timestamp) AS order_est_delivery_date
    FROM raw_orders 
)
SELECT * FROM stg_orders