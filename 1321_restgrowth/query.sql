WITH cte AS (
	SELECT 
		visited_on,
		SUM(amount) as daily_amount
	FROM Customer
	GROUP BY visited_on
)
SELECT
	visited_on,
	SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
	ROUND (SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) / 7., 2) as average_amount
FROM 
	cte
ORDER BY 
	visited_on
OFFSET 6;