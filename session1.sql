CREATE DATABASE university;

CREATE TABLE university.students(
studentid INT,
NAME VARCHAR(255)
);	

INSERT INTO university.students(studentid, name) VALUES (1, "Kajal Kumari");
INSERT INTO university.students(studentid, name) VALUES (2, "Priya Kumari");
 
SELECT * FROM university.students;

SHOW DATABASES;
DROP DATABASE university;
SHOW DATABASES;
SELECT * FROM university.students;

CREATE DATABASE university;
# to go inside certain database we have to write 'USE' keyword
USE university;

# by using 'SELECT' keyword we can check which database we are currently using.
SELECT database();

CREATE TABLE students(
studentid INT,
name VARCHAR(50),
marks INT
);

SHOW TABLES;

# 'describe' or 'desc' keyword is used to see the structure or schema of the table. both keyword works same.
DESCRIBE students;
DESC students;

# to drop database or table we use 'drop' keyword followed by (DROP DATABASE/TABLE database name / table name)

