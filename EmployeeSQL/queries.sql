--List Employee Number, Last Name, First Name, Sex, and Salary of Each Employee
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--List First Name, Last Name, and Hire Date for Employees Hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%/1986';

--List the Manager of each Department along with Department Number, Department Name, Employee Number, Last Name, and First Name
SELECT dm.dept_no, dept_name, dm.emp_no, last_name, first_name
FROM dep_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
WHERE dm.emp_no IN (
			SELECT emp_no
			FROM dep_manager
);

--List Department Number for each Employee along with Employee Number, Last Name, First Name, and Department Name
SELECT de.dept_no, de.emp_no, last_name, first_name, dept_name
FROM dep_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--List First Name, Last Name, and Sex of each employee with a First Name of 'Hercules' and whose last name begins with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List each Employee in the Sales Department, including Employee Number, Last Name, and First Name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN(
		SELECT emp_no
		FROM dep_emp
		WHERE dept_no = 'd007');

--List each Employee in the Sales and Development Departments, including Employee Number, Last Name, First Name, and Department Name
SELECT de.emp_no, last_name, first_name, (SELECT dept_name FROM departments WHERE de.dept_no = departments.dept_no)
FROM dep_emp de
JOIN employees e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007'
OR de.dept_no = 'd005';

--List frequency counts of Employee Last Names, in descending order
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;