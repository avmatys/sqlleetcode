SELECT 
	s.user_id, 
	ROUND(COUNT(c.action) FILTER (WHERE c.action='confirmed')/COUNT(*)::numeric, 2)
FROM 
	Signups as s 
	LEFT JOIN Confirmations as c ON c.user_id = s.user_id
GROUP BY s.user_id;