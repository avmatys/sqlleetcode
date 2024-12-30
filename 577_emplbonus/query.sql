SELECT 
	e.name, b.bonus
FROM
	employee AS e
		LEFT JOIN 
	bonus AS b ON b.empId = e.empId
WHERE
	b.bonus < 1000 OR b.bonus IS NULL;