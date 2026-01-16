# SQL DDL, DML, Joins & Window Functions (Interview Notes)
 -- 1. Create Table Using SELECT (CTAS)

 -- Create a new table using data from an existing table.

use regex;
drop table if exists actor_cp;

create table actor_cp as
select first_name as fname,
       last_name  as lname
from sakila.actor
where actor_id between 10 and 14;


 -- 2. DDL vs DML Commands

### DDL (Data Definition Language)

-- Used to define or modify database structure.

-- CREATE → Creates a new database object (table, view, index)
-- DROP → Removes the object permanently
-- ALTER → Modifies structure (add/modify constraints, columns)
-- TRUNCATE → Deletes all data but keeps structure

-- DDL commands cannot be rolled back** (auto-commit).



--  DML (Data Manipulation Language)

-- Used to manage data inside tables.

 -- INSERT → Add data
 -- UPDATE → Modify data
 -- DELETE → Remove data

-- DML commands can be rolled back** (if transaction not committed).

-- 3. Difference Between DROP, DELETE, and TRUNCATE

-- | Feature           | DROP          | DELETE    | TRUNCATE      |
-- | ----------------- | ------------- | --------- | ------------- |
-- | Type              | DDL           | DML       | DDL           |
-- | Removes Data      | Yes           | Yes       | Yes           |
-- | Removes Structure | Yes           | No        | No            |
-- | WHERE Condition   | ❌ Not allowed | ✅ Allowed | ❌ Not allowed |
-- | Rollback          | ❌ No          | ✅ Yes     | ❌ No          |
-- | Speed             | Fast          | Slow      | Very Fast     |


-- 4. What is a Database Object?

-- What is an object in SQL?

-- An object is a structure used to store, manage, and reference data.



-- * Table
-- * View
-- * Index
-- * Procedure
-- * Function


-- 5. GROUP BY Clause

-- What is GROUP BY in SQL?

-- The `GROUP BY` clause groups rows with the same values and applies aggregate functions on each group.

-- Example

-- sql
SELECT continent, SUM(population)
FROM country
GROUP BY continent;

-- Used with:
-- SUM()
-- COUNT()
-- AVG()
-- MIN()
-- MAX()

-- 6. SQL Joins

-- What are SQL Joins?

-- SQL Joins are used to combine rows from two or more tables based on a related column.

-- Common joins:
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN


-- 7. Window Function (WF)----------------------

-- What is a Window Function?

-- A Window Function performs calculations across a set of rows related to the current row **without grouping the result**.

 -- Unlike GROUP BY, window functions do **not merge rows**.

-- 8. OVER() Clause
--  What is OVER()

-- OVER() defines the window (set of rows) on which the function operates.

-- Example

-- Sql
SELECT code, name, continent, population,
       SUM(population) OVER() AS total_population
FROM country;

-- 9. Aggregate vs Window Function

-- Aggregate (single row result)
select SUM(population) FROM country;

-- Window Function (result on each row)
SELECT code, name, population,
       SUM(population) OVER()
FROM country;

-- 10. PARTITION BY

-- What is PARTITION BY?

-- `PARTITION BY` divides rows into groups so the window function works separately on each group.

--  Similar to `GROUP BY` but does **not reduce rows**.

-- Example

SELECT code, name, continent, population,
       SUM(population) OVER (PARTITION BY continent) AS continent_population
FROM country;

-- 11. OVER() vs PARTITION BY

-- * `OVER()` → Applies calculation to all rows
-- * `OVER(PARTITION BY column)` → Applies calculation within each group

-- ## 12. Running Sum / Cumulative Sum (Interview Question)

--  Find running total of population.

SELECT code, name, continent, population,
       SUM(population) OVER (ORDER BY population) AS running_sum
FROM country;


-- `ORDER BY` inside `OVER()` is mandatory for running/cumulative calculations.


-- 13. Window Function Components

-- A window function has **3 parts**:

-- 1. Function → `SUM()`, `AVG()`, `ROW_NUMBER()`
-- 2. `OVER()` clause
-- 3. Optional:

   -- `PARTITION BY`
   -- `ORDER BY`


-- 14. Final Summary

-- * `GROUP BY` → Merges rows
-- * `WINDOW FUNCTION` → Keeps all rows
-- * `PARTITION BY` → Group logic without merging
-- * `ORDER BY` → Required for ranking & running totals

