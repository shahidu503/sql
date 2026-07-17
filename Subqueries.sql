-- Subqueries --

SELECT*FROM employee_demographics;
SELECT*from employee_salary;

SELECT * from employee_demographics
where employee_id in (SELECT employee_id
					from employee_salary
                    where dept_id =1);

SELECT first_name,salary ,avg(salary)
from employee_salary
group by first_name,salary
;
SELECT first_name,salary,
(select avg(salary) from employee_salary) avg_salary
 from employee_salary;      
 
 select
 avg(max_age) 
 from (SELECT 
avg(age) as avg_age,
max(age) as max_age,
min(age) as min_age
from employee_demographics
group by gender) as agg_table;