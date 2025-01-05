WITH cte AS (
(
	SELECT 
		requester_id as user_id,
		COUNT(requester_id) as user_cnt
	FROM 	
		RequestAccepted
	WHERE accept_date IS NOT NULL
	GROUP BY requester_id
)
UNION ALL
(
	SELECT 
		accepter_id as user_id,
		COUNT(accepter_id) as user_cnt
	FROM 	
		RequestAccepted
	WHERE accept_date IS NOT NULL AND accepter_id IS NOT NULL
	GROUP BY accepter_id
)
)
SELECT 
	user_id as "id",
	SUM(user_cnt) as num
FROM cte
GROUP BY user_id
ORDER BY num DESC
LIMIT 1;