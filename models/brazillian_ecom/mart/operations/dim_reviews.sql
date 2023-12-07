WITH 
stg_brazillian_ecom__order_reviews AS (SELECT * FROM {{ ref('stg_brazillian_ecom__order_reviews') }}),

dim_reviews AS (
    SELECT
        CAST(review_id AS {{ dbt.type_string() }}) AS rev_id
        , CAST(order_id AS {{ dbt.type_string() }}) AS order_id
        , CAST(review_score AS {{ dbt.type_int() }}) AS rev_score
        , CAST(review_comment_title AS {{ dbt.type_string() }}) AS rev_cmt_title
        , CAST(review_comment_message AS {{ dbt.type_string() }}) AS rev_cmt_message
        , CAST(review_creation_date AS timestamp) AS rev_creation_date
        , CAST(review_answer_timestamp AS timestamp) AS rev_answer_timestamp
    FROM stg_brazillian_ecom__order_reviews
)
SELECT * FROM dim_reviews