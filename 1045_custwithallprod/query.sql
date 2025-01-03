SELECT
	customer_id
FROM 
	Product as p
	INNER JOIN
	(
		SELECT customer_id, product_key
		FROM Customer
		GROUP BY customer_id, product_key
	) as c
	ON p.product_key = c.product_key
GROUP BY
	customer_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM Product);