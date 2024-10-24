### We will study anout order of execution in this session

SELECT DISTINCT source_of_joining FROM students ORDER BY enrollment_date;
### so we are doing DISTINCT and ORDER BY in the same query.
### Let us go from the very basic.
SELECT source_of_joining FROM students;
### ORDER OF EXECUTION of the above query is :-
# ==============================
# First 'FROM' will execute --> Loading the table
# Then 'SELECT' will execute --> (What all the columns we want to show)  HERE PROJECTING ONLY ONE COLUMN THAT IS 'source_of_joining'

SELECT source_of_joining, enrollment_date FROM students;
### ORDER OF EXECUTION of the above query is :-
# ==============================
# First 'FROM' will execute --> Loading the table
# Then 'SELECT' will execute --> (PROJECTING source_of_joining, enrollment_date)

SELECT source_of_joining, enrollment_date FROM students ORDER BY enrollment_date;
### ORDER OF EXECUTION of the above query is :-
# ==============================
# First 'FROM' will execute --> Loading the table
SELECT * FROM students;
# Then 'SELECT' will execute --> (PROJECTING source_of_joining, enrollment_date)
SELECT source_of_joining, enrollment_date FROM students;  # At this step both data is still unordered because it is accessed before the execution of ORDER BY.
# Then 'ORDER BY' --> (based on enrollment_date it will order by)
SELECT source_of_joining, enrollment_date FROM students ORDER BY enrollment_date;


SELECT source_of_joining FROM students ORDER BY enrollment_date; ### Even though enrollment_date is not SELECT statement we are still able to do ORDER BY.
### ORDER OF EXECUTION of the above query is :-
# ==============================
# First 'FROM' will execute --> Loading the table
SELECT * FROM students;
#### Because our system is intelligent that's why system will not discard the column 'enrollment_date' beacuse system know that later we are doing ORDER BY.  And that's why the system will still project enrollment_date here.   
# Then 'SELECT' will execute --> (PROJECTING source_of_joining, enrollment_date)
SELECT source_of_column, enrollment_date FROM students;  # At this step both data is still unordered because it is accessed before the execution of ORDER BY.
# Then 'ORDER BY' --> (based on enrollment_date it will order by)
### Since we have not asked for enrollment_date it will discard it later . It won't show enrollment_date because we have not requested. After ORDER BY system will discard enrollemnt_date 
SELECT source_of_joining FROM students ORDER BY enrollment_date;


SELECT DISTINCT source_of_joining FROM students ORDER BY enrollment_date;  ## This query is not working why let's see.
### ORDER OF EXECUTION of the above query is :-
# ==============================
# First 'FROM' will execute --> Loading the table
SELECT * FROM students;
#### Because our system is intelligent that's why system will not discard the column 'enrollment_date' beacuse system know that later we are doing ORDER BY.  And that's why the system will still project enrollment_date here.   
# Then 'SELECT' will execute --> (PROJECTING source_of_joining, enrollment_date)
SELECT source_of_column, enrollment_date FROM students;  # At this step both data is still unordered because it is accessed before the execution of ORDER BY.
#### Then 'DISTINCT' will execute
SELECT DISTINCT source_of_column, enrollment_date FROM students;  ### Here the problem comes.
### Describing problem here :- Earlier we want to 'DISTINCT' on only source_of_joining but just because system has to take one more column 'enrollment_date' in the end 'DISTINCT' will happen on both the columns,which is logically wrong 
### Now, 'Distinct' is happening on the combination of both column rather than one column that gives wrong output. So instead of giving wrong ouput, system will throw an error.

