############ Joins ###########
########### A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
#### We have three tables in comapny database . students,courses,courses_new.########
## Query -- I want to know in which course rahul has enrolled.

DESC students;
SELECT student_fname,selected_course FROM students WHERE student_fname = 'rahul'; ## we want the course name but we get only course id (selected_course is course id not name)
#### But in courses table or courses_new table we have the mapping of course_id and course_name which is not in the previous table that is students table.
SELECT course_id, course_name FROM courses_new WHERE course_id = 1;
####### Now we can clearly see from above two query that there is no way that from one single table we get these details. No single table is self sufficient to tell these details. 
######## So in order to get the details from thes two tables in single query we have to do following 
SELECT course_name FROM courses_new WHERE course_id  = (SELECT selected_course FROM students WHERE student_fname = 'rahul'); ## This is not a good way when we want the same thing for multiple people
###### In order to get complete view of all the students, We have to join those two tables based on a single common column #######
####### So, from students table we have selected_course and from courses_new table we have course_id . so based on these two columns we can join both tables.
SELECT students.student_fname, students.student_lname, courses_new.course_name FROM students JOIN courses_new ON students.selected_course = courses_new.course_id; ### we have not mentioned what types of join we perform here (by default it is a inner join)
##################### Inner Join ################
####### INNER JOIN: Returns records that have matching values in both tables(only the matching records are considered. Non matching records are discarded). 
##################### Left outer Join ################
####### LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table(all the matching records from left and right tables are considered + all the non matching records in the left table which does not have the match in the right table padded with null)

DELETE FROM courses WHERE course_id=2; #### This gives error (cannot delete or update a parent row: a foreign key constraint fails)

CREATE TABLE students_latest AS SELECT * FROM students; ## This query creates a new table called students_latest by copying the entire structure and data from an existing table called students.
### Constraints like primary keys, foreign keys, and indexes are not copied unless explicitly defined. So, students_latest will have the same structure and data but without the constraints from students.
CREATE TABLE courses_latest AS SELECT * FROM courses;
DELETE FROM courses_latest WHERE course_id=2; ### now we can delete course_id = 2 because there is no any constraint like foreign key.

SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id; #### From this we can clearly see that 'web development' does not come because the right table does not have a matching record.
######### Below we perform 'Left Outer Join' ###########
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest LEFT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id; ### From this we can clearly see that the records which are matched in both left and right tables are there and also the no matching records of left table is also there.

##################### Right outer Join ################
########## RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table(all the matching records from left and right tables are considered + all the non matching records in the right table which does not have the match in the left table padded with null)
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest RIGHT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id; ### From this we can clearly see that the records which are matched in both left and right tables are there and also the no matching records of right table is also there.

##################### Full outer Join ################
####### FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table(return all the matching records + non matching records from left table + non matching records from right table)
######## MySQL does not support the FULL OUTER JOIN syntax directly. ##########
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest FULL JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id; ### FULL Outer JOIN is not supported in this that's why this gives error.
########### However, we can achieve the same result by combining a LEFT JOIN and a RIGHT JOIN with a UNION
SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest LEFT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id UNION SELECT students_latest.student_fname, students_latest.student_lname, courses_latest.course_name FROM students_latest RIGHT JOIN courses_latest ON students_latest.selected_course = courses_latest.course_id;
 
####### Cross Join ###########
####### cross join :- Each record on the left table will be combined with all records on the right table.CROSS JOIN produces the Cartesian product of two tables, meaning it returns all possible combinations of rows from both tables.  
SELECT COUNT(*) FROM students,courses; ####### This will give 32(8 from students and 4 from courses then 8*4 = 32)
SELECT * FROM students,courses; ##### WE can write a CROSS JOIN without explicitly using the keyword by listing the tables in the FROM clause, separated by commas. 
SELECT * FROM students JOIN courses; #### If you add a ON clause(if table1 and table2 has a relationship), the JOIN will produce the same result as the INNER JOIN clause
SELECT * FROM students CROSS JOIN courses; ### If you add a WHERE clause (if table1 and table2 has a relationship), the CROSS JOIN will produce the same result as the INNER JOIN clause