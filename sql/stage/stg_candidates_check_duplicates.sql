SELECT 
    candidate_id, 
    COUNT(candidate_id) AS total_count
FROM `hr-analytics-personio.hr_stage.candidates_raw`
WHERE candidate_id IS NOT NULL
GROUP BY candidate_id
HAVING total_count > 1
