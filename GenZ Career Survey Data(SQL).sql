create Database genzdata;
use genzdata;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/GenZ Career Survey Data.csv'
INTO TABLE `genz career survey data`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT 
    *
FROM
    datatable;

RENAME TABLE `genz career survey data` TO datatable;

1. What industries are Gen-Z most interested in pursuing careers in?

SELECT 
    `Aspirational Career`, COUNT(*) AS total
FROM
    datatable
GROUP BY `Aspirational Career`
ORDER BY total DESC
LIMIT 3;

2. What are the top factors influencing Gen-Z’s career choices?

SELECT 
    `Factors Affecting Career Aspirations`, COUNT(*) AS Count
FROM
    datatable
GROUP BY `Factors Affecting Career Aspirations`
ORDER BY Count DESC
LIMIT 5;

. What is the desired work environment for Gen-Z? (e.g., remote, hybrid, in-office)

SELECT 
    `Preferred Working Environment`, COUNT(*) AS total
FROM
    datatable
GROUP BY `Preferred Working Environment`
ORDER BY total DESC;

4. How do financial goals, such as salary and benefits, impact career aspirations among Gen-Z?

"Type 1"
SELECT 
    `Aspirational Career`,
    `Min Starting Salary (Monthly)`,
    COUNT(*) AS Count
FROM
    datatable
GROUP BY `Aspirational Career` , `Min Starting Salary (Monthly)`
ORDER BY Count DESC;

"Type 2"
SELECT 
    `Aspirational Career`,
    `Min Starting Salary (Monthly)`,
    COUNT(*) AS Count
FROM
    datatable
WHERE
    `Aspirational Career` IS NOT NULL
        AND `Min Starting Salary (Monthly)` IS NOT NULL
GROUP BY `Aspirational Career` , `Min Starting Salary (Monthly)`
ORDER BY Count DESC
LIMIT 5;

5. What role do personal values and social impact play in career choices for Gen-Z?

SELECT `Aspirational Career`, `Work for Company with Misaligned Mission`, `Work for Company Without Clear Mission`, `Work for Company Without Social Impact`, COUNT(*) AS Count
FROM datatable
GROUP BY `Aspirational Career`, `Work for Company with Misaligned Mission`, `Work for Company Without Clear Mission`, `Work for Company Without Social Impact`
ORDER BY Count DESC
Limit 10;

