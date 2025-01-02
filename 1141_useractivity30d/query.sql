SELECT 
	activity_date AS "day",
	COUNT(DISTINCT(user_id)) as active_users
FROM 
	activity
WHERE activity_date BETWEEN date '2019-07-27' - INTERVAL '29d' and date '2019-07-27'
GROUP BY activity_date;
	