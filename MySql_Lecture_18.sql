-- SQL DATA TYPES, DDL & DML

-- 1. NUMERIC DATA TYPES

-- Integer types in MySQL:
-- tinyint, smallint, mediumint, int, bigint

-- Size:
-- tinyint   -> 1 byte  (8 bits)
-- smallint  -> 2 bytes
-- mediumint -> 3 bytes
-- int       -> 4 bytes
-- bigint    -> 8 bytes
-----------------------

-- 1 byte = 8 bits => 2^8 = 256 values
-- Signed tinyint range: -128 to 127

use regex;

create table verma1 (
salary tinyint
);

insert into verma1 values (127);   -- valid
-- insert into verma1 values (128); -- ERROR: out of range

select * from verma1;

-- 2. FLOAT vs DOUBLE

-- FLOAT  : less precision (4 bytes)
-- DOUBLE : more precision (8 bytes)

create table verma2 (
salary float,
price  double
);

insert into verma2 values (100.68812441, 100.6781241);

select * from verma2;

-- 3. STRING DATA TYPES

-- CHAR     : fixed length
-- VARCHAR  : variable length

-- CHAR pads spaces, VARCHAR stores only actual characters

create table verma3 (
name   varchar(20),
gender char(10)
);

insert into verma3 values
('Rahul verma', 'male'),
('Sourabh', 'male'),
('anil', 'female');

insert into verma3 values ('pankaj        ', 'male          ');

select * from verma3;
select name, gender, length(name), length(gender) from verma3;
-- 4. DDL COMMANDS
-- CREATE, DROP, ALTER, TRUNCATE

create table raj1 (
col int
);

-- 5. CTAS (CREATE TABLE AS SELECT)


create table actor_cp as
select first_name as fname,
last_name  as lname
from sakila.actor;

select * from actor_cp;

-- DROP removes structure + data

drop table actor_cp;

create table actor_cp as
select first_name as fname,
last_name  as last
from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- 6. ALTER TABLE

-- Add column
alter table actor_cp add column salary int;

-- Add primary key
alter table actor_cp add constraint new_key primary key (fname);

-- Drop column
alter table actor_cp drop column last;

-- Rename column
alter table actor_cp rename column salary to newsalary;

-- Check structure
desc actor_cp;
-- 7. DML COMMANDS

-- INSERT, UPDATE, DELETE

SET SQL_SAFE_UPDATES = 0;

-- Update all rows
update actor_cp set newsalary = 9000;

-- Update specific row
update actor_cp set newsalary = 888 where fname = 'UMA';

select * from actor_cp;

