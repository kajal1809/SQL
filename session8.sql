########## WE STUDY ABOUT 'COUNT' AGGREGATE FUNCTION.##########
SELECT COUNT(*) FROM students; ## count gives the no. of rows from the table students.
## Problem statement :- I want to see , From how many different companies(unique) people are joining my course
SELECT count(student_company) FROM students;  ## it is giving 7 so NULL is not counted. But it counts repeated values . so this query is not the proper solution.
SELECT student_company FROM students;
SELECT count(DISTINCT student_company) FROM students; ## This gives 5 . And that's the correct answer for the problem.
### Give alias for better display of column name
SELECT count(DISTINCT student_company) AS num_of_companies FROM students;
### From how many different locations(unique) people are joining my course
SELECT count(DISTINCT location) FROM students;
### From how many different sources(unique) people are joining my course
SELECT count(DISTINCT source_of_joining) FROM students;
### How many students who have enrolled for Feb batch
SELECT count(*) FROM students WHERE batch_date LIKE '%-02-%' ;
### How many students who have enrolled for batch starting on 19th
SELECT count(*) FROM students WHERE batch_date LIKE '19-%' ;

########## WE STUDY ABOUT 'GROUP BY' AGGREGATE FUNCTION.##########
### 'GROUP BY' says that we want to group this data based on some logic.
### Problem Statement :- I want to group the data based on companies in which student work
### like --> All the student in walmart will group together and all the students in flipkart will group together etc......
### grouping based on Source through which they have joined
### like --> All the student who have joined through linkedin will group together and all the students who have joined through google will group together etc......
### grouping based on location that All the student who have joined from hydrabad can be grouped together etc.....
### Grouping is done to do some operation later
### Problem Statement :- How many people have joined through linkedin, How many people have joined through google, How many people have joined through quora like that ....
## So, first we will group based on source_of_joining and then do a count
## I want the output is like :- linkedin - 5 , google - 2, quora - 1
SELECT source_of_joining, COUNT(*) FROM students GROUP BY source_of_joining;  ## If you are grouping on something that should always be there in your SELECT
### How many people have joined from hyderabad, How many people have joined from banglore like that.... so i want from each location wise.
SELECT location, COUNT(*) FROM students GROUP BY location;  ## If you are grouping on something that should always be there in your SELECT
SELECT location, COUNT(*) FROM students GROUP BY source_of_joining;  ## This will not work. 'source_of_joining' is not there in SELECT command. 
### Problem Statement is :- People who have joined my course from Bangalore got to know about me through linkedin like that. 
### So, we want to do grouping based on two columns(location,source_of_joining)
SELECT location,source_of_joining, COUNT(*)FROM students GROUP BY location,source_of_joining ; ### So there are 2 student from Pune who got to know me through youtube. Other remaining is 1
### Problem Statement is :- For each course how many people are enrolled. 
SELECT selected_course , count(*) FROM students GROUP BY selected_course;
SELECT batch_date,selected_course , count(*) FROM students GROUP BY batch_date,selected_course;

########## WE STUDY ABOUT 'MIN & MAX' AGGREGATE FUNCTION.##########
### Problem statement :- What is the minimum experience among my students who have joined. 
SELECT MIN(years_of_exp) FROM students; ### Minimum experience is 3
### Problem statement :- What is the maximum experience among my students who have joined. 
SELECT MAX(years_of_exp) FROM students; ### Maximum experience is 20
### Problem statement :- We want the name of the student who have minimum year of experience. 
SELECT MIN(years_of_exp),student_fname FROM students; ### This won't work 
SELECT student_fname,years_of_exp FROM students ORDER BY years_of_exp LIMIT 1; ### Minimum experience is 3
### Problem statement :- If people are joining through google what is the maximum experience among them , If people are joining through linkedin what is the maximum experience among them , like that......
SELECT source_of_joining,MAX(years_of_exp) FROM students GROUP BY source_of_joining;

########## WE STUDY ABOUT 'SUM' AGGREGATE FUNCTION.##########
### Problem statement :- Total years_of_exp of all the students of each source_of_joining
SELECT source_of_joining,SUM(years_of_exp) FROM students GROUP BY source_of_joining;

########## WE STUDY ABOUT 'AVG' AGGREGATE FUNCTION.##########
SELECT source_of_joining,AVG(years_of_exp) FROM students GROUP BY source_of_joining;
SELECT location,AVG(years_of_exp) FROM students GROUP BY location;
SELECT student_company,AVG(years_of_exp) FROM students GROUP BY student_company;
