-- 1075.Project Employees I
/*
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

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
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50
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
  ('3', 'John', '1'),
  ('4', 'Doe', '2');
  
-- Writing your MySQL query statement below
SELECT p.project_id, ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p LEFT JOIN Employee e 
ON p.employee_id = e.employee_id 
GROUP BY p.project_id