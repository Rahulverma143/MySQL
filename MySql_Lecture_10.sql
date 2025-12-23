-- =====================================
-- 23/12/2025 Lecture : JOINS in SQL
-- =====================================

-- Database create aur use kar rahe hain
CREATE DATABASE REGEX;
USE REGEX;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);


-- Customers data insert
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');
-- Orders data insert
INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

-- Tables ka data dekhna
select * FROM customers;
select * FROM orders;


-- INNER JOIN (old style using WHERE)
-- Matching customer_id wale records
select *
from customers c, orders o
where c.customer_id = o.customer_id;


-- INNER JOIN using JOIN + ON (recommended)
select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id;

-- LEFT JOIN
-- Saare customers + matching orders
select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- RIGHT JOIN
-- Saare orders + matching customers
select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
from customers c
right join orders o
on c.customer_id = o.customer_id;

-- NATURAL JOIN
-- Same name aur same datatype column par automatic join
select 
    customer_id,
    customer_name,
    city,
    order_id,
    order_date,
    amount
from customers
natural join orders;

-- Column ka naam change karna
ALTER TABLE customers RENAME COLUMN customer_id TO cid;
DESC customers;

-- NATURAL JOIN after column rename
-- (Ab customer_id common nahi raha)
select 
    c.cid,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
from customers c
join orders o
ON c.cid = o.customer_id;

-- CROSS JOIN / CARTESIAN JOIN
-- Har customer har order se combine hota hai
select *
from customers
cross JOIN orders;

-- Total amount spent (all orders)
select sum(amount) AS total_amount_spent
from orders;

-- Customer-wise total amount
select customer_id, sum(amount) AS total_spent
from orders
group BY customer_id;


-- Customer name ke sath total spending
select 
    c.customer_name,
    SUM(o.amount) AS total_spent
from customers c
join orders o
on c.cid = o.customer_id
group by c.customer_name;

-- SAKILA DATABASE (JOIN PRACTICE)
use sakila;

select * from film_actor;
select * from actor;
select * from film;

-- Actor aur film ka relation
select 
    fa.film_id,
    a.actor_id,
    a.first_name,
    a.last_name
from film_actor fa
join actor a
on fa.actor_id = a.actor_id;

-- Corrected query (syntax errors fixed)
select 
    a.actor_id,
    a.first_name,
    fa.film_id
from actor a
join film_actor fa
on a.actor_id = fa.actor_id;
