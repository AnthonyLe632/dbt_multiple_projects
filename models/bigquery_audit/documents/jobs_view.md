{% docs jobs_view %}
## JOBS view
The INFORMATION_SCHEMA.JOBS view contains near real-time metadata about all BigQuery jobs in the current project.

### Required role
To get the permission that you need to query the INFORMATION_SCHEMA.JOBS view, ask your administrator to grant you the BigQuery Resource Viewer (roles/bigquery.resourceViewer) IAM role on your project. For more information about granting roles, see Manage access.

This predefined role contains the bigquery.jobs.listAll permission, which is required to query the INFORMATION_SCHEMA.JOBS view.

You might also be able to get this permission with custom roles or other predefined roles.

For more information about BigQuery permissions, see Access control with IAM.

When you query INFORMATION_SCHEMA.JOBS to find a summary cost of query jobs, exclude the SCRIPT statement type, otherwise some values might be counted twice. The SCRIPT row includes summary values for all child jobs that were executed as part of this job.
###  retention
This view contains currently running jobs and the job history of the past 180 days.
{% enddocs %}