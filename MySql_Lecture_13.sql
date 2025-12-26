-- CASE WHEN PRACTICE (World DB)
-- CASE works like IF–ELSE logic
-- Syntax:
-- CASE
--   WHEN condition THEN result
--   WHEN condition THEN result
--   ELSE result
-- END

use world;

-- Display all columns from the country table
select * FROM country;

--  Show country name, population, and display 'No population'
--     when population is 0
select name, population,
case
  when population = 0 then 'No population'
end as status
from world.country;

--  Show country name, population, and categorize population
--     (Logical error example kept for learning)
select name, population,
case
  when population = 0 then 'No population'
  when population = 0 between 8000 and 70000 then 'Med population'
end as status
from world.country;

--  Show country name, population, and category
--     with ELSE condition added
select name, population,
case
  when population = 0 then 'No population'
  when population = 0 between 8000 and 70000 then 'Med population'
  else 'Condition is false'
end as status
from world.country;

-- Correct version: Categorize population properly
select name, population,
case
  when population = 0 then 'No population'
  when population between 8000 and 70000 then 'Med population'
  else 'Condition is false'
end as status
from world.country;

-- Count countries based on population category
select count(*) as total_countries,
case
  when population = 0 then 'No population'
  WHEN population between 8000 and 70000 then 'Med population'
  else 'Condition is false'
end as status
from world.country
group by status;

-- Show continent and population of all countries
select continent, population
from world.country;

--  Show continent, population, and TRUE
--     if population is between 8000 and 70000
select continent, population,
case
  when population between 8000 and 70000 then 'True'
end as status
from world.country;

--  Count countries per continent where
--     population is between 8000 and 70000 (using COUNT)
select continent,
count(
  case
    when population between 8000 and 70000 then 1
    else 0
  end
) as count_population_range
from world.country
group by continent;

--  Count countries per continent where
--      population is between 8000 and 70000 (using SUM)
select continent,
sum(
  case
    when population between 8000 and 70000 then 1
    else 0
  end
) as count_population_range
from world.country
group by continent;

--  Count countries in North America only
--      where population is between 8000 and 70000
select continent,
sum(
  case
    when continent = 'North America'
         and population between 8000 and 70000
    then 1
    else 0
  end
) as north_america_population_range
from world.country
group BY continent;

