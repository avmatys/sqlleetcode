WITH cte AS (
	SELECT 
		DISTINCT ON (customer_id) customer_id,
		CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END AS "immediate"
	FROM
		delivery
	ORDER BY
		customer_id, order_date
	)

SELECT ROUND(AVG("immediate") * 100., 2) AS immediate_percentage from cte;