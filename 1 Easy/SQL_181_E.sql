-- 181. Employees Earning More Than Their Managers:
/*
Write an SQL query to find the employees who earn more than their managers.
Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT,  name VARCHAR(255), salary INT, managerId INT);
INSERT INTO Employee (Id, name, salary, managerId) VALUES
    (1,'Joe',70000,3),
    (2,'Henry',80000,4),
    (3,'Sam',60000,NULL),
    (4,'Max',90000,NULL);

-- Write your MySQL query statement below

-- #1 SELF JOIN table "Employee", list employees with their managers
SELECT *
FROM Employee e1 
LEFT JOIN Employee e2
ON e1.managerId = e2.Id;

-- #2 List employees who earn more than their manager
SELECT e1.name AS 'Employee' 
FROM Employee AS e1
LEFT JOIN Employee AS e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;