 /**Задание 1 */
select 1 as stroka
UNION
select 2
UNION
select 3

 /**Задание 2 */
select employee_id
from employees
UNION ALL
select employee_id
from job_history
order by employee_id

/**Задание 3 */
select employee_id
from employees
INTERSECT
select employee_id
from job_history

/**Задание 4 */
select employee_id
from employees
EXCEPT
select employee_id
from job_history