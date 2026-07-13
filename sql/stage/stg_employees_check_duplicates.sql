SELECT 
    employee_id, 
    COUNT(employee_id) AS total_count
FROM `hr-analytics-personio.hr_stage.employees_raw`
WHERE employee_id IS NOT NULL
GROUP BY employee_id
HAVING total_count > 1
