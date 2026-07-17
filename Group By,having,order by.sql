SELECT SUM(salary),dept_id   from employee_salary GROUP BY dept_id;
SELECT*from employee_salary;
SELECT gender,avg(age) as avg_age,max(age),min(age) FROM employee_demographics GROUP BY gender;

 -- ORDER BY -- 
 SELECT*FROM employee_demographics ORDER BY gender ASC,AGE DESC LIMIT 5;
SELECT*FROM employee_demographics ORDER BY 5 ASC,4 DESC;

-- WHERE VS HAVING --
SELECT gender, avg(age) FROM employee_demographics GROUP BY gender having avg(age) >40;
SELECT *FROM employee_demographics;
SELECT occupation,avg(salary) FROM employee_salary 
where occupation LIKE '%manager%' GROUP BY occupation HAVING avg(salary) > 55000;


  