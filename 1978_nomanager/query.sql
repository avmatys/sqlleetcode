SELECT 
	empl.employee_id
FROM 
	Employees as empl
	LEFT JOIN
	Employees as man
	ON empl.manager_id = man.employee_id
WHERE man.employee_id IS NULL AND empl.manager_id IS NOT NULL AND empl.SALARY < 30000
ORDER BY empl.employee_id;