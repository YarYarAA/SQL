/**Задание 1 */
select e.first_name, 
		e.last_name, 
        d.department_name, 
        e.job_id, 
       l.street_address, 
       n.country_name, 
        r.region_name
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join countries n on l.country_id = n.country_id
join regions r on n.region_id = r.region_id

/**Задание 2 */
select  q.manager_id, 
		count(e.employee_id) as Количество_подчиненных
 from employees e 
 join employees q on e.manager_id = q.employee_id 
GROUP BY q.manager_id
having count(e.employee_id)>6

/**Задание 3 */
SELECT e.employee_id as Сотрудник, d.department_id
from employees e left JOIN departments d 
ON e.department_id = d.department_id
where d.department_id is NULL

/**Задание 4 */
SELECT e.employee_id as Сотрудник, d.department_id
from employees e right JOIN departments d 
ON e.department_id = d.department_id
where e.employee_id is NULL

/**Задание 5 */
select e.employee_id as Нет_подчиненных_у_employee_id
from employees e left join  employees q
on e.employee_id = q.manager_id
where q.manager_id is NULL
--order by e.employee_id;

/**Задание 6 */
select e.employee_id
from employees e join employees q
on (e.manager_id = q.employee_id)
   where to_char(q.hire_date,'yyyy') = '2005' 
	 and to_char(e.hire_date,'yyyy') < '2005'

/**Задание 7 */
select e.employee_id As Сотрудник
from employees e 
join employees q on (e.manager_id = q.employee_id)
join jobs j on e.job_id = j.job_id
where to_char(q.hire_date,'MM') = '01' and LENGTH(job_title) > 15