/**Задание 1*/
select *
 from employees
  where LENGTH(first_name) >= 10
  
/**Задание 2*/
select *
 from employees
  where lower(first_name) like '%b%'
  
/**Задание 3*/
select *
 from employees
   where first_name like '%a%a%'
   
/**Задание 4*/
select SUBSTRING(department_name, 1, STRPOS(department_name,' ')-1)
 from departments
  where STRPOS(department_name,' ') > 0
  
/**Задание 5*/
select *
 from employees
  where date_part('day', hire_date) = 1
  
/**Задание 6*/
select *
 from employees
  where date_part('year', hire_date) = 2008
 
 /**Задание 7*/
 select to_char(trunc(salary + salary * 
                      COALESCE(s.commission_pct,0), 2), 'L99,999.00') as new_salary
       , s.*
  from employees s
  
 /**Задание 8*/
select s.*,
  CASE
    when s.commission_pct is NULL
    then 'No'
    else 'Yes'
  end as Bonus
 from employees s