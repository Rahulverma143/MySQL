-- 16/12/2025 : GROUP BY, WHERE, HAVING
-- Database : world

-- world database use kar rahe hain
use world;

-- Puri duniya ki total population
select sum(population)
from country;

-- Har continent me kitne countries hain
select continent, count(name)
from country
group by continent;

-- 1950 ke baad independent hue countries
-- continent wise count
select continent, COUNT(name)
from country
where indepyear > 1950
group by continent;

-- country table ka data
select * from country;

-- HAVING ka use GROUP BY ke baad hota hai
-- Sirf wahi continent jaha 30 se zyada countries hain
select continent, COUNT(name)
from country
group by continent
having count(name) > 30;

-- Difference between WHERE and HAVING
-- WHERE : row-level filter (GROUP BY se pehle)
-- HAVING : group-level filter (GROUP BY ke baad)

-- Har continent ki total population
select continent, sum(population)
from country
group by continent;

-- Sirf wahi continent jinki total population
-- 30,401,150 se zyada hai
select continent, SUM(population)
from country
group by continent
having sum(population) > 30401150;

-- Har year me kitne countries independent hue
select indepyear, count(name)
from country
group by indepyear;

-- 1950 ke baad har year me kitne countries independent hue
select indepyear, count(name)
from country
where indepyear > 1950
group by indepyear;

-- 1950 ke baad sirf wahi years
-- jaha 2 se zyada countries independent hue
select indepyear, count(name)
from country
where indepyear > 1950
group by indepyear
having count(name) > 2;

-- Government form ke according
-- kitne countries hain (count > 20)
select governmentform, COUNT(name)
from country
group by governmentform
having count(name) > 20;

-- Jaha capital id 30 se zyada hai
-- government form wise country count
select governmentform, COUNT(name)
from country
where capital > 30
group by governmentform;

-- Conditions:
-- Life expectancy > 38
-- Population > 300000 (3 lakh)
-- Continent wise count & total population
select 
    continent,
    count(name) as total_countries,
    sum(population) as total_population
from country
where lifeexpectancy > 38
  and population > 300000
group by continent
having sum(population) > 30;
