-- UNIONS --
SELECT*FROM employee_demographics;
SELECT*FROM employee_salary;

SELECT first_name,last_name,employee_id FROM employee_demographics  UNION 
SELECT  first_name,last_name,employee_id FROM employee_salary;

SELECT first_name,last_name,employee_id FROM employee_demographics  UNION ALL
SELECT  first_name,last_name,employee_id FROM employee_salary;


SELECT first_name,last_name,employee_id, 'OLD MAN' LABEL FROM employee_demographics WHERE AGE>40 AND gender='MALE'  UNION 
SELECT first_name,last_name,employee_id, 'OLD LADY' LABEL FROM employee_demographics WHERE AGE>40 AND gender='FEMALE' UNION
SELECT  first_name,last_name,employee_id ,'HIGHLY PAID EMPLOYEE' LABEL FROM employee_salary WHERE salary>70000 ORDER BY first_name,last_name;

-- STRING FUNCTIONS --
SELECT length('SHAHID');
SELECT first_name,last_name,length(FIRST_NAME) FROM employee_demographics ORDER BY 3;

SELECT upper('hafis');
select lower("SINAN");

SELECT first_name,upper(first_name) from employee_demographics;
SELECT trim('     sky      ');
SELECT ltrim('     sky      ');
SELECT rtrim('     sky      ');
-- left ,right, substring
select first_name,
left(first_name,2),
right(first_name,4),
substring(first_name,3,2), -- (start,num of value)
birth_date,
substring(birth_date,6,2) as birth_month
 from employee_demographics;
 
 -- REPLACE
 SELECT first_name,replace(first_name,'a','@') from employee_demographics;
 
 -- locate
 SELECT locate('h','shahid'); -- to get location
SELECT first_name,locate('an',first_name) from employee_demographics;

-- concat
 SELECT first_name,last_name,concat(first_name,' ',last_name) 
 as full_name from employee_demographics;
 
 






