SHOW DATABASES;
USE company;
SHOW TABLES;
######## WE ARE USING "DISTINCT" KEYWORD. #########
SELECT location FROM students; # This gives some redundant or repeated or duplicate data also. 
SELECT DISTINCT location FROM students; # This gives only unique values and avoid duplicate values.
SELECT DISTINCT student_company FROM students; 
SELECT DISTINCT source_of_joining FROM students; 
SELECT source_of_joining FROM students; 

######## WE ARE USING "ORDER BY" KEYWORD. #########
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students;
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students ORDER BY years_of_exp;
SELECT student_id, student_fname FROM students ORDER BY student_id;
SELECT student_fname FROM students ORDER BY student_fname;
SELECT  student_fname FROM students ORDER BY years_of_exp;
SELECT  student_fname, years_of_exp FROM students ORDER BY years_of_exp DESC;
SELECT  student_fname, years_of_exp FROM students ORDER BY 2 DESC; #### Instead of column name after ORDER BY we can also give column number that is written after select statement.
SELECT  student_fname, years_of_exp FROM students ORDER BY 1 DESC;
SELECT student_fname, selected_course FROM students ORDER BY selected_course, student_fname; ### In this first it order by selected_course and then those students whose selected_course are same they are then ordered by student_fname.
SELECT student_fname, selected_course FROM students ORDER BY selected_course, student_fname DESC; ### In this first it order by selected_course and then those students whose selected_course are same they are then ordered by student_fname.
SELECT student_fname, selected_course FROM students ORDER BY selected_course DESC, student_fname ASC; ### In this first it order by selected_course and then those students whose selected_course are same they are then ordered by student_fname.

######## WE ARE USING "LIMIT" KEYWORD. #########
SELECT * FROM students ORDER BY years_of_exp LIMIT 3;
SELECT * FROM students ORDER BY years_of_exp DESC LIMIT 3;
### PROBLEM STATEMENT --> We want to know that from which sources last 5 candidates have enrolled. 
SELECT DISTINCT enrollment_date, source_of_joining FROM students ORDER BY enrollment_date DESC LIMIT 5; 
SELECT DISTINCT source_of_joining FROM students ORDER BY enrollment_date DESC LIMIT 5; # This gives error
### PROBLEM STATEMENT --> We want to know that the student who enrolled very last. 
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students ORDER BY enrollment_date DESC LIMIT 1;
SELECT * FROM students ORDER BY enrollment_date LIMIT 0,3; ### This query would give us that the first three candidates who have enrolled with. 
SELECT * FROM students ORDER BY enrollment_date LIMIT 3,2; ### This query would give us that the candidates who have enrolled at 4th and 5th place.With this query we can say that it will skip first 3 values using offset and print 2 rows(i.e Fourth and Fifth).

######## WE ARE USING "LIKE" KEYWORD. #########
###### % is a wildcard character means zero or more characters.
###### _(underscore) is also a wildcard character means exactly one character.
### Problem statement is :- We want all the students detail whose 'student_fname' contains "ra".
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students WHERE student_fname LIKE '%ra%';
### Problem statement is :- We want all the students detail whose 'student_fname' starts with "ra".
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students WHERE student_fname LIKE 'ra%';
### Problem statement is :- We want all the students detail whose 'student_fname' ends with "at".
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students WHERE student_fname LIKE '%at';
### Problem statement is :- We want all the students detail who have 5 character in their 'student_fname'.
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students WHERE student_fname LIKE '_____';  ## This query contains 5 underscore because we want those students and their details whose first name contains 5 characters.
### Problem statement is :- We want all the students detail who have 4 character in their 'student_fname'.
SELECT student_id, enrollment_date, selected_course, student_fname, years_of_exp, student_company, batch_date, source_of_joining, location FROM students WHERE student_fname LIKE '____';   ## This query contains 4 underscore because we want those students and their details whose first name contains 4 characters.

#### If a name itself contains %(percentage character) and we have to use 'LIKE' keyword which uses % character then we have to use escape character that is back slash(\) just say a name that is Roh%it. then we can use LIKE '%\%it'


