DROP DATABASE company;
CREATE DATABASE company;
USE company;
drop table students;
CREATE TABLE students(
student_id INT AUTO_INCREMENT,
student_fname VARCHAR(30) NOT NULL,
student_lname VARCHAR(30) NOT NULL,
student_mname VARCHAR(30) ,
student_email VARCHAR(30) NOT NULL,
student_phone VARCHAR(15) NOT NULL,
student_alternative_phone VARCHAR(15),
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
years_of_exp INT NOT NULL,
student_company VARCHAR(30),
batch_date VARCHAR(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location VARCHAR(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email)
);
DESC students;
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rohit', 'Sharma', 'rohit@gmail.com', '9191919191', 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Virat', 'Kohli', 'virat@gmail.com', '9292929292', 3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, batch_date, source_of_joining, location) VALUES ('Shikhar', 'Dhawan', 'shikhar@gmail.com', '9393939393', 12, '19-02-2021', 'google', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rahul', 'Dravid', 'rahul@gmail.com', '9494949494', 8, 'walmart', '19-02-2021', 'quora', 'chennai');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Kapil', 'Dev', 'kapil@gmail.com', '9192919191', 15, 'microsoft', '5-02-2021', 'friend', 'pune'), 
('Brain', 'Lara', 'brain@gmail.com', '9192979191', 18, 'tcs', '5-02-2021', 'youtube', 'pune'), ('Carl', 'Hooper', 'carl@gmail.com', '9192979791', 20, 'wipro', '19-02-2021', 'youtube', 'pune'),
('Saurabh', 'ganguly', 'saurabh@gmail.com', '9192973491', 14, 'wipro', '19-02-2021', 'googlee', 'chennai');
SELECT * FROM students;
CREATE TABLE courses(
course_id INT NOT NULL,
course_name VARCHAR(30) NOT NULL,
course_duration_months INT NOT NULL,
course_fee INT NOT NULL,
PRIMARY KEY(course_id)
);
INSERT INTO courses VALUES(1, 'big data', 6, 50000);
INSERT INTO courses VALUES(2, 'web development', 3, 20000);
INSERT INTO courses VALUES(3, 'data science', 6, 40000);
INSERT INTO courses VALUES(4, 'devops', 1, 10000);
DROP TABLE students;
CREATE TABLE students(
student_id INT AUTO_INCREMENT,
student_fname VARCHAR(30) NOT NULL,
student_lname VARCHAR(30) NOT NULL,
student_mname VARCHAR(30) ,
student_email VARCHAR(30) NOT NULL,
student_phone VARCHAR(15) NOT NULL,
student_alternative_phone VARCHAR(15),
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
selected_course INT NOT NULL DEFAULT 1,
years_of_exp INT NOT NULL,
student_company VARCHAR(30),
batch_date VARCHAR(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location VARCHAR(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email)
);
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rohit', 'Sharma', 'rohit@gmail.com', '9191919191', 2, 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Virat', 'Kohli', 'virat@gmail.com', '9292929292', 3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course, years_of_exp, batch_date, source_of_joining, location) VALUES ('Shikhar', 'Dhawan', 'shikhar@gmail.com', '9393939393', 3, 12, '19-02-2021', 'google', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rahul', 'Dravid', 'rahul@gmail.com', '9494949494', 8, 'walmart', '19-02-2021', 'quora', 'chennai');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Kapil', 'Dev', 'kapil@gmail.com', '9192919191', 15, 'microsoft', '5-02-2021', 'friend', 'pune'), 
('Brain', 'Lara', 'brain@gmail.com', '9192979191', 18, 'tcs', '5-02-2021', 'youtube', 'pune'), ('Carl', 'Hooper', 'carl@gmail.com', '9192979791', 20, 'wipro', '19-02-2021', 'youtube', 'pune'),
('Saurabh', 'ganguly', 'saurabh@gmail.com', '9192973491', 14, 'wipro', '19-02-2021', 'googlee', 'chennai');
SELECT * FROM students;
# The selected_course column in students table is something which we want to check whether it is a valid course_id or not(course_id is from courses table), if the selected_course is in course_id then it is fine otherwise not.  
# We have to put the constraint on the selected_course.
# For this we use the concept called " Foreign Key".
DROP TABLE students;
CREATE TABLE students(
student_id INT AUTO_INCREMENT,
student_fname VARCHAR(30) NOT NULL,
student_lname VARCHAR(30) NOT NULL,
student_mname VARCHAR(30) ,
student_email VARCHAR(30) NOT NULL,
student_phone VARCHAR(15) NOT NULL,
student_alternative_phone VARCHAR(15),
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
selected_course INT NOT NULL DEFAULT 1,
years_of_exp INT NOT NULL,
student_company VARCHAR(30),
batch_date VARCHAR(30) NOT NULL,
source_of_joining varchar(30) NOT NULL,
location VARCHAR(30) NOT NULL,
PRIMARY KEY(student_id),
UNIQUE KEY(student_email),
FOREIGN KEY(selected_course) REFERENCES courses(course_id)
);
# So, parent table is Courses table because dependency is on courses table. 
# And child table is students table because selected_course of students table is depended on course_id of courses table. 
DESC students;
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rohit', 'Sharma', 'rohit@gmail.com', '9191919191', 2, 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Virat', 'Kohli', 'virat@gmail.com', '9292929292', 3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course, years_of_exp, batch_date, source_of_joining, location) VALUES ('Shikhar', 'Dhawan', 'shikhar@gmail.com', '9393939393', 3, 12, '19-02-2021', 'google', 'bangalore');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Rahul', 'Dravid', 'rahul@gmail.com', '9494949494', 8, 'walmart', '19-02-2021', 'quora', 'chennai');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('Kapil', 'Dev', 'kapil@gmail.com', '9192919191', 15, 'microsoft', '5-02-2021', 'friend', 'pune'), 
('Brain', 'Lara', 'brain@gmail.com', '9192979191', 18, 'tcs', '5-02-2021', 'youtube', 'pune'), ('Carl', 'Hooper', 'carl@gmail.com', '9192979791', 20, 'wipro', '19-02-2021', 'youtube', 'pune'),
('Saurabh', 'ganguly', 'saurabh@gmail.com', '9192973491', 14, 'wipro', '19-02-2021', 'googlee', 'chennai');
INSERT INTO students(student_fname, student_lname, student_email, student_phone, selected_course, years_of_exp, student_company, batch_date, source_of_joining, location) VALUES ('King', 'Khan', 'king@gmail.com', '9191919581', 5, 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');
SELECT * FROM students;
DELETE FROM courses WHERE course_id = 2; # The error "cannot update or delete a parent row" occurs because of referential integrity constraints enforced by the foreign key relationship. This means you cannot delete a row from the parent table (courses) if there are corresponding rows in the child table (students).
DELETE FROM courses WHERE course_id = 4; # we can delete a row from the parent table (courses) as there are no corresponding rows(that is there is no one in the  students table who opted for course_id = 4 ) in the child table (students).
