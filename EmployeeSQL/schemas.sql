--Drop all tables
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--Departments table with departments.csv
CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(25) NOT NULL
);
	
--Importing CSV & Check the table
SELECT * FROM departments;

--Salaries table with salaries.csv
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(25) NOT NULL
);

--Importing CSV & Check the table
SELECT * FROM titles;

--Employees table with employees.csv
CREATE TABLE employees(
	emp_no Integer NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

--Importing CSV & Check the table
SELECT * FROM employees;

--Salaries table with salaries.csv
CREATE TABLE salaries(
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary Integer NOT NULL
);

--Importing CSV & Check the table
SELECT * FROM salaries;

--Department_Employee table with dept_emp.csv
CREATE TABLE dept_emp(
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Importing CSV & Check the table
SELECT * FROM dept_emp;

--Department_Manager table with dept_manager.csv
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no Integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Importing CSV & Check the table
SELECT * FROM dept_manager;