-- Window Functions
SELECT gender,avg(salary) as avg_salary from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id
group by gender;

SELECT dem.first_name,dem.last_name,gender,avg(salary) over(partition by gender) from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id
;

SELECT dem.first_name,dem.last_name,gender,salary,
sum(salary) over(partition by gender ORDER BY dem.employee_id) as rolling_total from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id
;
-- row number() -- to give count number each row like index
SELECT dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() over() from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id;

SELECT dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() over(partition by gender) from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id;

SELECT dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() over(partition by gender order by salary desc) as row_num, 
rank() over(partition by gender order by salary desc) as rank_num,  -- rank()
DENSE_RANK() over(partition by gender order by salary desc) as DENSE_RANK_num  -- DENSE_RANK() 
from employee_demographics dem
join employee_salary sal on dem.employee_id=sal.employee_id;




