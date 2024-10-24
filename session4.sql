SHOW DATABASES;
SELECT DATABASE();
USE company;
DROP TABLE employee;
CREATE TABLE employee(
id INT PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'Bangalore'   # This is the combination of NOT NULL and DEFAULT.
);
DESC employee;
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (1, 'Rajesh', 'Sharma', 28, 10000);
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (2, 'Kapil', 'Sharma', 30, 20000);
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (3, 'Maneesh', 'Sharma', 32, 30000);
SELECT * FROM employee; # By this we get all columns. 
SELECT FirstName,LastName FROM employee; # By this command , we get only two column which is mentioned i.e firstname and lastname. 
SELECT * FROM employee WHERE age > 29; 
SELECT * FROM employee WHERE salary > 20000;
SELECT * FROM employee WHERE FirstName = 'Maneesh'; # SQL is case insensitive so we search for 'Maneesh' is correct and also for 'maneesh' of 'MANEESH' is correct.
SELECT * FROM employee WHERE FirstName = 'MANEESH';
SELECT * FROM employee WHERE BINARY FirstName = 'maneesh'; # this does not give output beacuse we make this manually case sensitive and firstname maneesh does not exist.
SELECT * FROM employee WHERE BINARY FirstName = 'Maneesh'; # we use 'binary' to make MySQL string query case sensitive. 
SELECT FirstName AS Name,LastName AS SurName FROM employee; # 'AS' keyword is used to rename a column or table with an alias.
UPDATE employee SET LastName = 'Sinha' WHERE FirstName = 'Maneesh';
UPDATE employee set location = 'Hyderabad' WHERE id = 2;
UPDATE employee SET salary = salary + 5000;
UPDATE employee SET location = 'Delhi' WHERE FirstName = 'Maneesh' AND LastName = 'Sinha';
SELECT * FROM employee;
SELECT * FROM employee WHERE id =2;
DELETE FROM employee WHERE id = 3;
DELETE FROM employee; # It will delete all the records because no conditions are given that which record we have to delete.
SELECT * FROM employee;
DESC employee;
ALTER TABLE employee ADD COLUMN jobtitle VARCHAR(50);
DESC employee;
ALTER TABLE employee DROP COLUMN jobtitle;
DESC employee;
ALTER TABLE employee MODIFY COLUMN FirstName VARCHAR(30);
DESC employee;
ALTER TABLE employee DROP PRIMARY KEY;
DESC employee;
ALTER TABLE employee ADD PRIMARY KEY(id);
DESC employee;
ALTER TABLE employee RENAME COLUMN FirstName TO fName;
DESC employee;
ALTER TABLE employee RENAME COLUMN  fName TO FirstName;
DESC employee;
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (1, 'Rajesh', 'Sharma', 28, 10000);
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (2, 'Kapil', 'Sharma', 30, 20000);
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (3, 'Maneesh', 'Sharma', 32, 30000);
SELECT * FROM employee;
TRUNCATE TABLE employee; # Used to remove or delete all the rows fro  the table.
SELECT * FROM employee;  