-- Leetcode 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT
a.customer_id,
SUM(a.count_no_trans) AS count_no_trans
FROM
(
SELECT
v.customer_id,
CASE WHEN t.transaction_id IS NULL THEN 1 ELSE 0 END AS count_no_trans
FROM Visits AS v LEFT JOIN Transactions AS t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
) AS a
GROUP BY a.customer_id
-- Leetcode 1075. Project Employees I
SELECT
p.project_id, ROUND(AVG(e.experience_years),2) AS average_years
FROM Project AS p LEFT JOIN Employee AS e
ON p.employee_id = e.employee_id
GROUP BY p.project_id
