SELECT*from employee_demographics ORDER BY age DESC LIMIT 4,1; 
SELECT*from employee_demographics ORDER BY age DESC;

-- aliasing --
select gender,avg(age) as average_age from employee_demographics GROUP BY gender having average_age >40;
