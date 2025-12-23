-- JOIN CONCEPT 
-- JOIN ka use 2 ya zyada tables ka data combine karne ke liye hota hai
-- jab tables ke beech common column (foreign key) ho.
-- 1 INNER JOIN
-- Sirf matching records deta hai
SELECT *
FROM tableA A
INNER JOIN tableB B
ON A.id = B.id;

-- 2 OUTER JOIN
-- Matching + Non-matching records deta hai
-- Types of OUTER JOIN:
-- -> LEFT OUTER JOIN
-- -> RIGHT OUTER JOIN
-- -> FULL OUTER JOIN

-- i> LEFT OUTER JOIN
-- Left table ke saare records-- 
SELECT *
FROM tableA A
LEFT JOIN tableB B
ON A.id = B.id
-- Saare actors chahiye, film ho ya na ho

-- ii> RIGHT OUTER JOIN
-- Right table ke saare records
SELECT *
FROM tableA A
RIGHT JOIN tableB B
ON A.id = B.id;
-- Saari films chahiye, actor ho ya na ho

-- iii> FULL OUTER JOIN
-- Dono tables ke saare records
-- ❗ MySQL me direct support ❌
SELECT *
FROM tableA A
LEFT JOIN tableB B
ON A.id = B.id
UNION
SELECT *
FROM tableA A
RIGHT JOIN tableB B
ON A.id = B.id;

-- 3 NATURAL JOIN
-- Same name & same datatype column par automatic join
SELECT *
FROM tableA
NATURAL JOIN tableB;
-- Risky (column name change ho jaye to issue)

-- 4 CROSS JOIN
-- Cartesian product
-- Har row × har row

SELECT *
FROM tableA
CROSS JOIN tableB;
-- Mostly testing / combinations ke liye

-- 5 SELF JOIN
-- Table khud se hi join hoti hai
SELECT A.name, B.name
FROM employee A
JOIN employee B
ON A.manager_id = B.emp_id;

-- INNER JOIN → common data
-- LEFT JOIN → left table important
-- RIGHT JOIN → right table important
-- FULL JOIN → sab chahiye
-- film_actor → junction table (many-to-many)
-- --------------------------------------------------------------------------
-- INNER JOIN
-- INNER JOIN sirf wahi records deta hai
-- jahan dono tables me matching data hota hai.
-- Is file me ye query INNER JOIN ka example hai:

-- actor  -> film_actor -> film

-- Matlab:
-- 1. Actor ka actor_id film_actor table me hona chahiye
-- 2. Film ka film_id film_actor table me hona chahiye
--
-- Agar actor ne kisi film me kaam nahi kiya:
-- ❌ wo output me nahi aayega
--
-- Agar film ka koi actor mapped nahi hai:
-- ❌ wo bhi output me nahi aayegi
--
-- INNER JOIN ka use tab hota hai
-- jab sirf common / matching data chahiye

-- =========================
-- OUTER JOIN
-- =========================
-- OUTER JOIN un records ko bhi dikhata hai
-- jo match nahi karte
--
-- Outer join ke 3 types hote hain:
-- 1. LEFT OUTER JOIN
-- 2. RIGHT OUTER JOIN
-- 3. FULL OUTER JOIN

-- =========================
-- LEFT OUTER JOIN
-- =========================
-- LEFT JOIN me:
-- Left table ke saare records aate hain
-- Right table ke sirf matching records aate hain
--
-- Agar right table me match nahi mila:
-- to uski columns NULL hoti hain
--
-- Sakila example:
-- Agar koi actor hai jiska entry film_actor me nahi hai,
-- to bhi actor output me aayega
-- lekin film related columns NULL hongi
--
-- LEFT JOIN tab use hota hai
-- jab LEFT table zyada important ho

-- ------------------------------------------
-- RIGHT OUTER JOIN
-- ------------------------------------------
-- RIGHT JOIN me:
-- Right table ke saare records aate hain
-- Left table ke sirf matching records aate hain
--
-- Agar left table me match nahi mila:
-- to left table ki columns NULL hoti hain
--
-- Sakila example:
-- Saari films aayengi
-- chahe unka actor ho ya na ho
--
-- RIGHT JOIN tab use hota hai
-- jab RIGHT table zyada important ho

-- =========================
-- FULL OUTER JOIN
-- =========================
-- FULL JOIN me:
-- Left table ke saare records
-- + Right table ke saare records
--
-- Match ho ya na ho, sab aata hai
--
-- NOTE:
-- MySQL me FULL OUTER JOIN directly supported nahi hota
-- Iske liye LEFT JOIN + RIGHT JOIN ko UNION karte hain

-- =========================
-- SHORT SUMMARY (Yaad rakhne ke liye)
-- =========================
-- INNER JOIN  -> sirf matching data
-- LEFT JOIN   -> left table full
-- RIGHT JOIN  -> right table full
-- FULL JOIN   -> dono table full
--
-- film_actor ek JUNCTION TABLE hai
-- jo actor aur film ke beech
-- MANY TO MANY relationship handle karta hai
