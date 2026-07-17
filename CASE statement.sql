-- CASE statement --
 SELECT first_name,last_name,
 case
 WHEN age<=30 then 'young'
 WHEN age BETWEEN 31 and 50 then 'old'
 WHEN age >=50 then "on death's door"
 end as age_bracket
 from employee_demographics;

-- pay increase and bonus
-- < 50000 = 5%
-- >50000 = 7%
-- finance = 10%
SELECT first_name,last_name,
 case
 WHEN salary<50000 then salary+(salary*0.05)
 when salary >50000 then salary+(salary*0.07)
 end
 as New_salary,
 case
 WHEN dept_id=6 then salary* .10
 end as Bonus 
 from employee_salary;
 
 SELECT* from employee_salary;
 SELECT * from parks_departments;
 
 
 
 