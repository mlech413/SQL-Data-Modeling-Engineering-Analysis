CREATE TABLE departments
(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles
(
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employees
(
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(30) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries
(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp
(
	emp_no INT,
	dept_no VARCHAR(30),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
	
CREATE TABLE dept_manager
(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT* FROM departments;
SELECT* FROM titles;
SELECT* FROM employees;
SELECT* FROM salaries;
SELECT* FROM dept_emp;
SELECT* FROM dept_manager;