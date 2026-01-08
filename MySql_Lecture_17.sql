-- ===============================
-- SQL CONSTRAINTS & BASICS
-- ===============================

-- Q1. What are constraints in SQL?
-- Ans: Constraints are rules applied on table columns to restrict invalid data entry.

-- Q2. Why are constraints used in database tables?
-- Ans: To maintain data accuracy, integrity, and consistency.

-- Q3. What happens if inserted data violates a constraint?
-- Ans: The entire operation is aborted and data is not inserted.

-- Q4. Are constraints checked before or after data insertion?
-- Ans: Constraints are checked before inserting data into the table.

-- ===============================
-- DDL (Data Definition Language)
-- ===============================

-- Q5. What is DDL in SQL?
-- Ans: DDL is used to define or modify database structure.

-- Q6. Name all DDL commands.
-- Ans: CREATE, DROP, ALTER, TRUNCATE.

-- Q7. Difference between CREATE and DROP?
-- Ans: CREATE creates a database object, DROP permanently deletes it.

-- Q8. Difference between TRUNCATE and DELETE?
-- Ans: TRUNCATE removes all data without WHERE and cannot be rolled back,
--      DELETE removes data row-wise and can be rolled back.

use regex;

-- Q9. What does CREATE TABLE do?
-- Ans: It creates a new table in the database.

create table test1(sno int); 

-- Q10. What is the use of DESCRIBE command?
-- Ans: It shows table structure like column names, data types, and constraints.

describe test1;

-- ===============================
-- DML (Data Manipulation Language)
-- ===============================

-- Q11. What is DML in SQL?
-- Ans: DML is used to manipulate data inside tables.

-- Q12. Name all DML commands.
-- Ans: INSERT, UPDATE, DELETE, MERGE.

-- Q13. Difference between INSERT and UPDATE?
-- Ans: INSERT adds new records, UPDATE modifies existing records.

insert into test1 values(10);
select * from test1;

-- Q14. Can a column accept NULL if no constraint is applied?
-- Ans: Yes, by default columns allow NULL values.

insert into test1(sno) values(20),(null),(30);

-- Q15. Difference between COUNT(*) and COUNT(column)?
-- Ans: COUNT(*) counts all rows,
--      COUNT(column) counts only non-NULL values.

select count(sno), count(*) from test1;

-- ===============================
-- NOT NULL Constraint
-- ===============================

-- Q16. What is NOT NULL constraint?
-- Ans: It ensures that a column cannot store NULL values.

-- Q17. Can NULL be inserted into a NOT NULL column?
-- Ans: No, it will throw an error.

create table test2(
    sno int not null,
    salary int
);

insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(10,null);

-- Q18. Why does the below query fail?
-- Ans: Because sno has NOT NULL constraint.

insert into test2(sno,salary) values(null,1000);

-- ===============================
-- DEFAULT Constraint
-- ===============================

-- Q19. What is DEFAULT constraint?
-- Ans: It assigns a default value if no value is provided.

-- Q20. When is DEFAULT value applied?
-- Ans: When a column value is not supplied during INSERT.

create table test3(
    sno int not null default 80,
    salary int
);

-- Q21. What value will sno take here and why?
-- Ans: sno will take 80 because DEFAULT value is applied.

insert into test3(salary) values(1000);

-- ===============================
-- UNIQUE Constraint
-- ===============================

-- Q22. What is UNIQUE constraint?
-- Ans: It ensures all values in a column are unique.

-- Q23. Difference between UNIQUE and PRIMARY KEY?
-- Ans: UNIQUE allows NULL values, PRIMARY KEY does not.

-- Q24. Can UNIQUE column contain NULL values?
-- Ans: Yes, multiple NULL values are allowed.

create table test4(
    sno int not null,
    salary int unique default 100
);

insert into test4(sno,salary) values(1000,2000);
insert into test4(sno) values(1001);

-- Q25. Why does the below insert fail?
-- Ans: Because DEFAULT value 100 already exists and UNIQUE is violated.

insert into test4(sno) values(1002);

-- ===============================
-- CHECK Constraint
-- ===============================

-- Q26. What is CHECK constraint?
-- Ans: It restricts column values based on a condition.

-- Q27. How does CHECK constraint maintain data integrity?
-- Ans: It prevents invalid values from being inserted.

create table test5(
    sno int,
    salary int,
    check(sno between 1 and 100),
    check(salary in (1000,2000))
);

insert into test5(sno,salary) values(4,1000);

-- ===============================
-- Named CHECK Constraint
-- ===============================

-- Q28. Why should constraints be named?
-- Ans: To easily identify constraint errors.

-- Q29. What is the benefit of naming constraints?
-- Ans: Error messages become more readable and clear.

create table test6(
    sno int,
    salary int,
    check(sno between 1 and 100),
    constraint regex_test6_salary_chk check(salary in (1000,2000))
);

insert into test6(sno,salary) values(4,1000);

-- ===============================
-- PRIMARY KEY + UNIQUE + DEFAULT + CHECK
-- ===============================

-- Q30. What is PRIMARY KEY?
-- Ans: It uniquely identifies each row and does not allow NULL.

-- Q31. Can PRIMARY KEY allow NULL?
-- Ans: No.

-- Q32. Can a table have multiple PRIMARY KEYS?
-- Ans: No, only one primary key (can be composite).

-- Q33. Can UNIQUE and PRIMARY KEY exist together?
-- Ans: Yes.

-- Q34. What is column-level vs table-level constraint?
-- Ans: Column-level applies to one column,
--      Table-level applies to multiple columns.

create table test7(
    id int primary key,
    name varchar(20),
    email varchar(20) unique,
    college varchar(20) default "Aietm",
    age int,
    guardian varchar(20),
    check(guardian = reverse(guardian)),
    check(age > 18)
);

-- Q36. Why does the below insert fail?
-- Ans: guardian "john" is not a palindrome.

insert into test7(id,name,email,college,age,guardian)
values(1,"rahul","rahul","Aietm",21,"john");

-- Q37. Why does this insert succeed?
-- Ans: "naman" is a palindrome and age > 18.

insert into test7(id,name,email,age,guardian)
values(1,"rahul","rahul@gmail.com",21,"naman");

-- Q38. What is DROP TABLE?
-- Ans: It permanently deletes a table structure and data.

-- Q39. Difference between DROP and TRUNCATE?
-- Ans: DROP deletes table structure,
--      TRUNCATE deletes only data.

drop table test7;
