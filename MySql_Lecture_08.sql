
-- SAKILA DATABASE : JOINS PRACTICE

-- sakila database use kar rahe hain
use sakila;

-- -------------------------------------
-- Actor table ka data
select * from actor;

-- Total unique actors count
select count(distinct actor_id) 
from actor;

-- film_actor table ka data
select * from film_actor;

-- Actor ke first name aur actor_id
-- Jo film_actor table me present hain
select a.first_name, a.actor_id
from actor as a
join film_actor as fa
ON a.actor_id = fa.actor_id;


-- film_actor se actor_id aur film_id
select fa.actor_id, fa.film_id
from film_actor as fa;


-- Same data (order changed)
select fa.film_id, fa.actor_id
from film_actor AS fa;


-- Film table ka data
select * from film;

-- Actor, Film_actor tables dubara dekhna
select * from actor;
select * from film_actor;

-- Table structure check karna
desc film_actor;
desc film;

-- Film table ka data
select * from film;

-- Film_actor + Film join
-- Film id ke basis par
select 
    fa.film_id,
    fa.actor_id,
    f.film_id,
    f.title
from film_actor as fa
join film as f
ON fa.film_id = f.film_id;

-- 
-- ACTOR NAME + MOVIE NAME

-- Actor table
select * from actor;

-- Film table
select * from film;

-- Film_actor table
select * from film_actor;

-- Actor name aur movie title
-- 3 tables ka INNER JOIN
select 
    a.actor_id,
    fa.film_id,
    a.first_name,
    f.title
from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on f.film_id = fa.film_id;
