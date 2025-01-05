(SELECT
	au.name as results
FROM 
	Users as au
	INNER JOIN
	(
	SELECT
		user_id,
		COUNT(user_id) as rating_cnt
	FROM
		MovieRating
	GROUP BY
		user_id
	) as mr
	ON mr.user_id = au.user_id
ORDER BY
	mr.rating_cnt DESC,
	au.name
LIMIT 1)
UNION ALL
(SELECT 
	mv.title as results
FROM 
	Movies as mv
	INNER JOIN
	(
	SELECT
		movie_id,
		AVG(rating)::numeric as avg_rating
	FROM
		MovieRating
	WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
	GROUP BY movie_id
	) as mr
	ON mv.movie_id = mr.movie_id
ORDER BY
	mr.avg_rating DESC,
	mv.title
LIMIT 1);