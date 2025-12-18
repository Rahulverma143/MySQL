-- Operator
-- =, <, >, !=, <> operators ka use

-- database choose karo
use sakila;

-- actor table ka sara data dikhaye
select * from actor;

-- actor_id 2 wale actor ko dikhaye
select * from actor where actor_id = 2;

-- actor_id 2 ke alawa sare actors dikhaye
select * from actor where actor_id != 2;

-- actor_id 2 se chhote actors dikhaye
select * from actor where actor_id < 2;

-- actor_id 2 se bade actors dikhaye
select * from actor where actor_id > 2;

-- actor_id 2 ke alawa sare actors dikhaye (<> bhi not equal ke liye hota hai)
select * from actor where actor_id <> 2;

-- BETWEEN, IN operators ka use
-- BETWEEN operator
-- ye operator use hota hai to get values within a range
-- example: actor_id 2 se 5 ke beech wale actors
-- show actors whose actor_id is between 2 and 5 (inclusive)

select * from actor where actor_id between 2 and 5;

-- show karo actors jinka actor_id 2 se 5 ke beech nahi hai
select * from actor where actor_id not between 2 and 5;

-- IN operator
-- ye operator use hota hai to get values from specific list
-- example: actor_id sirf 2 ya 5 wale actors
select * from actor where actor_id in (2, 5);

-- show karo actors jinka actor_id 2 ya 5 nahi hai
select * from actor where actor_id not in (2, 5);


