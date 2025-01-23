/**Задание 1 */
select first_name 
from employees
 where LENGTH(first_name) = (
 							select max(LENGTH(first_name))
        					from employees
 										)

/**Задание 2 */
SELECT first_name
from employees
 where salary > (
				select SUM(salary) / count(employee_id)
				from employees
								)

/**Задание 3 */
select city
from locations
 where location_id = (
			select location_id
			from departments
			 where department_id = (
							select department_id
							from employees
							GROUP by department_id
							 having sum(salary) = 
                     					(
                                         select min(sum_salary)
					 					 from (
  												select department_id, sum(salary) as sum_salary
  												from employees
  												 GROUP by department_id)
  					)))
  
/**Задание 4 */
select first_name
from employees
 where manager_id = any -- или WHERE manager_id IN
						(
						select manager_id
						from employees
							where salary > 15000
                          )
/**Задание 5 */
SELECT department_id
from departments
 where manager_id is null

/**Задание 6 */
select first_name, employee_id
from employees
 where employee_id <> all -- или WHERE employee_id NOT IN
						(
						  select manager_id
						  from employees
 						   WHERE manager_id IS NOT NULL
  						  )

/**Задание 7 */
select manager_id, count(employee_id)
from employees
GROUP by manager_id
HAVING count(employee_id) > 6

/**Задание 8 */
select first_name
from employees
where department_id in (
  						select department_id
						from departments
						 where department_name = 'IT'
						)
/**Задание ***1 */
select first_name
from employees
 where hire_date < (
					select hire_date
					from employees
					 where employee_id = 201)
      and salary > (
        			select salary
					from employees
					 where employee_id = 201)
/**Задание ***2 */
select department_name
from departments
 where department_id in (
  						select department_id
  						from employees
  						 where salary > 12000)
/**Задание ***3 */
select country_name
from countries
 where region_id in (
  					select region_id
					from regions
					 where lower(region_name) like '%m%')