WITH stg_brazillian_ecom__order_reviews AS (
  SELECT * FROM {{ source('bigquery', 'order_reviews') }}
)
SELECT * FROM stg_brazillian_ecom__order_reviews