SELECT
	person_name
FROM (
	SELECT 
		person_id,
		person_name,
		SUM (weight) OVER (ORDER BY turn) AS sub_total
	FROM 
		Queue
)
WHERE sub_total <= 1000
ORDER BY sub_total DESC
LIMIT 1;

