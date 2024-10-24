##### Logical Operators #####
##### The order in which logical operators are evaluated in a SQL query is called logical operator precedence in MySQL. The precedence is: NOT > AND > OR.

####################### BETWEEN operator ##############
#### In SQL, the BETWEEN operator is used to filter the result set within a specific range. 
#### It checks whether a value falls between two specified values, inclusive of the boundary values.
########################## IN operator ##################
## In SQL, the IN operator is used to filter records based on a list of specified values. 
## It allows you to check if a value matches any value in a list of values. It's essentially a shorthand for multiple OR conditions.

## Query :- To get students who are from bangalore
SELECT * FROM students WHERE location = "Bangalore";
## Query :- To get students who are not from bangalore
SELECT * FROM students WHERE location != "Bangalore";
## Query :- To get all courses which has the word 'data'
SELECT * From courses WHERE course_name LIKE '%data%';
## Query :- To get all courses which do not have the word 'data'
SELECT * From courses WHERE course_name NOT LIKE '%data%';
## Query :- To get a list of students who have less than 8 years of experience and source of joining is through linkedin and they are from bangalore.
###### Whenever we have a clause like it should satisfy multiple conditions then we have to use a logical operator called 'AND'
SELECT * FROM students WHERE years_of_exp < 8 AND source_of_joining = 'linkedin' AND location = 'bangalore';

## The AND operator displays a record if all the conditions separated by AND are TRUE.
## The OR operator displays a record if any of the conditions separated by OR is TRUE.

## Query :- I want all students who do not fall between 8 to 12 years of experience.
SELECT * FROM students WHERE years_of_exp < 8 OR years_of_exp > 12;
### Another way of doing above query and this is the easier way.
SELECT * FROM students WHERE years_of_exp NOT BETWEEN 8 AND 12;

## Query :- I want all students who fall between 8 to 12 years of experience.
SELECT * FROM students WHERE years_of_exp BETWEEN 8 AND 12;

## Query :- get list of students who are working for flipkart, walmart or microsoft
SELECT * FROM students WHERE student_company = 'flipkart' OR student_company = 'walmart' OR student_company = 'microsoft';
## Easier way of doing the same above query with 'IN' operator. 
SELECT * FROM students WHERE student_company IN ('flipkart' , 'walmart' , 'microsoft');
## Query :- get list of students who are not working for flipkart, walmart or microsoft
SELECT * FROM students WHERE student_company NOT IN ('flipkart' , 'walmart' , 'microsoft');

## Query :- If a course is more than 4 months we categorize it as master program else it is a diploma
SELECT course_id,course_name,course_fee,
	CASE
		WHEN course_duration_months > 4 THEN 'Masters'
        ELSE 'diploma'
    END as course_type
From courses;

##  People working for walmart, flipkart and microsoft we want to say product based and all others service based.
SELECT student_id, student_fname, student_lname, student_company,
CASE 
WHEN student_company IN ('flipkart','walmart','microsoft') THEN 'product based'
WHEN student_company IS NULL THEN 'invalid company'
ELSE 'service based'
END as company_type
FROM students;
