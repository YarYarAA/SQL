BEGIN TRANSACTION;
insert into my_employee
			select employee_id, first_name, last_name, email, phone_number,
      				hire_date, job_id, salary, commission_pct, manager_id, department_id
			from employees
			 where employee_id in (110,111,112);
SAVEPOINT up_1;

delete from my_employee
where first_name = 'Эрас';

ROLLBACK to up_1;

commit;