CREATE TABLE IF NOT EXISTS Customer (
	id int, 
	name varchar(25), 
	referee_id int
);
TRUNCATE TABLE Customer;
INSERT INTO Customer (id, name, referee_id) VALUES ('1', 'Will', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('2', 'Jane', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('3', 'Alex', '2');
INSERT INTO Customer (id, name, referee_id) VALUES ('4', 'Bill', NULL);
INSERT INTO Customer (id, name, referee_id) VALUES ('5', 'Zack', '1');
INSERT INTO Customer (id, name, referee_id) VALUES ('6', 'Mark', '2');