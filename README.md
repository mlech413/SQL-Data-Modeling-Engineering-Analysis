# SQL Data Modeling/Engineering/Analysis
## Overview

### Research of people employed at a fictional company Pewlett Hackard during the 1980s and 1990s. Six tables were designed to hold the data from the CSV files, imported the CSV files into a PostgreSQL database, and analyzed with 8 SQL queries.

### Performed data modeling, data engineering, and data analysis, respectively.

### The six CSV files in folder "data" were read into PostgreSQL tables which were created with script "Schema.sql" and then analyzed in "Queries.sql".
### "ERD.png" picture of table relationships was created using QuickDBD.
### Analysis in "Jupyter notebook SQL-Data-Modeling-Engineering-Analysis.ipynb" and also shown below.

## Analysis

### 1. Employee number, last name, first name, sex, and salary of each employee.

### Two table join resulting in 300,024 rows returned:

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
Output: output_csv/1_employee_salaries.csv

### 2. First name, last name, and hire date for the employees who were hired in 1986.

### Single table query with 9,574 rows returned:

SELECT first_name as "First Name",  
last_name as "Last Name",  
hire_date as "Hire Date"  
FROM employees  
WHERE DATE_PART('y', hire_date) = '1996'  
;  
Output: output_csv/2_employees_hired_1986.csv

### 3. Manager of each department along with their department number, department name, employee number, last name, and first name.

### Three table join resulting in 24 rows returned:

SELECT concat(e.first_name, ' ', e.last_name) AS "Manager",  
d.dept_no as "Manager Department Number",  
d.dept_name as "Department Name",  
e.emp_no as "Employee Number",  
e.last_name as "Last Name",  
e.first_name as "First Name"  
FROM dept_manager as dm  
INNER JOIN departments as d  
ON dm.dept_no = d.dept_no  
INNER JOIN employees as e  
ON dm.emp_no = e.emp_no  
ORDER BY d.dept_name, e.last_name, e.first_name  
;  
Output: output_csv/3_managers.csv

### 4. Department number for each employee along with that employee’s employee number, last name, first name, and department name.

### Three table join resulting in 331,603 rows returned:

SELECT d.dept_no as "Department Number",  
d.dept_name as "Department Name",  
de.emp_no as "Employee Number",  
e.last_name as "Last Name",  
e.first_name as "First Name"  
FROM departments as d  
INNER JOIN dept_emp as de  
ON d.dept_no = de.dept_no  
INNER JOIN employees as e  
ON de.emp_no = e.emp_no  
ORDER BY d.dept_no  
;  
Output: output_csv/4_dept_num_and_employees.csv
### 5. First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

### Single table query with 20 rows returned: 

SELECT first_name as "First Name",  
last_name as "Last Name",  
sex as "Sex"  
FROM employees  
WHERE first_name = 'Hercules'  
AND last_name like 'B%'  
ORDER BY last_name  
;  
Output: output_csv/5_emps_named_Hercules_B.csv

### 6. Each employee in the Sales department, including their employee number, last name, and first name.

### Three table join resulting in 52,245 rows returned:

SELECT e.emp_no as "Employee Number",  
e.last_name as "Last Name",  
e.first_name as "First Name"  
FROM departments as d  
INNER JOIN dept_emp as de  
ON d.dept_no = de.dept_no  
INNER JOIN employees as e  
ON de.emp_no = e.emp_no  
WHERE d.dept_name = 'Sales'  
ORDER BY e.last_name, e.first_name  
;  
Output: output_csv/6_sales_dept.csv

### 7. Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

### Three table join resulting in 137,952 rows returned:

SELECT e.emp_no as "Employee Number",  
e.last_name as "Last Name",  
e.first_name as "First Name",  
d.dept_name as "Department"  
FROM departments as d  
INNER JOIN dept_emp as de  
ON d.dept_no = de.dept_no  
INNER JOIN employees as e  
ON de.emp_no = e.emp_no  
WHERE d.dept_name IN ('Sales', 'Development')  
ORDER BY e.last_name, e.first_name  
;  
Output: output_csv/7_sales_and_development_depts.csv

### 8. Frequency counts, in descending order, of all the employee last names.

### Single table query with 1,638 rows returned: 

SELECT last_name as "Last Name",  
COUNT(last_name) as "Count"  
FROM employees  
GROUP BY last_name  
ORDER BY "Count" DESC  
;  
Output: output_csv/8_last_name_frequency.csv