WITH raw_order_reviews AS (SELECT * FROM {{ ref('raw_order_reviews') }}),

stg_order_reviews AS (

    SELECT
        CAST(review_id AS {{ dbt.type_string() }}) AS review_id
        , CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(review_score AS {{ dbt.type_int() }}) AS review_score
        , CAST(review_comment_title AS {{ dbt.type_string() }}) AS review_comment_title
        , CAST(review_comment_message AS {{ dbt.type_string() }}) AS review_comment_message
        , CAST(review_creation_date AS timestamp) AS review_creation_date
        , CAST(review_answer_timestamp AS timestamp) AS review_answer_timestamp
    FROM raw_order_reviews

)

SELECT * FROM stg_order_reviews