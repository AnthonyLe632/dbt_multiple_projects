with
dbt_utils_date_spine AS (SELECT * FROM {{ref('dbt_utils_date_spine')}}),

pre_final AS (
    SELECT
        CAST({{ CAST_date_to_string('date_day', 'YYYYMMDD') }} AS {{ dbt.type_int() }}) AS date_key
        , CAST(date_day AS date) AS date
        , extract(year FROM date_day) AS year
        , 'q' || extract(quarter FROM date_day) AS quartal
        , extract(month FROM date_day) AS month
        , {{ dbt_date.month_name('date_day', short=false) }} AS month_name
        , {{ dbt_date.iso_week_of_year('date_day') }} AS iso_week_of_year
        , {{ dbt_date.day_of_month('date_day') }} AS day_of_month
        , {{ CAST_date_to_string('date_day', 'MM/YYYY') }} AS year_month
        , {{ dbt_date.day_of_year('date_day') }} AS day_of_year
        , {{ dbt_date.day_name('date_day', short=false) }} AS day_name
        , current_date() AS today_date
        --, to_char(date_day, 'yyyy/"q"q') AS year_quartal
        --, to_char(date_day, 'iyyy/iw') AS year_calendar_week -- ISO calendar year and week
    FROM dbt_utils_date_spine
),
final AS (
    SELECT
        *
        , {{ CAST_timestamptz_to_date(dbt.date_trunc('month', 'date'), 'ASia/Ho_Chi_Minh') }} AS month_date
    FROM pre_final
)
SELECT * FROM final