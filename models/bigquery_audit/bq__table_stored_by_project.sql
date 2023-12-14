{{
    config(
        materialized='table'
    )
}}

SELECT 
    project_id
    , table_schema
    , table_name
    , creation_time
    , total_rows
    , total_partitions
    , total_logical_bytes / POWER(1024, 3) AS total_logical_gb
    , active_logical_bytes / POWER(1024, 3) AS active_logical_gb
    , long_term_logical_bytes / POWER(1024, 3) AS long_term_logical_gb
    , total_physical_bytes / POWER(1024, 3) AS total_physical_gb
    , active_physical_bytes / POWER(1024, 3) AS active_physical_gb
    , long_term_physical_bytes / POWER(1024, 3) AS long_term_physical_gb
    , time_travel_physical_bytes / POWER(1024, 3) AS time_travel_physical_gb
    , storage_last_modified_time
    , table_type
    , fail_safe_physical_bytes / POWER(1024, 3) AS fail_safe_physical_gb
FROM region-us.INFORMATION_SCHEMA.TABLE_STORAGE
WHERE deleted = false