-- Triggers 
select * FROM employee_demographics;
SELECT * FROM employee_salary;

DELIMITER //
CREATE TRIGGER EMPLOYEE_INSERT
	AFTER INSERT ON EMPLOYEE_SALARY
    FOR EACH ROW
BEGIN
	INSERT INTO EMPLOYEE_DEMOGRAPHICS (EMPLOYEE_ID,FIRST_NAME,LAST_NAME)
    VALUES (NEW.EMPLOYEE_ID,NEW.FIRST_NAME,NEW.LAST_NAME);
END //
DELIMITER ;

insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
values (13,'marco','junior','enterteinment 720 CEO ',1000000,NULL);

--  Events --
select * from employee_demographics;
delimiter $$
create event delete_retirees
on schedule every 30 second do
begin
	delete from 
    employee_demographics
    where age>=60;
end $$
delimiter ;

show variables like 'envet%';
DROP TRIGGER EMPLOYEE_INSERT;
SHOW TRIGGERS;
SELECT database();





