-- 1076.Project Employees II
/*
Write an SQL query that reports all the projects that have the most employees.

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
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Result table:
+-------------+
| project_id  |
+-------------+
| 1           |
+-------------+
The first project has 3 employees while the second one has 2.
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

CREATE TABLE Employee (
  `employee_id` INTEGER,
  `name` VARCHAR(6),
  `experience_years` INTEGER);

INSERT INTO Employee (`employee_id`, `name`, `experience_years`) VALUES
  ('1', 'Khaled', '3'),
  ('2', 'Ali', '2'),
  ('3', 'John', '1'),
  ('4', 'Doe', '2');
  
-- Writing your MySQL query statement below
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id)
							 FROM Project
							 GROUP BY project_id
							 ORDER BY COUNT(employee_id) DESC
							 LIMIT 1);