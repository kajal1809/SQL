DROP TABLE employee;
# Creation of table(employee) with better definition than previous one with the implementation of PRIMARY KEY. 
CREATE TABLE employee(
id INT PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'Bihar'   # This is the combination of NOT NULL and DEFAULT.
);
DESC employee;
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (1, 'Anu', 'Kumari', 20, 15000);
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (1, 'Anu', 'Kumari', 20, 15000); # This will give an error because id is primary key so it will not allow for repeated values.
INSERT INTO employee(id, FirstName, LastName, age, salary) VALUES (NULL, 'Anu', 'Kumari', 20, 15000); # This will also give an error because column id cannot be null. 
# We can also define a column in slightly different way , following is the way.
/*
CREATE TABLE employee(
id INT,
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'Bihar'   # This is the combination of NOT NULL and DEFAULT.
PRIMARY KEY(id) 
# Sometimes a primary key is also the combination of two columns. so syntax is following:
PRIMARY KEY(ColumnName1, ColumnName2) 
);
*/
# Now i want to drop the prevoius table and make new definition with implentation of auto increment.
DROP TABLE employee;
CREATE TABLE employee(
id INT AUTO_INCREMENT,
FirstName VARCHAR(20) NOT NULL,
MiddleName VARCHAR(20),
LastName VARCHAR(20) NOT NULL,
age INT NOT NULL,
salary INT NOT NULL,
location VARCHAR(20) NOT NULL DEFAULT 'Bihar' ,  # This is the combination of NOT NULL and DEFAULT.
PRIMARY KEY(id) 
);
DESC employee;
INSERT INTO employee(FirstName, LastName, age, salary) VALUES ('Anu', 'Kumari', 20, 15000);
INSERT INTO employee(FirstName, LastName, age, salary) VALUES ('Anushka', 'Sharma', 20, 15000);
INSERT INTO employee(FirstName, LastName, age, salary) VALUES ('Shanaya', 'Sharma', 20, 15000);
SELECT * FROM employee; 
DROP TABLE employee;
# Dropped previously created table and create new table with the implementation of unique key.
CREATE TABLE employee(
id INT UNIQUE KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
age INT NOT NULL
);
# UNIQUE KEY(id, FirstName) #  Unique key with the combination of two column is also allowed.
INSERT INTO employee VALUES(1, 'Payel', 'Choudhary', 20);
INSERT INTO employee VALUES(1, 'Payel', 'Choudhary', 20); # This will gave an error because duplicate entry for id column will not allow. 
INSERT INTO employee VALUES(NULL, 'Payel', 'Choudhary', 20);
INSERT INTO employee VALUES(NULL, 'Payel', 'Choudhary', 20); # In MySQL any number of null values are allowed for unique key. 
SELECT * FROM employee;