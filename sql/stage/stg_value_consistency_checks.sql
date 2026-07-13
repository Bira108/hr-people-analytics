SELECT DISTINCT recruiting_channel
FROM `hr-analytics-personio.hr_stage.candidates_raw`
ORDER BY recruiting_channel;

SELECT DISTINCT outcome
FROM `hr-analytics-personio.hr_stage.candidates_raw`
ORDER BY outcome;

SELECT DISTINCT department
FROM `hr-analytics-personio.hr_stage.employees_raw`
ORDER BY department;

SELECT DISTINCT status
FROM `hr-analytics-personio.hr_stage.employees_raw`
ORDER BY status;

SELECT DISTINCT absence_type
FROM `hr-analytics-personio.hr_stage.absences_raw`
ORDER BY absence_type;

