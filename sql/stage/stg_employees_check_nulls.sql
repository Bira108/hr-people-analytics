SELECT employee_id, start_date, department, status
FROM `hr-analytics-personio.hr_stage.employees_raw`
WHERE
  employee_id IS NULL
  OR start_date IS NULL
  OR department IS NULL
  OR status IS NULL;
  
