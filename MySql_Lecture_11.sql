-- ======================================
-- DATABASE: REGEX
-- TABLE: EMPLOYEE
-- PURPOSE: Practice Self Join, Joins, and Salary Comparison
-- ======================================

-- 1️⃣ Create Employee Table with Self-referencing Foreign Key
use regex;

create table employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);

-- 2️⃣ Insert Sample Data
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),
(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),
(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),
(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),
(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),
(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),
(15, 'Sybil', 'Intern', 8, 35000);

-- 3️⃣ Select All Employees
select * FROM employee;

-- ======================================
-- 4️⃣ Basic Employee Info
-- List employee ID, name, and manager ID
SELECT emp.emp_id, emp.emp_name, emp.manager_id
FROM employee AS emp;

-- 5️⃣ Manager Reference
-- List all managers (alias)
SELECT manager.emp_id, manager.emp_name
FROM employee AS manager;

-- ======================================
-- 6️⃣ Self Join Examples

-- 6a. Employee with Manager (Basic Self Join)
SELECT emp.emp_id, emp.emp_name, emp.manager_id
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id;

-- 6b. Employee + Manager Info
SELECT emp.emp_id, emp.emp_name, emp.manager_id,
       manager.emp_id AS manager_emp_id, manager.emp_name AS manager_name
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id;

-- 6c. Employee + Manager + Salary
SELECT emp.emp_id, emp.emp_name, emp.manager_id, emp.salary,
       manager.emp_id AS manager_emp_id, manager.emp_name AS manager_name, manager.salary AS manager_salary
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id;

-- ======================================
-- 7️⃣ Employees Earning More Than Manager
SELECT emp.emp_id, emp.emp_name, emp.manager_id, emp.salary,
       manager.emp_id AS manager_emp_id, manager.emp_name AS manager_name, manager.salary AS manager_salary
FROM employee AS emp
JOIN employee AS manager
ON emp.manager_id = manager.emp_id
WHERE emp.salary > manager.salary;

-- ======================================
-- 8️⃣ Notes on Joins

-- 8a. USING() clause example (when columns have same name)
-- SELECT emp_name
-- FROM employee AS emp
-- JOIN employee AS manager
-- USING(emp_id);

-- 8b. LEFT JOIN example (shows employees even if manager missing)
-- SELECT emp.emp_name AS Employee, manager.emp_name AS Manager
-- FROM employee AS emp
-- LEFT JOIN employee AS manager
-- ON emp.manager_id = manager.emp_id;

-- 8c. RIGHT JOIN example (shows all managers even if no employees)
-- SELECT emp.emp_name AS Employee, manager.emp_name AS Manager
-- FROM employee AS emp
-- RIGHT JOIN employee AS manager
-- ON emp.manager_id = manager.emp_id;
