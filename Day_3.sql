-- International Call Percentage [Verizon SQL Interview Question] Data Lemur
SELECT
ROUND
(
100*SUM(CASE WHEN b.country_id != c.country_id THEN 1 ELSE NULL END)/COUNT(*),1
) AS international_calls_pct
FROM phone_calls AS a
LEFT JOIN phone_info AS b
ON a.caller_id = b.caller_id
LEFT JOIN phone_info AS c
ON a.receiver_id = c.caller_id
