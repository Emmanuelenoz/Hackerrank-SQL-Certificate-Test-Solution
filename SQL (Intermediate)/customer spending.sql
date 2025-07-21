SELECT
CONCAT(c.customer_name, ' ', REPLACE(FORMAT(SUM(i.total_price), 6), ',', '')) AS output_line
FROM
customer c
INNER JOIN
invoice i ON c.id = i.customer_id
GROUP BY
c.customer_name
HAVING
SUM(i.total_price) < 0.25 * (SELECT AVG(total_price) FROM invoice)
ORDER BY
SUM(i.total_price) DESC;