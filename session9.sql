########### WE STUDY MORE ABOUT DIFFERENT DATA TYPES
##### Already learned about int and varchar. If we try to put decimal values inside the int data type then it round off to the nearest integer.
###### Now first data type is 'DECIMAL', let's implement 'DECIMAL' data type
-- USE company;
CREATE TABLE courses_new(
course_id INT NOT NULL,
course_name VARCHAR(30) NOT NULL,
course_duration_months DECIMAL(3,1) NOT NULL,  #### Total no. of digit is 3 and The number of digits after the decimal point is 1.
course_fee INT NOT NULL,
PRIMARY KEY(course_id)
);
INSERT INTO courses_new VALUES(1, 'big data', 6.5, 50000);
INSERT INTO courses_new VALUES(2, 'web development', 3.5, 20000);
INSERT INTO courses_new VALUES(3, 'data science', 6.2, 40000);
INSERT INTO courses_new VALUES(4, 'devops', 1, 10000);

UPDATE courses_new set course_fee = 40000 where course_id = 2; ## It update the course_fee of course_id of 2 but we can not track at what time the record was inserted or at what time the record was updated etc.. for this we use 'Timestamp'

DROP TABLE courses_new;
##### Dropped previous table and Create new table with the 'Timestamp' data type. 
CREATE TABLE courses_new(
course_id INT NOT NULL,
course_name VARCHAR(30) NOT NULL,
course_duration_months DECIMAL(3,1) NOT NULL,  #### Total no. of digit is 3 and The number of digits after the decimal point is 1.
course_fee INT NOT NULL,
changed_at TIMESTAMP DEFAULT NOW(),  ### Here NOW() can also be replaced with CURRENT_TIMESTAMP(). 
PRIMARY KEY(course_id)
);

INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(1, 'big data', 6.5, 50000);
INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(2, 'web development', 3.5, 20000);
INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(3, 'data science', 6.2, 40000);
INSERT INTO courses_new(course_id,course_name,course_duration_months,course_fee) VALUES(4, 'devops', 1, 10000);

SELECT * FROM courses_new;

UPDATE courses_new set course_fee = 40000 where course_id = 2; ## It update the course_fee of course_id of 2 but we are not getting updated 'TIMESTAMP'. so for that we need to do a small change in table. 

DROP TABLE courses_new;
##### Dropped previous table and Create new table with the small change at 'changed_at column '. 
CREATE TABLE courses_new(
course_id INT NOT NULL,
course_name VARCHAR(30) NOT NULL,
course_duration_months DECIMAL(3,1) NOT NULL,  #### Total no. of digit is 3 and The number of digits after the decimal point is 1.
course_fee INT NOT NULL,
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(), 
PRIMARY KEY(course_id)
);

INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(1, 'big data', 6.5, 50000);
INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(2, 'web development', 3.5, 20000);
INSERT INTO courses_new (course_id,course_name,course_duration_months,course_fee) VALUES(3, 'data science', 6.2, 40000);
INSERT INTO courses_new(course_id,course_name,course_duration_months,course_fee) VALUES(4, 'devops', 1, 10000);

UPDATE courses_new set course_fee = 30000 where course_id = 2; ## It update the course_fee of course_id of 2 and we are also getting updated 'TIMESTAMP'. so for that we need to do a small change in table. 

SELECT * FROM  courses_new;