-- 1068. Product Sales Analysis I Leetcode
SELECT
b.product_name, a.year, a.price
FROM sales AS a JOIN Product AS b
ON a.product_id = b.product_id
-- Leetcode 1251. Average Selling Price
SELECT
a.product_id, IFNULL(ROUND(SUM(b.units*a.price)/SUM(b.units),2),0) AS average_price
FROM Prices AS a LEFT JOIN UnitsSold AS b
ON a.product_id = b.product_id
AND b.purchase_date BETWEEN a.start_date AND a.end_date
GROUP BY a.product_id
