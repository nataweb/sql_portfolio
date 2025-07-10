--******************************************
--**************datetime functions**************
--******************************************
select now() + interval'30 days'as month_later;
select  timeofday();

select extract(year from current_date) as current_year,
   extract(month from current_date) as current_month;

select date_part('year', current_date) as current_year,
   date_part('month', current_date) as current_month;

select to_date('27-06-2025', 'DD-MM-YYYY');

select to_char(current_date,'DD-MM-YYYY');

select employee_id,first_name,last_name,hire_date,department_id,
extract(year from hire_date) as hire_year from "HR".employees;

select employee_id,first_name,last_name,hire_date,department_id,current_date,
date_part('year',current_date) - date_part('year',hire_date) as years_in_company 
from "HR".employees;

select employee_id,first_name,last_name,department_id,hire_date,
date_part('year',hire_date + interval'30 years') as anniversary 
from "HR".employees

select employee_id,first_name,last_name,department_id,hire_date,
date_part('month',hire_date) as hire_month
from "HR".employees

--****************************************
--*********** Window functions************
--****************************************
select count(distinct(department_id)) from "HR".employees;

select department_id,max(salary) as max_salary
from "HR".employees
where department_id is not null
group by department_id
order by department_id; 

select employee_id,
first_name,
last_name,
hire_date,
department_id,
current_date,
salary,
max(salary) over(partition by department_id ) as max_salary
from "HR".employees
order by salary desc;

select employee_id,
first_name,
last_name,
hire_date,
department_id,
current_date,
salary,
row_number() over(partition by department_id order by salary) as max_salary,
rank() over(partition by department_id order by salary) as max_salary_r,
dense_rank() over(partition by department_id order by salary desc) as max_salary_dr
from "HR".employees
--order by department_id;

select employee_id,
first_name,
last_name,
hire_date,
department_id,
current_date,
salary,
ntile(5) over(order by salary) as salary_level_group
from "HR".employees
--order by department_id;

select employee_id,
first_name,
last_name,
hire_date,
department_id,
current_date,
salary,
first_value(salary) over(partition by department_id order by hire_date) as first_salary,
last_value(salary) over(partition by department_id order by hire_date desc) as last_salary
from "HR".employees;

select employee_id,
first_name,
last_name,
hire_date,
department_id,
salary,
lag(hire_date,-1) over(partition by department_id order by hire_date) as hire_date_before
from "HR".employees;

select employee_id,
first_name,
last_name,
hire_date,
department_id,
salary,
lead(salary,1) over(partition by department_id order by hire_date) as salary_more_1
from "HR".employees;