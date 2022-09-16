--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

--[HELP] List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date ASC;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules' AND last_name iLIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
JOIN departments as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp
ON e.emp_no = dept_emp.emp_no
JOIN departments as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS "total"
FROM employees
GROUP BY last_name
ORDER BY "total" DESC;