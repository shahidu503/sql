-- temporary table
create TEMPORARY table temp_table
(first_name VARCHAR(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT*from temp_table;
insert into temp_table values('hafis','mohammad','sarva maya malayalam'),
							 ('sinan','KP','malayalam movie'),
                             ('shahid','alavi','reality movies');
                             
SELECT*from employee_salary;

create temporary table salary_over_50k
SELECT*from employee_salary
where salary >=50000;

select*from salary_over_50k;
                             