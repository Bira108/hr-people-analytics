SELECT 
    absence_id, 
    COUNT(absence_id) AS total_count
FROM `hr-analytics-personio.hr_stage.absences_raw`
WHERE absence_id IS NOT NULL
GROUP BY absence_id
HAVING total_count > 1
