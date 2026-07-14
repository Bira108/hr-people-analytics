-- What is the average absence rate by department and absence type?

-- Step 1: summarize absence days per department and absence type

CREATE OR REPLACE TABLE `hr-analytics-personio.hr_consumer.con_absence_rate_by_department`
AS
WITH
  absence_summary AS (
    SELECT
      department,
      absence_type,
      SUM(duration_days) AS total_absence_days
    FROM `hr-analytics-personio.hr_integration.int_absences_rate`
    GROUP BY department, absence_type
  ),

  -- Step 2: count distinct employees per department
  employee_summary AS (
    SELECT
      department,
      COUNT(DISTINCT employee_id) AS total_employees
    FROM `hr-analytics-personio.hr_integration.int_employees_turnover`
    GROUP BY department
  )

-- Step 3: join the two summaries and calculate the rate
SELECT
  a.department,
  a.absence_type,
  a.total_absence_days,
  e.total_employees,
  ROUND(a.total_absence_days / (e.total_employees * 250) * 100, 2)
    AS absence_rate
FROM absence_summary a
INNER JOIN employee_summary e
  ON a.department = e.department
ORDER BY absence_rate DESC;

-- query check--

SELECT COUNT(*) AS total_rows
FROM `hr-analytics-personio.hr_consumer.con_absence_rate_by_department`  ;


