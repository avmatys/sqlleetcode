SELECT 
	m.employee_id,
	m.name,
	COUNT(*) as reports_count,
	AVG(e.age)::int as average_age
FROM 
	Employees as m
	INNER JOIN
	Employees as e
	ON m.employee_id = e.reports_to
GROUP BY
	m.employee_id, m.name
ORDER BY
	m.employee_id;