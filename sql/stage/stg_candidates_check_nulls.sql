SELECT candidate_id, applied_date, department, recruiting_channel, outcome
FROM `hr-analytics-personio.hr_stage.candidates_raw`
WHERE
  candidate_id IS NULL
  OR applied_date IS NULL
  OR department IS NULL
  OR recruiting_channel IS NULL
  OR outcome IS NULL;
