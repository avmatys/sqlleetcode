SELECT
	category,
	COALESCE(cnt, 0) AS accounts_count
FROM 
	(VALUES ('Low Salary'), ('Average Salary'), ('High Salary')) AS Categories(category)
	LEFT JOIN (
		SELECT
			CASE
				WHEN income < 20000 THEN 'Low Salary'
				WHEN income <= 50000 THEN 'Average Salary'
				ELSE 'High Salary'
				END AS category,
			COUNT (*) AS cnt
		FROM Accounts
		GROUP BY category
	)
	USING (category)
;