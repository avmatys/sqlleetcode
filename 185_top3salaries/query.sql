WITH cte as (
	SELECT
		departmentId,
		"name", 
		salary, 
		DENSE_RANK() OVER (
			PARTITION BY departmentId 
			ORDER BY salary DESC
		) as rnk
	FROM
		Employee
)
SELECT 
	d.name as "Department",
	c.name as "Employee",
	c.salary as "Salary"
FROM 
	cte as c
	INNER JOIN 
	Department as d
	ON c.departmentId = d.ID
WHERE 
	rnk < 4