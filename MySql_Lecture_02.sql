-- Lecture02

-- choose the database
use world;

-- show all tables
show tables;

-- show all data from country table
select * from country;

-- show countries from Asia
select * from country where continent = 'Asia';

-- show countries independent in 1991
SELECT * from country where indepyear = 1991;

-- show selected columns for year 1991
select name, continent, indepyear 
from country 
where indepyear = 1991;

-- show countries from Africa
select * from country where continent = 'Africa';

-- show countries from Asia using IN
select * from country where continent IN ('Asia');

-- show countries independent in 1960 or 1991
select * from country where indepyear IN (1960, 1991);

-- show countries independent between 1960 and 1991
select * from country 
WHERE indepyear BETWEEN 1960 AND 1991;

-- show countries NOT independent between 1960 and 1991
select * from country 
WHERE indepyear NOT BETWEEN 1960 AND 1991;




WHERE indepyear = 1991;

-- show countries from Africa
select * from country where continent = 'Africa';

-- show countries from Asia (using IN)
select * from country where continent IN ('Asia');

-- show countries with year 1960 or 1991
select * from country where indepyear IN (1960, 1991);


-- Question 1
-- show country names where region is NOT South Europe
select name from country 
where region != 'South Europe';

-- Question 2
-- show name, population and population increased by 10%
select name, population, population * 1.1 AS increased_population
from country;

-- Question 3
-- show countries where life expectancy is 75.1 or 77.8
select * 
from country 
where lifeexpectancy IN (75.1, 77.8);

-- Question 4
-- show countries where population is NOT between 5000 and 500000
select name, population, region 
from country
where population not between 5000 and 500000;

-- LIKE operator
-- used to match a pattern

-- name pattern: letter start, letter include, letter end
-- %  : wildcard character
-- %  : zero or more characters

-- names starting with 'A'
select name from country where name like 'A%';

-- names ending with 'A'
select name from country where name like '%A';

-- names having 'A' anywhere
select name from country where name LIKE '%A%';

-- names starting with 'United'
select name from country where name LIKE 'United%';

-- show countries where name starts with 'An'
select * from country where name LIKE 'An%';

-- show countries where name ends with 'a'
select  * from country where name like '%a';

-- show countries where name has 'r' anywhere
select  * from country where name like '%r%';

-- show countries where name has 'ru' anywhere
select  * from country where name like '%ru%';

-- show countries where name does NOT have 'ru'
select * from country where name not like '%ru%';

-- underscore (_) : matches exactly 1 character

-- name starts with I
select * from country where name like 'I%';

-- name starts with Ir
select * from country where name like 'Ir%';

-- name starts with Ir and has exactly 3 letters
select * from country where name like 'Ir_';

-- name starts with Ira and has exactly 4 letters
select * from country where name like 'Ira_';

-- name has exactly 4 letters
select * from country where name like '____';

-- name has u as 2nd letter and total 4 letters
select * from country where name like '_u__';

-- name has u as 2nd letter, 5+ letters
select * from country where name like '_u%__';

-- name has u as 2nd letter, 3+ letters
select * from country where name like '_u_%';

-- name has ua as first 2 letters after first letter
select * from country where name like '_ua%';


-- Question 1
-- show countries where name starts with 'A'
select * from country where name like 'A%';

-- Question 2
-- show countries where name ends with 'P' followed by any one letter
select * from country where name like '%P_';

-- Question 3
-- show countries where second letter is 'A' and last letter is 'a'
select * from country where name like '_A%_a';

-- Question 4
-- show countries with exactly 4 letters in name
select * from country where name like '____';

-- name has u as 2nd letter, and a anywhere after that
select * from country where name like '_u%a%';


