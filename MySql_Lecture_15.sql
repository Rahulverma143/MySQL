-- ================================
-- MULTI ROW SUBQUERY
-- ================================
-- A multi-row subquery is a subquery that returns MORE THAN ONE ROW


--  Use sakila database
use sakila;

--  Display all records from payment table
select * from payment;


--  Get the amount for payment_id = 2 or payment_id = 3
select amount  from payment 
where payment_id = 2 or payment_id = 3;

-- ================================
-- IN OPERATOR
-- ================================
-- IN matches ANY value returned by the subquery

-- Get all payment details whose amount
-- matches amount of payment_id 2 or 3
select *  from payment where amount in (
select amount  from payment 
where payment_id = 3 or payment_id = 2
);


-- ================================
-- NOT IN OPERATOR
-- ================================
-- NOT IN excludes values returned by subquery

-- Get all payment details whose amount
-- does NOT match amount of payment_id 2 or 3
select * from payment where amount not in (
select amount from payment 
where payment_id = 3 or payment_id = 2 );


-- ================================
-- ANY OPERATOR
-- ================================
-- ANY means compare with AT LEAST ONE value

-- Q5. Get all payment details where amount
-- is equal to ANY amount of payment_id 2 or 3
select * 
from payment 
where amount = any (
    select amount 
    from payment 
    where payment_id = 3 or payment_id = 2
);
--  Get all payment details where amount
-- is greater than ANY amount of payment_id 2 or 3
-- (greater than the smallest value)
select * from payment  where amount > any (
select amount from payment 
where payment_id = 3 or payment_id = 2 );

-- Get all payment details where amount
-- is LESS than ANY amount of payment_id 2 or 3
-- (less than the largest value)
select * from payment  where amount < any (
select amount from payment 
where payment_id = 3 or payment_id = 2 );

-- ================================
-- ALL OPERATOR
-- ================================
-- ALL means compare with EVERY value

--  Get all payment details where amount
-- is GREATER than ALL amounts of payment_id 2 or 3
-- (greater than the maximum value)
select *  from payment where amount > all (
select amount  from payment 
where payment_id = 3 or payment_id = 2 );

-- Get all payment details where amount
-- is less than ALL amounts of payment_id 2 or 3
-- (less than the minimum value)
select * from payment 
where amount < all (
select amount  from payment 
where payment_id = 3 or payment_id = 2 );


-- ================================
-- SUBQUERY WITH DATE FUNCTION
-- ================================

-- Get the month of payment for payment_id 2 or 3
select month(payment_date)  from payment 
where payment_id = 2 or payment_id = 3;

-- Get all payment details where payment month
-- is SAME as the month of payment_id 2 or 3
select * from payment 
where month(payment_date) in (
select month(payment_date)  from payment 
where payment_id = 2 or payment_id = 3 );

-- ================================
-- RANGE BASED MULTI ROW SUBQUERY
-- ================================

-- Get amounts for payment_id between 2 and 8
select amount from payment 
where payment_id between 2 and 8;


--  Get all payment details where amount
-- is GREATER than ALL amounts from payment_id 2 to 8
select *  from payment 
where amount > all (
select amount from payment 
where payment_id between 2 and 8 );


-- ================================
-- ASSIGNMENT (THEORY)
-- ================================

-- ============================================
-- Q1. What is a CORRELATED SUBQUERY?
-- =============================================
-- A correlated subquery is a subquery that depends on
-- the values of the outer query.
-- The subquery cannot run independently.
-- It is executed ONCE for EACH row processed by the outer query.

-- ============================================
-- Q2. How is a CORRELATED SUBQUERY executed?
-- ============================================
-- Execution Steps:
-- Step 1: Outer query picks ONE row
-- Step 2: Subquery runs using value from outer query
-- Step 3: Result is compared
-- Step 4: If condition is TRUE → row is selected
-- Step 5: Repeat for next row of outer query
-- ============================================
-- Q3. What are CONSTRAINTS in SQL?
-- ============================================
-- Constraints are RULES applied on table columns
-- to ensure DATA INTEGRITY and ACCURACY.

-- They restrict what kind of data can be inserted,
-- updated or deleted from a table.

-- ============================================
-- Q4. Types of SQL Constraints with Explanation
-- ============================================

-- 1. NOT NULL Constraint
-- Ensures column cannot have NULL value

-- 2. UNIQUE Constraint
-- Ensures all values in column are different

-- 3. PRIMARY KEY Constraint
-- Combination of NOT NULL + UNIQUE
-- Uniquely identifies each row

-- 4. FOREIGN KEY Constraint
-- Links one table to another table's PRIMARY KEY

-- 5. CHECK Constraint
-- Ensures value satisfies a condition

-- 6. DEFAULT Constraint
-- Sets a default value if no value is provided

-- 7. AUTO_INCREMENT (MySQL specific)
-- Automatically increases numeric value

