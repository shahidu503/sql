SELECT*from employee_demographics ORDER BY age DESC LIMIT 4,1; 
SELECT*from employee_demographics ORDER BY age DESC;

-- aliasing --
select gender,avg(age) as average_age from employee_demographics GROUP BY gender having average_age >40;
 
-- join --
SELECT*from employee_demographics;
SELECT*from employee_salary;
-- inner join--
SELECT SAL.employee_id,DEM.first_name,AGE,occupation FROM employee_demographics AS DEM INNER JOIN employee_salary AS SAL
ON DEM.employee_id=SAL.EMPLOYEE_ID;


-- left join --
SELECT*from employee_demographics as dem left join employee_salary AS SAL ON DEM.EMPLOYEE_ID = SAL.EMPLOYEE_ID;
 
-- right join --
SELECT *FROM EMPLOYEE_DEMOGRAPHICS AS DEM RIGHT JOIN EMPLOYEE_SALARY AS SAL ON DEM.EMPLOYEE_ID = SAL.EMPLOYEE_ID;

-- SELF JOIN --
SELECT *FROM EMPLOYEE_DEMOGRAPHICS AS DEM JOIN EMPLOYEE_SALARY AS SAL ON DEM.EMPLOYEE_ID = SAL.EMPLOYEE_ID;

-- JOINING MULTIPLE TABLE TOGETHER --
SELECT*FROM employee_demographics DEM 
INNER JOIN employee_salary SAL ON DEM.EMPLOYEE_ID = SAL.EMPLOYEE_ID
INNER JOIN parks_departments PD ON SAL.DEPT_ID = PD.DEPARTMENT_ID;

