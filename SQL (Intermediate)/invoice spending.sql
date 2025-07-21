WITH CustomerAverages AS (
    SELECT
        cu.customer_name,
        AVG(i.total_price) AS avg_price 
    FROM
        customer cu
    JOIN
        invoice i ON cu.id = i.customer_id
    GROUP BY
        cu.customer_name
)
SELECT
    customer_name,
    avg_price
FROM
    CustomerAverages
WHERE
    avg_price <= (SELECT AVG(total_price) FROM invoice) / 4
ORDER BY
    avg_price DESC;