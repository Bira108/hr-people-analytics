-- What is the hiring funnel conversion rate by recruiting channel and department?

CREATE OR REPLACE TABLE `hr-analytics-personio.hr_integration.int_candidates_hiring_funnel` AS

SELECT 
    candidate_id,
    applied_date,
    department,
    recruiting_channel,
    outcome,
    CASE WHEN outcome = 'Hired' THEN 1 ELSE 0 END AS is_hired
FROM `hr-analytics-personio.hr_stage.candidates_raw` ;
