# We prefer to hire from bihar.
CREATE DATABASE company;
USE company;
CREATE TABLE employee(
FirstName VARCHAR(20),
MiddleName VARCHAR(20),
LastName VARCHAR(20),
age INT,
salary INT,
location VARCHAR(20)
);
SHOW TABLES;
DESCRIBE employee;
SELECT * from employee;
INSERT INTO employee(FirstName, MiddleName, LastName, age, salary, location) VALUES ('Kajal', 'Kumari', 'Arya', 20, 20000, 'Bihar');
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ('Anushka', 'Kumari', 20, 15000, 'Bihar');
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ("Anivesh'a", 'Kumari', 20, 15000, 'Bihar');
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ('Anivesh\'a', 'Kumari', 20, 15000, 'Bihar');
INSERT INTO employee(FirstName, MiddleName, LastName, age, salary, location) VALUES ('Anivesha', 'Kumari', 'Priya', 20, 35000, 'Bihar'), ('Payel', 'Kumari', 'Choudhary', 19, 25000, 'Bengal');
SELECT * from employee;
DROP TABLE employee;

CREATE TABLE employee(
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL
);
DESC employee;
INSERT INTO employee( MiddleName, LastName, age, salary, location) VALUES ('Kumari', 'Arya', 20, 20000, 'Bihar'); # This will give an error because firstname can not be null.
# Default values.
DROP TABLE employee;
# Creation of table(employee) with better definition than previous one.
CREATE TABLE employee(
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) DEFAULT 'Bihar'
);
DESC employee;
INSERT INTO employee(FirstName, LastName, age, salary) VALUES ('Anushka', 'Kumari', 20, 15000);
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ('Anushka', 'Kumari', 20, 15000, 'Bangalore');
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ('Anu', 'Kumari', 20, 15000, NULL);
SELECT * from employee;
DROP TABLE employee;
# Creation of table(employee) with better definition than previous one and apply not null in location field which will not allow the null value manually.
CREATE TABLE employee(
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'Bihar'   # This is the combination of NOT NULL and DEFAULT.
);
INSERT INTO employee(FirstName, LastName, age, salary, location) VALUES ('Anu', 'Kumari', 20, 15000, NULL); # This will give an error because column location cannot be null explicitly also.
INSERT INTO employee(FirstName, LastName, age, salary) VALUES ('Anu', 'Kumari', 20, 15000);
SELECT * FROM employee;