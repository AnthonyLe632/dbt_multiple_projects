WITH 
closed_deals AS (SELECT * FROM {{ ref('stg_brazillian_ecom__closed_deals') }}),
mkt_qualified_leads AS (SELECT * FROM {{ ref('stg_brazillian_ecom__mkt_qualified_leads') }}),

joins AS (
    SELECT
        cd.*
        , first_contact_date
        , landing_page_id
        , origin
    FROM closed_deals AS cd
    LEFT JOIN mkt_qualified_leads AS ql ON cd.mql_id = ql.mql_id
)
SELECT * FROM joins