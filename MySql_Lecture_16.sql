-- =====================================================
-- CORRELATED SUBQUERY QUESTIONS WITH QUERIES
-- =====================================================
-- Q1. What is a correlated subquery?
-- A correlated subquery is a subquery that depends on the outer query
-- and is executed once for each row of the outer query.

-- Q2. Find the average salary of employees in each department.
select avg(salary) as avg_salary, department_name
from employee
group by department_name;

-- Q3. Create a database named regexcorr and use it.
create  database regexcorr;
use regexcorr;

-- Q4. Create an employee table.
create table employee (
    eid int primary key,
    ename varchar(50),
    salary int,
    department_name varchar(50)
);

-- Q5. Insert sample data into employee table.
insert into employee (eid, ename, salary, department_name) values
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),

(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),

(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),

(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');

-- Q6. Display all records from employee table.
select * from employee;

-- Q7. Find employees whose salary is greater than
-- the average salary of their department.
-- (Correlated Subquery)
select ename, salary, department_name
from employee
where salary > (
    select avg(salary)
    from employee as e
    where e.department_name = employee.department_name
);
-- Q8. Find employees whose salary is equal to
-- the minimum salary of their department.
select ename, salary, department_name
from employee
where salary = (
    select min(salary)
    from employee as e
    where e.department_name = employee.department_name
);

-- Q9. Find employees whose salary is less than or equal
-- to the minimum salary of their department
-- using ALL operator.
select ename, salary, department_name
from employee
where salary <= all (
    select min(salary)
    from employee as e
    where e.department_name = employee.department_name
);
