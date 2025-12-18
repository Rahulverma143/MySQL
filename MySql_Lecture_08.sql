-- 17/12/2025
-- sakila database use karo
use sakila;

-- saare tables dikhao
show TABLES;

-- payment table ka pura data dikhao
select * from payment;

-- kitni baar amount = 2.99 aaya hai, uska count
select count(*) FROM payment where amount = 2.99;

-- har amount ke liye kitni baar transaction hua hai
select amount, count(*) from payment group by amount;

 
 select customer_id, sum(amount) from payment
 group by customer_id;
 
  select customer_id, sum(amount) from payment where
amount>3 group by customer_id;

-- payment table ka saara data dikhao
select * from payment;
-- you need to find total transaction of done by each customer
 -- month of may 
 -- May month (5) ke saare payments dikhao
 select customer_id, amount, payment_date, month(payment_date) from payment
 where month(payment_date) = 5;
 
 -- May month me har customer ne kitne transactions kiye (total transactions)

  select customer_id,  count(amount) from payment
 where month(payment_date) = 
 5 group by customer_id;
 
-- May month (month = 5) ke saare payments dikhao
select * from payment 
where month(payment_date) = 5;

-- payment table ka saara data dikhao
select * from payment;

 
 --  you need to find out the maximun  amount 
 of transaction the average transaction amount 
 and the total transaction amount
  done true each staff -- 
 
 
-- har staff ke liye max, average aur total transaction amount nikaalne ke liye
select staff_id, max(amount),     -- sabse bada payment
avg(amount),     -- average payment
sum(amount)     -- total payment
from payment
group by staff_id;                      -- staff_id ke hisaab se group


-- har staff ke liye max, avg aur total payment nikaalo
select staff_id, 
    max(amount),   -- sabse bada payment
    avg(amount),  -- average payment
    sum(amount) -- total payment
from payment
group by staff_id
order by staff_id;    -- staff_id ke order me dikhao

-- sirf even customer_id wale payments dikhao
select * from payment where customer_id%2=0;

-- staff_id = 1 ke liye
-- har amount par kitni baar payment hui (total transactions)
-- sirf wahi amounts dikhao jinki total transactions 30 se zyada ho

select amount, count(*) 
from payment
where staff_id = 1          -- sirf staff id 1 ke payments
group by amount             -- amount ke hisaab se group
having count(*) > 30;       -- jinka transaction count 30 se zyada ho


-- 1. find out the number of customer served along with 
-- average amount and the total amount spend in each month 
-- for satff_id1 and staff_id 2 
-- payment table ka saara data dikhao
select * from payment;
-- staff_id 1 aur 2 ke liye
-- har month me kitne customers aaye (count)
select extract(month from payment_date),
count(customer_id) AS total_customers
from payment
where staff_id IN (1, 2)
group by EXTRACT(month from payment_date);

-- staff_id 1 aur 2 ke liye
-- har month me customer count, total amount aur average amount

select month(payment_date),
count(customer_id),sum(amount),avg(amount)
from payment
where staff_id IN (1, 2)
group by month(payment_date);

-- Question 2
-- staff_id 1 aur 2 ke liye
-- har year aur month me
-- total customers count, total amount aur average amount

select YEAR(payment_date),
month(payment_date), count(customer_id),
sum(amount), avg(amount) 
from payment
where staff_id IN (1, 2)             -- sirf staff 1 aur 2
group by  year(payment_date), month(payment_date);

-- ORDER BY ka use data ko sort (arrange) karne ke liye hota hai

-- amount ke hisaab se sort (default ASC = chhote se bade)
select * from payment order by amount;

-- customer_id ke hisaab se sort
select * from payment order by customer_id;

-- pehle customer_id ke hisaab se sort
-- agar customer_id same ho to amount ke hisaab se sort
select * from payment order by customer_id, amount;


-- pehle customer_id ke hisaab se sort (ASC default)
-- phir amount ko bade se chhote order me sort
 select * from payment order by customer_id,
 amount desc;
 
 -- pehle customer_id ko bade se chhote order me sort
-- phir amount ko chhote se bade order me sort (ASC default)
 select * from payment order by customer_id 
 desc, amount;
 






