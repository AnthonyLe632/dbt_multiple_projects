SELECT 
    project_id
    , table_schema
    , table_name
    , creation_time
    , total_rows
    , total_partitions
    , total_logical_bytes
    , active_logical_bytes
    , long_term_logical_bytes
    , total_physical_bytes
    , active_physical_bytes
    , long_term_physical_bytes
    , time_travel_physical_bytes
    , storage_last_modified_time
    , deleted
    , table_type
    , fail_safe_physical_bytes
FROM region-us.INFORMATION_SCHEMA.TABLE_STORAGE
WHERE deleted = false