CREATE OR REPLACE TABLE `hr-analytics-personio.hr_consumer.con_turnover_by_dept_summary` AS
SELECT
    department,
    COUNT(employee_id) AS total_employees,
    COUNTIF(status = 'Terminated') AS total_terminated,
    ROUND(COUNTIF(status = 'Terminated') / COUNT(employee_id) * 100, 1) AS termination_rate
FROM `hr-analytics-personio.hr_integration.int_employees_turnover`
GROUP BY department
ORDER BY termination_rate DESC ;
