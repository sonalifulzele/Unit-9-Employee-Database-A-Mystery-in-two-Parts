
--	1. 	List the following details of each employee: employee number, 
--   	last name, first name, gender, and salary.
		select * from employees limit 1
		select * from salaries limit 1

		select e.emp_no, 
			e.last_name, 
			e.first_name, 
			e.gender,  
			s.salary
		from employees as e
		join salaries as s 
			on e.emp_no = s.emp_no
	
--	2. 	List employees who were hired in 1986.
		select (first_name || ' ' || last_name) as Employee
		from employees
		where DATE_PART('year', hire_date) = 1986

--	3. 	List the manager of each department with the following 
--		information: department number, department name, the manager's 
--		employee number, last name, first name, and start and end employment dates.
		select * from dept_manager limit 1

		select d.dept_no, 
			d.dept_name,
			de.emp_no as manager_emp_no,
			e.last_name,
			e.first_name,
			de.from_date,
			de.to_date
		from departments as d
		join dept_emp as de on d.dept_no = de.dept_no
		join employees as e on de.emp_no = e.emp_no

	

--	4. 	List the department of each employee with the following information: 
--		employee number, last name, first name, and department name.

		select e.emp_no,
				e.last_name,
				e.first_name,
				d.dept_name
		from employees as e
		join dept_emp as de on e.emp_no = de.emp_no
		join departments as d on de.dept_no = d.dept_no

--	5. 	List all employees whose first name is "Hercules" and last names begin with "B."

		select 	e.first_name,
				e.last_name
		from employees e
		where first_name = 'Hercules' 
		and last_name like 'B%'

--	6. 	List all employees in the Sales department, including their employee number, 
--		last name, first name, and department name.
				
		select e.emp_no,
			e.Last_name,
			e.first_name,
			d.dept_name
		from employees e
		join dept_emp de on e.emp_no = de.emp_no
		join departments d on de.dept_no = d.dept_no
		where d.dept_name = 'Sales'
		
--	7. 	List all employees in the Sales and Development departments, 
--		including their employee number, last name, first name, and department name.
		
		select e.emp_no,
				e.Last_name,
				e.first_name,
				d.dept_name
		from employees e
		join dept_emp de on e.emp_no = de.emp_no
		join departments d on de.dept_no = d.dept_no
		where d.dept_name in ('Sales', 'Development')

--	8. 	In descending order, list the frequency count of employee last names, 
--		i.e., how many employees share each last name.

		select e.last_name, count(e.last_name) as count_last_name
		from employees as e
		group by e.last_name
		order by count_last_name desc