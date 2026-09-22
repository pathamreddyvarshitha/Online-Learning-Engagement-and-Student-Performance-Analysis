create database online_education_db;
use online_education_db;
-- Total Number of Students
SELECT COUNT(DISTINCT id_student) AS total_students FROM online_education_dataset;
-- Average Student Score
SELECT ROUND(AVG(avg_score), 2) AS average_student_score FROM online_education_dataset;
-- Average Total Clicks
SELECT ROUND(AVG(total_clicks), 2) AS average_total_clicks FROM online_education_dataset;
-- Pass and Dropout Analysis
SELECT SUM(CASE WHEN pass_flag = 1 THEN 1 ELSE 0 END) AS students_passed, SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS students_dropped_out FROM online_education_dataset;
-- Engagement Level Analysis
SELECT engagement_level, COUNT(DISTINCT id_student) AS total_students FROM online_education_dataset GROUP BY engagement_level ORDER BY total_students DESC;
--  Performance Level Analysis
SELECT performance_level, COUNT(DISTINCT id_student) AS total_students, ROUND(AVG(avg_score), 2) AS average_score FROM online_education_dataset GROUP BY performance_level ORDER BY average_score DESC;
-- Risk Level Analysis
SELECT risk_level, COUNT(DISTINCT id_student) AS total_students FROM online_education_dataset GROUP BY risk_level ORDER BY total_students DESC;
-- Engagement vs. Performance
SELECT engagement_level, ROUND(AVG(avg_score), 2) AS average_score, COUNT(DISTINCT id_student) AS total_students FROM online_education_dataset GROUP BY engagement_level ORDER BY average_score DESC;
--  Total Clicks vs. Average Score
SELECT CASE WHEN total_clicks < 500 THEN '0 - 500' WHEN total_clicks < 1000 THEN '500 - 1000' WHEN total_clicks < 2000 THEN '1000 - 2000' WHEN total_clicks < 3000 THEN '2000 - 3000' ELSE '3000+' END AS click_band, COUNT(DISTINCT id_student) AS total_students, ROUND(AVG(avg_score), 2) AS average_score FROM online_education_dataset GROUP BY click_band ORDER BY average_score DESC;


--  Dropout Analysis by Engagement Level
SELECT
    engagement_level,
    COUNT(DISTINCT id_student) AS total_students,
    SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS dropout_students,
    ROUND(
        100.0 * SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS dropout_rate
FROM online_education_dataset
GROUP BY engagement_level
ORDER BY dropout_rate DESC;
SELECT
    engagement_level,
    COUNT(DISTINCT id_student) AS total_students,
    SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS dropout_students,
    ROUND(
        100.0 * SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS dropout_rate
FROM online_education_dataset
GROUP BY engagement_level
ORDER BY dropout_rate DESC;
SELECT
    engagement_level,
    COUNT(DISTINCT id_student) AS total_students,
    SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS dropout_students,
    ROUND(
        100.0 * SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS dropout_rate
FROM online_education_dataset
GROUP BY engagement_level
ORDER BY dropout_rate DESC;
-- performance vs dropout
SELECT
    performance_level,
    COUNT(DISTINCT id_student) AS total_students,
    SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) AS dropout_students,
    ROUND(
        100.0 * SUM(CASE WHEN dropout_flag = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS dropout_rate
FROM online_education_dataset
GROUP BY performance_level
ORDER BY dropout_rate DESC;
-- Regional Analysis
SELECT
    region,
    COUNT(DISTINCT id_student) AS total_students,
    ROUND(AVG(avg_score), 2) AS average_score,
    ROUND(AVG(total_clicks), 2) AS average_clicks
FROM online_education_dataset
GROUP BY region
ORDER BY total_students DESC;
-- educational background analysis
SELECT
    highest_education,
    COUNT(DISTINCT id_student) AS total_students,
    ROUND(AVG(avg_score), 2) AS average_score,
    ROUND(AVG(total_clicks), 2) AS average_clicks
FROM online_education_dataset
GROUP BY highest_education
ORDER BY average_score DESC;





