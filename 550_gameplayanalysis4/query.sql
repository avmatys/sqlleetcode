WITH 
first_logins AS (
	SELECT 
		DISTINCT ON (player_id) 
		player_id,
		event_date
	FROM
		activity
	ORDER BY
		player_id, event_date
	), 
conseq_logins AS (
	SELECT 
		f.player_id,
		f.event_date as first_login,
		a.event_date as conseq_login
	FROM 
		first_logins AS f
		INNER JOIN activity AS a
		ON f.player_id = a.player_id AND a.event_date - INTERVAL '1 day' = f.event_date
)

SELECT ROUND((SELECT COUNT(*) FROM conseq_logins)::numeric / (SELECT COUNT(*) FROM first_logins)::numeric, 2) AS fraction;