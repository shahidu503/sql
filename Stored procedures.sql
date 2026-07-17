-- Stored Procedures
create procedure large_salaries()
SELECT*from employee_salary
where salary>=50000;

call large_salaries();

delimiter //
create PROCEDURE large_salary2()
begin 
	SELECT*from employee_salary
	where salary>=50000;
    SELECT*from employee_salary
	where salary>=10000;
end // delimiter ;

call large_salary2()

--
delimiter //
create procedure salary_by_name(name varchar(50))
begin 
     select * from employee_salary
     where first_name=name;
end //
delimiter ;

call salary_by_name('ron') ;




