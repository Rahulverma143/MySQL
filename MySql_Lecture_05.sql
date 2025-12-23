-- Name- Rahul Verma
-- Batch-SQl Batch L5

-- 1. Find the total salary paid per department.
select department, sum(salary) from Employees group by department;

-- 2. Find the number of employees in each department.
select department, count(*) from Employees group by  department;

-- 3. first 3 characters of each employee name in capital letters
select substring(emp_name, 1, 3) FROM employees;

-- 4. Find employees who have more than 6 characters in their name
select * from employees where length(emp_name) > 6;

-- 5. Find employees who joined after November 2020.
    select * from employees where join_date > '2020-11-30';

-- 6. Display the number of years since joining (assuming current year = 2025).
  select emp_name, 2025 - year(join_date) from Employees;

-- 7. Display salary rounded to nearest thousand
  select emp_name, round(salary, -3) from Employees;

-- 8. Find cities having more than 2 employees
select city, count(*) from Employees group by city having count(*) > 2;

-- 9. Find cities where the average salary is between 60,000 and 75,000
 select city, avg(salary) from Employees group by city having avg(salary) between 60000 and 75000;

-- 10. Find the department and city combination where the average salary is highest
select department, city, avg(salary) from Employees group by department, city order by avg(salary) desc limit 1;

-- 11. Display departments where more than one city is present
select department from Employees group by department having count(distinct city) > 1;

-- 12. Brief on SQL and types of SQL languages with examples

 -- SQL stand for (Structured Query Language) is a language used to store, fetch, and manage data in a database.
/*
Types of SQL with examples:

DDL stands for Data Definition Language.
-- used to define or modify database structure
Example:
create table Employees (emp_id int, emp_name varchar(50), salary int, department varchar(50), city varchar(50), join_date date);
alter table Employees add column email varchar(50);
drop table Employees;

DML stands for Data Manipulation Language.
-- used to manipulate data in tables
Example:
insert into Employees (emp_id, emp_name, salary, department, city, join_date) values (1, 'Rahul', 50000, 'IT', 'Delhi', '2022-01-10');
update Employees set salary = 55000 where emp_id = 1;
delete from Employees where emp_id = 1;

-- DCL stands for Data Control Language.
-- used to control access to data
Example:
grant select, insert on Employees to user1;
revoke insert on Employees from user1;

TCL stands for Transaction Control Language.
-- used to manage transactions
Example:
commit;
rollback;
savepoint sp1;

DQL stands for Data Query Language.
-- used to query data from database
Example:
select emp_name, salary from Employees where department = 'IT';
*/