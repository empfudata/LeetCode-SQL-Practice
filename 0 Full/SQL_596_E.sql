-- 596.Classes More Than 5 Students
/*
Write an SQL query to report all the classes that have at least five students.
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+

Result table: 
+---------+
| class   |
+---------+
| Math    |
+---------+

Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (`student` VARCHAR(1), `class` VARCHAR(8));
INSERT INTO courses (`student`, `class`) VALUES
	('A', 'Math'),
	('B', 'English'),
	('C', 'Math'),
	('D', 'Biology'),
	('E', 'Math'),
	('F', 'Computer'),
	('G', 'Math'),
	('H', 'Math'),
	('I', 'Math');
  
-- Writing your MySQL query statement below
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(class) >= 5;

