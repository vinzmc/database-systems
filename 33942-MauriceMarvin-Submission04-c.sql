USE company;
SET SQL_SAFE_UPDATES = 0;

UPDATE employee
SET first_name = 'Pedo', last_name = 'Bear', email = 'pedo.bear@gmail.com'
WHERE employee_id = 'E0005';

UPDATE employee
SET salary = (salary - 100000);

UPDATE employee
SET department_id = 'D0002', job_id= 'J0005'
WHERE employee_id = 'E0002';

DELETE FROM employee
WHERE employee_id = 'E0004';

INSERT INTO employee
VALUES ('E0012', 'Usui', 'Takumi', '1982-04-27', 'Usui.takumi@gmail.com', '085309009211', '2020-09-23', 4500000, 'J0007', 'D0004');

UPDATE employee
SET salary = (salary + 200000)
WHERE employee_id = 'E0012';

UPDATE employee
SET salary = (salary + (salary * 0.1))
WHERE monthname(birth_date)='November' OR birth_date >= '1970-09-20';

SET SQL_SAFE_UPDATES = 1;