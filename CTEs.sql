with CTE_Example as(
SELECT gender,avg(salary) as avg_salary,max(salary) as max_sal,min(salary) as min_sal,count(salary) as count_sal 
from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id
group by gender)
SELECT*from cte_example;

with CTE_Example as(
SELECT employee_id,gender,birth_date
from employee_demographics
where birth_date >'1985-01-01'
),
CTE_Example2 as (
select employee_id ,salary from employee_salary
where salary>50000)
SELECT*from cte_example join cte_example2 
on cte_example.employee_id=cte_example2.employee_id;

with CTE_Example(GENDER,AVG_SAL,MAX_SAL,MIN_SAL,COUNT_SAL) as(
SELECT gender,avg(salary) as avg_salary,max(salary) as max_sal,min(salary) as min_sal,count(salary) as count_sal 
from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id
group by gender)
SELECT*from cte_example;






