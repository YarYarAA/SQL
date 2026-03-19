BEGIN TRANSACTION;
insert into my_employee
VALUES (1,'Darth', 'Vader',null, null, CURRENT_DATE, null, 5500.00); 

update my_employee
set salary = 1000 + (
  						SELECT salary
  						from my_employee
  						 where first_name = 'Джеймс'
  						)
 where first_name = 'Darth';

TRUNCATE table my_employee;

ROLLBACK;

select *
from my_employee;

insert into my_employee
			select employee_id, first_name, last_name, email, phone_number,
      				hire_date, job_id, salary, commission_pct, manager_id, department_id
			from employees
			 where salary > 500;

delete from my_employee
where employee_id = 100;

COMMIT;