CREATE OR REPLACE TABLE `hr-analytics-personio.hr_consumer.con_turnover_by_department` AS

WITH base AS (
    SELECT
        department,
        termination_quarter,
        COUNT(employee_id) AS employees_terminated
    FROM `hr-analytics-personio.hr_integration.int_employees_turnover`
    WHERE status = 'Terminated'
    GROUP BY department, termination_quarter
),

headcount AS (
    SELECT
        department,
        COUNT(employee_id) AS total_employees
    FROM `hr-analytics-personio.hr_integration.int_employees_turnover`
    GROUP BY department
)

SELECT
    b.department,
    b.termination_quarter,
    h.total_employees,
    b.employees_terminated,
    ROUND(b.employees_terminated / h.total_employees * 100, 1) AS turnover_rate,
    CAST(SUBSTR(b.termination_quarter, 4, 4) AS INT64) * 10 +
    CAST(SUBSTR(b.termination_quarter, 2, 1) AS INT64) AS quarter_sort,
    DATE(
        CAST(SUBSTR(b.termination_quarter, 4, 4) AS INT64),
        (CAST(SUBSTR(b.termination_quarter, 2, 1) AS INT64) - 1) * 3 + 1,
        1
    ) AS quarter_start_date
FROM base b
INNER JOIN headcount h
    ON b.department = h.department
ORDER BY quarter_sort ;


-- sanity check

SELECT COUNT(*) AS total_rows
FROM `hr-analytics-personio.hr_consumer.con_turnover_by_department`;
