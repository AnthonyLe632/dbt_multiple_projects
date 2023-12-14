{% docs table_storage_view %}
## TABLE_STORAGE view
The INFORMATION_SCHEMA.TABLE_STORAGE view provides a current snapshot of storage usage for tables and materialised views. When you query the INFORMATION_SCHEMA.TABLE_STORAGE view, the query results contain one row for each table or materialised view for the current project. The data in this table is not kept in real time, and might be delayed by a few seconds to a few minutes.

The table storage views give you a convenient way to observe your current storage consumption, and in addition provide details on whether your storage uses logical uncompressed bytes, physical compressed bytes, or time travel bytes. This information can help you with tasks like planning for future growth and understanding the update patterns for tables.

### Data included in the *_BYTES columns
The *_BYTES columns in the table storage views include information about your use of storage bytes. This information is determined by looking at your storage usage for materialised views and the following types of tables:

Permanent tables created through any of the methods described in Create and use tables.
Temporary tables created in sessions. These tables are placed into datasets with generated names like "_c018003e063d09570001ef33ae401fad6ab92a6a".
Temporary tables created in multi-statement queries ("scripts"). These tables are placed into datasets with generated names like "_script72280c173c88442c3a7200183a50eeeaa4073719".
Data stored in the query results cache is not billed to you and so is not included in the *_BYTES column values.

Clones and snapshots show *_BYTES column values as if they were complete tables, rather than showing the delta from the storage used by the base table, so they are an over-estimation. Your bill does account correctly for this delta in storage usage.

### storage billing
In order to forecast the monthly storage billing for a dataset, you can use either the logical or physical *_BYTES columns in this view, depending on the dataset storage billing model used by the dataset. Please note that this is only a rough forecast, and the precise billing amounts are calculated based on the usage by BigQuery storage billing infrastructure and visible in Cloud Billing.

For datasets that use a logical billing model, you can forecast your monthly storage costs as follows:

((ACTIVE_LOGICAL_BYTES value / POW(1024, 3)) * active logical bytes pricing) + ((LONG_TERM_LOGICAL_BYTES value / POW(1024, 3)) * long-term logical bytes pricing)

The ACTIVE_LOGICAL_BYTES value for a table reflects the active bytes currently used by that table.

For datasets that use a physical billing model, you can forecast your storage costs as follows:

((ACTIVE_PHYSICAL_BYTES value / POW(1024, 3)) * active physical bytes pricing) + ((LONG_TERM_PHYSICAL_BYTES value / POW(1024, 3)) * long-term physical bytes pricing)

The ACTIVE_PHYSICAL_BYTES value for a table reflects the active bytes currently used by that table plus the bytes used for time travel for that table.

To see the active bytes of the table alone, subtract the TIME_TRAVEL_PHYSICAL_BYTES value from the ACTIVE_PHYSICAL_BYTES value.

For more information, see Storage pricing.

### Required roles
To get the permissions that you need to query the INFORMATION_SCHEMA.TABLE_STORAGE view, ask your administrator to grant you the BigQuery Metadata Viewer (roles/bigquery.metadataViewer) IAM role on the project. For more information about granting roles, see Manage access.
{% enddocs %}