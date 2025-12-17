-- SQl (Structured Query Language)
-- Lecture 01 (09/12/2025)
-- Sql is a language used to communicate with databases.
-- Sql is used to store,retrive,
 -- update and delete in a Database 
 -- It is case-insensitive language;
 
-- DBMS(Database Management System)
-- It is Software that we will use to store process
-- update the data in digital format.

 /*
 Types of SQL
 1. DDl : DATA DEFINATION LANGUAGE:- Used to define or change
		database structure, (work on schema/structure)
        (CREATE, ALTER, DROP, TRUNCATE, RENAME)
 2. DML : DATA MANIPULATION LANGUAGE:- Used to (INSERT, UPDATE, DELETE)
          (Change data inside table)
 3. DCL : DATA CONTROL LANGUAGE:- Used to control access and permission.
          (Grant, REVOKE) Used for security
 4. TCL : TRANSACTION CONTROL LANGUAGE:- Used to manage transaction
          (COMMIT, ROLLBACK, SAVEPOINT) Ensure data consistency(ACID)
 5. DQL : DATA QUERY LANGUAGE:- Used to fetch data
          (SELECT) Most frequently used SQL Types
 */
 -- to display all databases in MySQL
SHOW DATABASES;

 
 -- to create a database(to organize data)
 create database tata;
 
 -- to utilize the database for which data will be stored 
 use tata;
 
 -- to see tables 
 show tables;
 
 -- create a table named nexon with price and color
CREATE TABLE nexon (
    price INT,
    color CHAR(20)
);

-- show all tables in the current database
SHOW TABLES;

-- now we will use a random database to learn DQL
-- download the world database from Chrome and use the .sql file
-- then click on SQL script and execute it
USE world;

-- show all tables in world database
SHOW TABLES;

-- to see the columns of the table 'country'
DESCRIBE country;

-- print all columns and all rows from country table
SELECT * FROM country;

-- to see specific columns
-- you can print columns in any order
SELECT name, population, region 
FROM country;

-- performing mathematical operation on a column
SELECT name, population, region, population - 500 
FROM country;

-- note:
-- data is fetched in SQL row by row

-- display all data from country table
SELECT * FROM country;

-- data is case-sensitive (string values)
-- to filter records we use WHERE clause
SELECT * 
FROM country 
WHERE continent = 'Asia';

-- filter data based on independence year
select * from country 
where indepyear = 1984;

/*  Learning Assignment (09/10/2025)

-> What is Database:
A database is a structured collection of data stored in a computer
so that it can be quickly retrieved and managed.
OR
A database is a place where data is stored, organized, and managed
so it can be easily found and used.

------------------------------------------------------------

-> File System vs DBMS:

File System:
- Data is stored in files (text files, excel, etc.)
- High data redundancy (duplicate data)
- Low data security
- Difficult to search and update data
- No proper backup and recovery
- Used for small applications

DBMS:
- Data is stored in databases
- Data redundancy is minimized
- High data security
- Easy searching, updating, and deleting of data
- Backup and recovery available
- Used for large applications

------------------------------------------------------------

-> DBMS vs RDBMS:

DBMS:
- Stores data in file format
- Does not support relationships between tables
- Supports small amount of data
- Example: File-based DBMS

RDBMS:
- Stores data in tables (rows and columns)
- Supports relationships using primary key and foreign key
- Supports large amount of data
- Follows relational model
- Example: MySQL, Oracle, SQL Server

------------------------------------------------------------

-> Types of DBMS (Brief):

1) Hierarchical DBMS:
- Data is organized in tree structure
- One parent can have many children
- Example: IMS

2) Network DBMS:
- Data is organized using graph structure
- Many-to-many relationships allowed
- Example: IDMS

3) Relational DBMS (RDBMS):
- Data is stored in tables (rows and columns)
- Uses SQL for data access
- Most widely used DBMS
- Example: MySQL, Oracle

4) Object-Oriented DBMS (OODBMS):
- Data is stored as objects
- Supports classes, objects, inheritance
- Used in complex applications
- Example: ObjectDB

------------------------------------------------------------
*/

