CREATE TABLE MY_EMPLOYEE AS SELECT * 
FROM employees 
 WHERE 1 = 0;

BEGIN TRANSACTION;
insert into my_employee
VALUES (1,'Darth', 'Vader',null, null, CURRENT_DATE, null, 5500.00);

insert into my_employee
			select employee_id, first_name, last_name, email, phone_number,
      				hire_date, job_id, salary, commission_pct, manager_id, department_id
			from employees
			 where employee_id = 100;


insert into my_employee
VALUES 					(2,'Джеймс', 'Бонд', 'JS', '111.222.3333', 
                         now(), 'MYR', 2000.00, 0.1, NULL, 80);

insert into my_employee
VALUES 					(3,'Эрас', 'Фандорин', 'EF', '222.333.4444', 
                         now(), 'MYA', 5000.00, 0.2, NULL, 70);

insert into my_employee
VALUES 					(4,'Джек', 'Воробей', 'JV', '333.444.5555', 
                         now(), 'GAV', 7000.00, 0.3, NULL, 60);
commit;

BEGIN TRANSACTION;
UPDATE my_employee
set last_name = 'Drexler'
where employee_id = 3;

update my_employee
set salary = 1000
where salary < 900;

select *
from my_employee;

commit;

BEGIN TRANSACTION;
delete from my_employee
where employee_id = 1;

commit;