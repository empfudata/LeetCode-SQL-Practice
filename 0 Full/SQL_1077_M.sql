-- 1077.Project Employees III
/*
Write an SQL query that reports the most experienced employees in each project. 
In case of a tie, report all employees with the maximum number of experience years.

Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 3                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Result table:
+-------------+---------------+
| project_id  | employee_id   |
+-------------+---------------+
| 1           | 1             |
| 1           | 3             |
| 2           | 1             |
+-------------+---------------+
Both employees with id 1 and 3 have the most experience among the employees of the first project. 
For the second project, the employee with id 1 has the most experience.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Project;
CREATE TABLE Project (
  `project_id` INTEGER,
  `employee_id` INTEGER);

INSERT INTO Project (`project_id`, `employee_id`) VALUES
  ('1', '1'),
  ('1', '2'),
  ('1', '3'),
  ('2', '1'),
  ('2', '4');

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  `employee_id` INTEGER,
  `name` VARCHAR(6),
  `experience_years` INTEGER);

INSERT INTO Employee (`employee_id`, `name`, `experience_years`) VALUES
  ('1', 'Khaled', '3'),
  ('2', 'Ali', '2'),
  ('3', 'John', '3'),
  ('4', 'Doe', '2');

-- Writing your MySQL query statement below
SELECT project_id, employee_id
FROM (SELECT p.project_id, e.employee_id, e.name, e.experience_years, 
             RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) AS yr
	  FROM Project p LEFT JOIN Employee e
	  ON p.employee_id = e.employee_id) t
WHERE yr = 1;


