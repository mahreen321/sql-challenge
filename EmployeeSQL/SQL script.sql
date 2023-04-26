--List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no,employees.last_name,employees.first_name, employees.sex,salaries.salary
from employees
join salaries
    on employees.emp_no = salaries.emp_no
order by 1;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name, hire_date
from employees
where  hire_date  between '01/01/1986' and '12/31/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select mang.dept_no, dpt.dept_name, mang.emp_no, emp.last_name, emp.first_name
from dept_manager mang
join departments dpt
    on mang.dept_no = dpt.dept_no
join employees emp
    on mang.emp_no = emp.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name,dpt.dept_no,dpt.dept_name
from employees emp
join dept_emp de on emp.emp_no = de.emp_no
join departments dpt
    on de.dept_no = dpt.dept_no
order by 1;
---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name,sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select emp.emp_no,emp.last_name, emp.first_name
from employees emp
join dept_emp dp
    on emp.emp_no =dp.emp_no
join departments dps
    on dp.dept_no= dps.dept_no
where dps.dept_name= 'Sales'
order by 1;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no,emp.last_name, emp.first_name, dp.dept_name
from employees emp
join dept_emp de
    on emp.emp_no = de.emp_no
join departments dp
    on de.dept_no = dp.dept_no
where dp.dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name)as "Total Name Count"
from employees
group by last_name
order by 2 desc;