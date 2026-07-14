-- What is the hiring funnel conversion rate by recruiting channel and department?

-- I understood why we use SUM, but I still cant make the query on my own. My try:

CREATE OR REPLACE TABLE `hr-analytics-personio.hr_consumer.con_hiring_funnel_by_channel`
AS
SELECT
    department,
    recruiting_channel,
    COUNT(candidate_id) AS total_candidates,
    SUM(is_hired) AS total_hired,
    ROUND(SUM(is_hired) / COUNT(candidate_id) * 100, 2) AS hire_rate
FROM `hr-analytics-personio.hr_integration.int_candidates_hiring_funnel`
GROUP BY department, recruiting_channel
ORDER BY department, hire_rate DESC;

-- sanity check

SELECT COUNT(*) AS total_rows
FROM `hr-analytics-personio.hr_consumer.con_hiring_funnel_by_channel`;
