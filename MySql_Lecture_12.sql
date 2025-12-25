
-- 25/12/2025
use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);

select * from students;
select * from enrollments;

select s.student_id,
       s.student_name,
       e.enrollment_id,
       e.course_name
from students as s
left join enrollments as e
ON s.student_id = e.student_id;

-- Display student names and the courses they are enrolled in. 
select s.student_name, e.course_name
from students s
inner join enrollments e
on s.student_id = e.student_id;

-- List all students along with their enrolled courses,
select s.student_name, e.course_name
from students s
left join enrollments e
on s.student_id = e.student_id;

-- To display student names who are NOT enrolled in any course, 
select s.student_name
from students s
left JOIN enrollments e
on s.student_id = e.student_id
where e.student_id is null;

--  IS ka use special values check karne ke liye hota hai(Null / True or false)
--  Null means no data(koi value hi nahi)(unknown / missing data)

-- Students ke course count (only enrolled students) 
select s.student_id, s.student_name,
       COUNT(e.enrollment_id) 
from students as s
join enrollments e
on s.student_id = e.student_id
group by s.student_id, s.student_name;




select s.student_id,
       s.student_name,
       COALESCE(SUM(e.credits), 0) 
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;

Select * from students;
select major,
       COUNT(*) 
FROM students
GROUP BY major;

-- total credit of each major 
select s.major,
       SUM(e.credits)
from students s
 join enrollments e
on s.student_id = e.student_id
group by s.major;

select char_length(student_name)from students;

-- Write a SQL query to group students by the 
-- length of their names and show the count of students in each group.


 select char_length(student_name) ,
       count(student_id)  from students
group by char_length(student_name);

-- find the highet count of student in th group of each character length
 
SELECT CHAR_LENGTH(student_name), COUNT(e.enrollment_id)
FROM student AS s
JOIN enrollment AS e 
ON s.student_id = e.student_id
GROUP BY CHAR_LENGTH(student_name)
ORDER BY COUNT(e.enrollment_id) DESC
LIMIT 1;







