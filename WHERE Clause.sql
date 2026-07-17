SELECT*from employee_salary where first_name='leslie';
SELECT*FROM employee_salary where salary <= 50000;
SELECT*FROM employee_demographics WHERE gender != 'female';

-- AND OR NOT -- Logical Operators
SELECT*FROM employee_demographics WHERE gender='male' AND age <40;
SELECT*FROM employee_demographics WHERE gender='male' OR age <40;
SELECT*FROM employee_demographics WHERE age <40 or not gender='male';
SELECT*FROM employee_demographics WHERE first_name LIKE '%o%';
SELECT*FROM employee_demographics where (first_name='leslie' and age=44) or age>55;
-- like statement 
SELECT*FROM employee_demographics WHERE first_name like '%e%';
SELECT*FROM employee_demographics where first_name like 'a___%';
SELECT*from employee_demographics where birth_date like '%03%'


