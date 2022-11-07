-- 177.Nth Highest Salary
/*
Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null.

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2

Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(Id int, Salary int);
INSERT INTO Employee (id, salary) VALUES 
    ('1', '100'),
	('2', '200'),
	('3', '300');

-- Writing your MySQL statement below
SELECT salary AS "gerNthHighestSalary(2)"
FROM (SELECT *, IFNULL(DENSE_RANK() OVER(ORDER BY salary DESC), NULL) AS n
	  FROM Employee) AS temp
WHERE n = 2;

