-- String function
-- Use the sakila database
USE sakila;

-- View all data from actor table
select * from actor;

-- Convert first_name to lowercase
select first_name, LOWER(first_name) FROM actor;

-- length() shows the number of bytes in the string
select first_name, LENGTH(first_name) FROM actor;

-- LENGTH() returns length in bytes
-- English character like 'a' = 1 byte

-- Dummy table example: simple arithmetic
select 1 + 2 from dual;

-- LENGTH() with strings
select length('hi') FROM dual; 
     -- output: 2, each char 1 byte
     
select length('拼') FROM dual;   
   -- output: 3, because '拼' is a multibyte character in UTF-8

-- CHAR_LENGTH() returns number of characters
select CHAR_LENGTH('Rahul') FROM dual;  -- 5
select CHAR_LENGTH('拼') FROM dual;     -- 1
select CHAR_LENGTH('拼4') FROM dual;    -- 2

-- CONCAT() example
select 'Rahul', 'verma', CONCAT('rahul', 'verma') FROM dual;

-- Concatenate first_name, last_name, actor_id
select first_name, last_name, actor_id,
       CONCAT(first_name, last_name, actor_id) AS full_info
from actor;

-- Add spaces manually between strings (Rahul verma1)
select first_name, last_name, actor_id,
       CONCAT(first_name, '  ', last_name, actor_id) AS full_info
from actor;

-- CONCAT_WS() automatically adds a separator (space here) (Rahul verma 1)
select first_name, last_name, actor_id,
       CONCAT_WS(' ', first_name, last_name, actor_id) AS full_info
from actor;

-- Add a different separator, e.g., dollar sign (Rahul$verma$1)
select first_name, last_name, actor_id,
       CONCAT_WS('$', first_name, last_name, actor_id) AS full_info
from actor;

-- Add a different separator, e.g., underscore (Rahul_verma_1)
select first_name, last_name, actor_id,
       CONCAT_WS('_', first_name, last_name, actor_id) AS full_info
from actor;

-- LEFT() - returns left part of a string
 select first_name, LEFT(first_name, 2) AS left_two_chars from actor;
 
 
 -- RIGHT() - returns right part of a string 
 select first_name, RIGHT(first_name, 2) AS right_two_chars from actor;
 
 -- SUBSTRING() - returns substring from position 
 select first_name, SUBSTRING(first_name, 2, 3) AS sub_chars FROM actor;

-- REPLACE() - replaces a substring 
select first_name, REPLACE(first_name, 'a', '@') AS replaced_name FROM actor;

-- TRIM() - removes leading and trailing spaces 
select CONCAT(' ', first_name, ' ') AS with_spaces, TRIM(CONCAT(' ', first_name, ' ')) AS trimmed_name FROM actor;

-- LOCATE() - find position of substring
 select first_name, LOCATE('a', first_name) AS position_of_a FROM actor;

-- REVERSE() - reverses the string 
select first_name, REVERSE(first_name) AS reversed_name FROM actor;

-- SPACE() - generate a string with N spaces 
select first_name, CONCAT(first_name, SPACE(3), last_name) AS spaced_name FROM actor;

-- Explanation of added string functions with examples:

-- LEFT(str, n) -> returns the first n characters from str
-- Example:
select first_name, LEFT(first_name, 2) AS left_two_chars FROM actor;

-- RIGHT(str, n) -> returns the last n characters from str
select first_name, RIGHT(first_name, 2) AS right_two_chars FROM actor;

-- SUBSTRING(str, pos, len) -> returns substring starting at pos of length len
select first_name, SUBSTRING(first_name, 2, 3) AS sub_chars FROM actor;

-- REPLACE(str, from_str, to_str) -> replaces all occurrences of from_str with to_str
select first_name, REPLACE(first_name, 'a', '@') AS replaced_name FROM actor;

-- TRIM(str) -> removes leading and trailing spaces from str
select CONCAT('  ', first_name, '  ') AS with_spaces, TRIM(CONCAT('  ', first_name, '  ')) AS trimmed_name FROM actor;

-- LOCATE(substr, str) -> returns the position of substr in str
select first_name, LOCATE('a', first_name) AS position_of_a FROM actor;

-- REVERSE(str) -> reverses the string
select first_name, REVERSE(first_name) AS reversed_name FROM actor;

-- SPACE(n) -> generates a string with n spaces
select first_name, CONCAT(first_name, SPACE(3), last_name) AS spaced_name FROM actor;
