--List the employee number, last name, first name, sex, and salary of each employee.
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

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name as "First Name", 
last_name as "Last Name", 
hire_date as "Hire Date"
FROM employees
WHERE DATE_PART('y', hire_date) = '1996'
;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
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

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
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

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.
SELECT first_name as "First Name",
last_name as "Last Name",
sex as "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%'
ORDER BY last_name
;

--List each employee in the Sales department, including their employee number, 
--last name, and first name.
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

--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
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

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name as "Last Name",
COUNT(last_name) as "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC
;