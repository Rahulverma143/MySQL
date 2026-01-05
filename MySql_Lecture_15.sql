-- 05/01/2026
--  Today Topic is Subquerry      
-- What is a Subquery?
-- A subquery (also called an inner query or nested query) is a query inside another SQL query.
 -- It is enclosed in parentheses () and is used to compute a value that the outer query can use.
 
 -- Where Subquery is used
 -- Subquery is used to access data based on the condition
 -- Subquery is used to filter the as per the conditions as outer query
 -- It is used to filter or apply calculation data based on dynamic conditions
 -- Types of Subqueries
-- 1. Single-row subquery
-- Returns one value. Used with =, <, > operators.

use sakila;
-- Payment table se saare records fetch karo.
select * from payment;

-- Payment table se sirf us payment ka record nikalo jiska payment_id = 4 ho.
select * from payment where payment_id=4; 
select amount from payment where payment_id=4;

-- Payment table se un sabhi payments ka record nikalo jinka amount = 0.99 ho.
select * from payment where amount=0.99;

-- Payment table se un sabhi payments ka record nikalo jinka amount,
 -- payment_id = 5 ke amount ke barabar ho (using nested query).
-- () <= nested Query 
select * from payment
 where amount=(select amount from payment where payment_id=5);

--  Payment table se payment_id aur amount nikalo jahan amount, payment_id = 23 ke amount ke barabar NA ho.
-- get the payment id and amount
-- where the amount is not equal to the amount of payment id is 23;


select amount from payment where payment_id=23;
-- Payment table se payment_id aur amount nikalo jahan amount, payment_id = 23 ke amount ke barabar NA ho. 
select payment_id, amount
from payment
where amount not  (select amount
    from payment
    where payment_id = 23
);

-- get the payment id coustomer id amount and paymnet date 

-- Payment table se payment_id, customer_id, amount aur payment_date nikalo.
select payment_id, customer_id, amount, payment_date
from payment;

-- where the month of payment should be same as a paymnet id 6 

select payment_id, customer_id, amount, payment_date
from payment where month(payment_date) = (
    select month(payment_date) from payment where payment_id = 6);
    
select month(payment_date) from payment where payment_id=6;

select * from payment where 
month(payment_date)=(select month(payment_date) from payment where payment_id=6);


-- get all the column from the paymnet table where the staff serving the customer 
-- should be same as of payment id 7

select staff_id from payment where payment_id = 7;

select * from payment where staff_id = 1;
select * from payment
where staff_id = (select staff_id from payment where payment_id = 7);

--  get all the paymnet inforantion where amount is same as of the 
-- highest amount from the paymnet table 
 
select max(amount) from payment;

select * from payment
where amount = (select max(amount) from payment);

-- get the amount on the total number of paymment done for each amount 
--  only for those paymnet whose amount is les than tha amount of rental id 1775

  
 select amount from payment where rental_id = 1775;
 
 select * from payment where amount<4.99;
 
 select amount, count(*) from payment
 where amount < (select amount from payment where rental_id = 1775) group by amount;
 
 -- get the month and total month amount spend only for those coustomer 
 -- whose month of paymnet is greater than customer id 1 and paymnet id 3 
 
 select month(payment_date) from payment where customer_id=1 and payment_id=3;
 
 select * from paymnet where month(payment_date)>6
 group by month(payment_date);
 
 select * from payment;
--  ------------------------------
 -- single row subquerry nested query => return 1 row only 
select month(payment_date), sum(amount) from payment
where month(payment_date)> (select month(payment_date) from payment
where customer_id=1 and payment_id=3) group by month(payment_date);
 
-- homework
 -- multi row sbquerry 
 -- in,  any , all operator 


SELECT 
    MONTH(payment_date) AS payment_month,
    SUM(amount) AS total_month_amount
FROM payment
WHERE MONTH(payment_date) > (
    SELECT GREATEST(
        (SELECT MONTH(payment_date) 
         FROM payment 
         WHERE customer_id = 1 
         LIMIT 1),
        (SELECT MONTH(payment_date) 
         FROM payment 
         WHERE payment_id = 3)
    )
)
GROUP BY MONTH(payment_date);
