WITH cte AS (
	SELECT 
		*,
		DENSE_RANK() OVER (ORDER BY salary DESC) as rn
	FROM Employee
)
SELECT 
	MAX(CASE WHEN rn = 2 THEN salary ELSE NULL END)
FROM cte
WHERE rn = 2
