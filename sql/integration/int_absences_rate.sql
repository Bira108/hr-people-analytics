-- what is the average absence rate by department and absence type?

CREATE OR REPLACE TABLE `hr-analytics-personio.hr_integration.int_absences_rate` AS

SELECT 
    absence_id,
    employee_id,
    department,
    absence_type,
    duration_days,
    start_date
    FROM `hr-analytics-personio.hr_stage.absences_raw`;

-- sanity check

SELECT COUNT(*) AS total_rows
FROM `hr-analytics-personio.hr_integration.int_absences_rate`;
