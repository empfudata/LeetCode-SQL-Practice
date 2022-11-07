-- 580.Count Student Number in Departments
/*
Write a query to print the respective department name and number of students majoring in each department 
for all departments in the department table (even ones with no current students).

Sort your results by descending number of students; 
if two or more departments have the same number of students, then sort those departments alphabetically by department name.

Student table:
| student_id | student_name | gender | dept_id |
|------------|--------------|--------|---------|
| 1          | Jack         | M      | 1       |
| 2          | Jane         | F      | 1       |
| 3          | Mark         | M      | 2       |

Department table:
| dept_id | dept_name   |
|---------|-------------|
| 1       | Engineering |
| 2       | Science     |
| 3       | Law         |

Result table
| dept_name   | student_number |
|-------------|----------------|
| Engineering | 2              |
| Science     | 1              |
| Law         | 0              |
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS student;
CREATE TABLE student (`student_id` INTEGER, `student_name` VARCHAR(4), `gender` VARCHAR(1), `dept_id` INTEGER);
INSERT INTO student (`student_id`, `student_name`, `gender`, `dept_id`) VALUES
	('1', 'Jack', 'M', '1'),
	('2', 'Jane', 'F', '1'),
	('3', 'Mark', 'M', '2');

DROP TABLE IF EXISTS department;
CREATE TABLE department (`dept_id` INTEGER, `dept_name` VARCHAR(11));

INSERT INTO department (`dept_id`, `dept_name`) VALUES
	('1', 'Engineering'),
	('2', 'Science'),
	('3', 'Law');
    
-- Writing your MySQL query statement below
SELECT d.dept_name, IFNULL(COUNT(s.student_id), 0) AS student_number
FROM department d LEFT JOIN student s
ON d.dept_id = s.dept_id
GROUP BY d.dept_name
ORDER BY student_number DESC, d.dept_name;