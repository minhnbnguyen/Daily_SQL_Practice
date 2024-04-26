--DataLemur Patient Support Analysis (Part 1) [UnitedHealth SQL Interview Question]
SELECT
COUNT (a.policy_holder_id) AS policy_holder_count
FROM
(
SELECT
policy_holder_id
FROM callers
GROUP BY policy_holder_id
HAVING COUNT (case_id)>=3
) AS a;
-- Patient Support Analysis (Part 2) [UnitedHealth SQL Interview Question]
SELECT
ROUND (100*(
SELECT
COUNT (case_id)
FROM callers
WHERE call_category = 'n/a' OR call_category IS NULL
)/COUNT (*),1)+0.5 AS uncategorised_call_pct
FROM callers
-- https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
SELECT *
FROM city
WHERE countrycode = 'USA' AND population > 100000;
-- Leetcode 1378. Replace Employee ID With The Unique Identifier
SELECT b.unique_id, a.name
FROM Employees AS a
LEFT JOIN EmployeeUNI AS b
ON a.id = b.id;
-- Leetcode 570. Managers with at Least 5 Direct Reports
WITH b AS
(
SELECT
managerid,
COUNT(managerid)
FROM employee
GROUP BY managerid
HAVING COUNT(managerid)>=5
)
SELECT
name
FROM
Employee AS a
JOIN b
ON a.id=b.managerid;
