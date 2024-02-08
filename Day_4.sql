--Compressed Mode [Alibaba SQL Interview Question] Data Lemur
SELECT
item_count AS mode FROM items_per_order
WHERE order_occurrences IN
(
SELECT
MAX (order_occurrences)
FROM items_per_order
)
-- Maximize Prime Item Inventory [Amazon SQL Interview Question] - Incomplete
WITH summary AS
(
SELECT 
item_type, total_area,
FLOOR (500000/total_area) AS maximum_prime_combinations,
FLOOR ((500000/total_area) * item_count) AS maximum_prime_item 
FROM
(
SELECT item_type,
SUM (square_footage) AS total_area, COUNT (*) AS item_count
FROM inventory
GROUP BY item_type
) AS a
WHERE item_type = 'prime_eligible'
)
SELECT FLOOR (500000-(summary.total_area*summary.maximum_prime_combinations))
AS total_non_prime_area
FROM summary WHERE summary.item_type = 'prime_eligible'
