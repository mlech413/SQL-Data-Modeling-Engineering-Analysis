# SQL Data Modeling/Engineering/Analysis
## Overview
### Research of people employed at a fictional company Pewlett Hackard during the 1980s and 1990s. Six tables were designed to hold the data from the CSV files, imported the CSV files into a PostgreSQL database, and then questions answered about the data through SQL queries.
### Performed data modeling, data engineering, and data analysis, respectively.

### The six CSV files in folder "data" were read into PostgreSQL tables which were created with script "Schema.sql" and then analyzed in "Queries.sql".
### "ERD" picture of table relationships was created using QuickDBD.

## Analysis
###1. List the employee number, last name, first name, sex, and salary of each employee.
###Two table join resulting in 300,024 rows returned:

SELECT e.emp_no as "Employee Number", 

e.last_name as "Last Name", 

e.first_name as "First Name", 

e.sex as "Sex", 

to_char(s.salary::numeric, '$FM9,999,999') as "Salary"
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
ORDER BY e.last_name
;
