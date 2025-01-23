/**Задание 1 */
SELECT   department_id, 
         Max(salary) as max_salary, 
         Min(salary) as min_salary, 
         max(hire_date) as hire_date_last,
         min(hire_date) as hire_date_early,
         count(*) as Employees
  FROM employees e
   GROUP BY department_id
   order by Employees

/**Задание 2 */
SELECT SUBSTRING(first_name, 1, 1) as Bykva,
       count(*)
 FROM employees
   GROUP BY Bykva
   having count(*) > 1
   order by count(*)

/**Задание 3 */
select department_id,
       salary,
       count(*)
  FROM employees
   GROUP BY department_id, salary
   having count(*) > 1
   order by department_id
-- Задание 3 если показать итого кол-во сотрудинков -> без учета что совпадения в разных зп
SELECT department_id, sum(countE)
from (select department_id,
       salary,
       count(*) as countE
  FROM employees
   GROUP BY department_id, salary
   having count(*) > 1
  )
 GROUP by department_id

/**Задание 4 */
select to_char(hire_date, 'FMDay') as day,
	   count(*)
 from employees
 GROUP by day
 order by count(*)

/**Задание 5 */
select to_char(hire_date, 'yyyy') as year,
	   count(*)
 from employees
 GROUP by year
 order by count(*)
 
 
/**Задание 6 */
SELECT COUNT(DISTINCT department_id) AS department_count
FROM employees

/* или чтобы точно проверить -> по айди сотрудников найти департмент 
и подсчитать кол-во департменов */
select COUNT(DISTINCT department_id) AS department_count
from (
  SELECT  department_id, 
		employee_id,
		count(*)
 from employees
 GROUP BY department_id, employee_id
 order by employee_id
)

/**Задание 7 */
select  department_id,
		count(*)
 from employees
 GROUP by department_id
 HAVING count(*) > 30

/**Задание 8 */
SELECT  department_id,
		round(avg(salary)) as avarge_s
 from employees
 GROUP by department_id

/**Задание 9 */
SELECT  region_id,
		sum(LENGTH(country_name)) AS Length_country_name
 FROM countries
 GROUP by region_id
 having sum(LENGTH(country_name)) > 60
 
/**Задание 10 */
select  department_id,
		job_id,
		count(job_id)
 from employees
  GROUP by department_id,job_id
  having count(job_id) > 1
 -- если показать итого кол-во сотрудинков -> без учета что job_id совпали разные
 SELECT department_id, sum(count) as employees
  from (
    select  department_id,
		job_id,
		count(job_id)
 from employees
  GROUP by department_id,job_id
  having count(job_id) > 1
    )
 GROUP by department_id
 
 /**Задание 11 */
select  manager_id,
        COUNT(employee_id),
        sum(salary)
 from employees
 GROUP by manager_id
 having COUNT(employee_id) > 5 and sum(salary) > 50000
 