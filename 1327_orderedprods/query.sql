SELECT
	a.product_name,
	b.sum_unit as unit
FROM
	Products as a
	INNER JOIN
	(
		SELECT
			product_id,
			SUM(unit) as sum_unit
		FROM
			Orders
		WHERE
			order_date >= '2020-02-01' and order_date <= '2020-02-29'
		GROUP BY
			product_id
	) as b
	ON a.product_id = b.product_id
WHERE b.sum_unit > 99

	