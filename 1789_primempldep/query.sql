SELECT 
	employee_id,
	department_id
FROM
	employee 
WHERE 
	primary_flag = 'Y' OR employee_id IN (
		SELECT employee_id
		FROM employee
		GROUP BY employee_id
		HAVING COUNT(*) = 1
	);

SELECT 
	employee_id,
	department_id
FROM
	employee 
WHERE 
	primary_flag = 'Y'
UNION
SELECT 
	employee_id,
	MAX(department_id) AS department_id
FROM
	employee
GROUP BY 
	employee_id
HAVING 
	COUNT(*) = 1;
