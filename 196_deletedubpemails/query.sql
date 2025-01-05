DELETE FROM Person
WHERE id IN 
(
	SELECT a.id
	FROM (
		SELECT 
			*,
			ROW_NUMBER() OVER (PARTITION BY email ORDER BY "id") as rn
		FROM
			Person
	) as a
	WHERE rn > 1
);

