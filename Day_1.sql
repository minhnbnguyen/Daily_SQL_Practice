-- Who Made Quota? [Oracle SQL Interview Question] Data Lemur
SELECT DISTINCT a.employee_id,
CASE
  WHEN SUM (a.deal_size) OVER (PARTITION BY a.employee_id) >= b.quota THEN 'yes'
  ELSE 'no'
END AS made_quota
FROM deals AS a JOIN sales_quotas AS b
ON a.employee_id=b.employee_id
ORDER BY a.employee_id;
