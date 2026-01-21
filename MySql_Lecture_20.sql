-- -------------------------
-- Create table: events
-- -------------------------
Use regex;
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

-- Total quantity sold per event_id
select event_id, sum(qty) as total_qty
from ticket_sales
group by event_id;

-- Total revenue per event_id
select event_id,
       sum(qty * price_per_ticket) as total_revenue
from ticket_sales
group by event_id;

-- Monthly total revenue
select month(sale_date) as sale_month,
       sum(qty * price_per_ticket) AS total_revenue
from ticket_sales
group by month(sale_date)
order by sale_month;

-- Maximum price_per_ticket per event_id
select event_id,
       MAX(price_per_ticket) AS max_price
from ticket_sales
group by event_id;

-- Total revenue per month and ticket_type
select month(sale_date) as sale_month,
       ticket_type,
       sum(qty * price_per_ticket) as total_revenue
from ticket_sales
group by month(sale_date), ticket_type
order by sale_month;

-- List all sales with event_name and sale_date
select ts.sale_id, e.event_name, ts.sale_date
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Show event_name, ticket_type, qty for each sale
select e.event_name, ts.ticket_type, ts.qty
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Sales where event city is Mumbai
select ts.sale_id, e.event_name, e.city, ts.sale_date
from ticket_sales ts
join events e ON ts.event_id = e.event_id
where e.city = 'Mumbai';

-- Show all events and matching sales (LEFT JOIN)
select e.event_name, ts.sale_id, ts.sale_date
from events e
left join ticket_sales ts ON e.event_id = ts.event_id;

-- Distinct event names that have at least one sale
select DISTINCT e.event_name
from events e
join ticket_sales ts on e.event_id = ts.event_id;

-- Each sale’s computed revenue with event name
select ts.sale_id,
       e.event_name,
       ts.qty * ts.price_per_ticket AS revenue
from ticket_sales ts
join events e on ts.event_id = e.event_id;

-- Total quantity per event_name
select e.event_name, SUM(ts.qty) AS total_qty
from ticket_sales ts
join events e on ts.event_id = e.event_id
group by e.event_name;

-- Total VIP revenue per event_name
select e.event_name,
       SUM(ts.qty * ts.price_per_ticket) AS vip_revenue
from ticket_sales ts
join events e on ts.event_id = e.event_id
where ts.ticket_type = 'VIP'
group by e.event_name;

-- Monthly revenue per city
select e.city,
       month(ts.sale_date) AS sale_month,
       sum(ts.qty * ts.price_per_ticket) AS total_revenue
from ticket_sales ts
join events e on ts.event_id = e.event_id
group by e.city, month(ts.sale_date)
order by e.city, sale_month;

-- Total quantity per city and ticket_type
select e.city, ts.ticket_type, sum(ts.qty) as total_qty
from ticket_sales ts
join events e ON ts.event_id = e.event_id
group by e.city, ts.ticket_type;

-- Sales on the latest sale_date
select *
from ticket_sales
WHERE sale_date = (SELECT MAX(sale_date) FROM ticket_sales);

-- Sales where revenue > overall average sale revenue
SELECT sale_id, event_id,
       qty * price_per_ticket AS revenue
FROM ticket_sales
WHERE (qty * price_per_ticket) >
      (SELECT AVG(qty * price_per_ticket) FROM ticket_sales);

-- Events that have at least one VIP sale
SELECT DISTINCT e.event_id, e.event_name
FROM events e
JOIN ticket_sales ts ON e.event_id = ts.event_id
WHERE ts.ticket_type = 'VIP';

-- Events in cities that have at least one VIP sale
SELECT DISTINCT e.event_id, e.event_name, e.city
FROM events e
WHERE e.city IN (
    SELECT DISTINCT e2.city
    FROM events e2
    JOIN ticket_sales ts ON e2.event_id = ts.event_id
    WHERE ts.ticket_type = 'VIP'
);

-- Events with at least one sale in February 2025
SELECT DISTINCT e.event_id, e.event_name, e.city
FROM events e
JOIN ticket_sales ts ON e.event_id = ts.event_id
WHERE ts.sale_date BETWEEN '2025-02-01' AND '2025-02-28';

-- Months with at least 3 sales rows
Select MONTH(sale_date) AS sale_month,
       COUNT(*) AS sales_rows
from ticket_sales
GROUP BY MONTH(sale_date)
HAVING COUNT(*) >= 3;




