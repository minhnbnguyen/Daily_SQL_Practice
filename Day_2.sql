-- Odd and Even Measurements [Google SQL Interview Question] Data Lemur
WITH a AS
(
SELECT measurement_id,
CAST (measurement_time AS DATE) AS measurement_day
FROM measurements
)
SELECT
measurement_day,
SUM (measurement_value) FILTER (WHERE measurement_number % 2 = 1) AS odd_sum,
SUM (measurement_value) FILTER (WHERE measurement_number % 2 = 0) AS even_sum
FROM
(
SELECT a.measurement_day, b.measurement_time, b.measurement_id, b.measurement_value,
ROW_NUMBER () OVER
(PARTITION BY a.measurement_day ORDER BY b.measurement_time) AS measurement_number
FROM measurements AS b JOIN a ON a.measurement_id = b.measurement_id
) AS c
GROUP BY measurement_day
