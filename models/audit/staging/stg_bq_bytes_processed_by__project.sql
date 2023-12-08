{%- set metadata_cols = ['creation_time', 'project_id', 'job_id', 'job_type', 'statement_type', 'start_time', 
                        'end_time', 'state', 'total_bytes_processed', 'total_slot_ms', 'query'
                        'referenced_tables', 'total_bytes_billed'
                        ] -%}

WITH jobs_by_project AS (
    SELECT 
      {{metadata_cols | join(', ') }}
    FROM `region-us.INFORMATION_SCHEMA.JOBS_BY_PROJECT`
    WHERE creation_time >= '2023-11-10 00:00:00.000000 UTC'
        AND project_id = 'spheric-radio-397503' 
        AND user_email = 'brazil-ecom@spheric-radio-397503.iam.gserviceaccount.com'
)
-- Extract dataset_id from the array of structs
SELECT
  *
  , (SELECT x.dataset_id 
      FROM UNNEST(referenced_tables) AS x LIMIT 1) AS dataset_id
FROM jobs_by_project
