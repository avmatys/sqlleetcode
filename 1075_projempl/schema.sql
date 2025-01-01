CREATE TABLE IF NOT EXISTS Project (
	project_id int,
	employee_id int
);
CREATE TABLE IF NOT EXISTS Employee (
	employee_id int,
	name varchar(10),
	experience_years int
);
TRUNCATE TABLE Project;
INSERT INTO Project (project_id, employee_id) VALUES ('1', '1');
INSERT INTO Project (project_id, employee_id) VALUES ('1', '2');
INSERT INTO Project (project_id, employee_id) VALUES ('1', '3');
INSERT INTO Project (project_id, employee_id) VALUES ('2', '1');
INSERT INTO Project (project_id, employee_id) VALUES ('2', '4');
INSERT INTO Project (project_id, employee_id) VALUES ('2', '5');
TRUNCATE TABLE Employee;
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('1', 'Khaled', '3');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('2', 'Ali', '2');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('3', 'John', '1');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('4', 'Doe', '2');
INSERT INTO Employee (employee_id, name, experience_years) VALUES ('5', 'Doe2',  NULL);