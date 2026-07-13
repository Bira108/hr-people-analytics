SELECT absence_id, employee_id, department, absence_type, duration_days
FROM `hr-analytics-personio.hr_stage.absences_raw`
WHERE
  absence_id IS NULL
  OR employee_id IS NULL
  OR department IS NULL
  OR absence_type IS NULL
  OR duration_days IS NULL;
