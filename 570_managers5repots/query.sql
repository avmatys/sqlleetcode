SELECT 
	e.name 
FROM 
	employee AS e
	JOIN (
		SELECT managerid 
		FROM employee 
		GROUP BY managerid 
		HAVING COUNT(managerid) > 4
	) as m
	ON m.managerid = e.id
;