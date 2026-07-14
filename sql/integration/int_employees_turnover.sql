-- Which departments have the highest employee turnover rate per quarter?

CREATE OR REPLACE TABLE `hr-analytics-personio.hr_integration.int_employees_turnover` AS

SELECT 
    employee_id,
    department,
    start_date,
    status,
    termination_quarter
    FROM `hr-analytics-personio.hr_stage.employees_raw`;

