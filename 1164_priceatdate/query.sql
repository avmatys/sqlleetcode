SELECT 
	dp.product_id,
	CASE WHEN fp.new_price IS NULL THEN 10 ELSE fp.new_price END AS price
FROM (
	SELECT product_id
	FROM Products
	GROUP BY product_id) as dp
	LEFT JOIN (
		SELECT 
			ap.product_id,
			ap.new_price
		FROM
			Products as ap
			INNER JOIN (
				SELECT
					product_id,
					MAX(change_date) as change_date
				FROM
					Products
				WHERE 
					change_date <= '2019-08-16'
				GROUP BY 
					product_id
			) as fp
			ON ap.product_id = fp.product_id AND ap.change_date = fp.change_date
	) as fp
	ON dp.product_id = fp.product_id
	
