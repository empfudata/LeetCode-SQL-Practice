-- 184.Department Highest Salary

/* 
Write an SQL query to find employees who have the highest salary in each of the departments.**
Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT, Name VARCHAR(100), Salary INT, departmentId INT);
INSERT INTO Employee VALUES
    (1,'Joe',70000,1),
    (2,'Jim',90000,1),
    (3,'Henry',80000,2),
    (4,'Sam',60000,2),
    (5,'Max',90000,1);
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (Id INT, Name VARCHAR(100));
INSERT INTO Department (Id, Name) VALUES
    (1,'IT'),
    (2,'Sales');
    
-- Write your MySQL query statement below
-- #1 List highest salary in each department
SELECT e2.departmentId, MAX(salary)
FROM Employee AS e2
WHERE e1.departmentId = e2.departmentId
GROUP BY e2.departmentId;

-- #2 List the employees who have the highest salary in their department
SELECT d.name AS "Department", e1.name AS "Employee", e1.salary
FROM Employee e1 LEFT JOIN Department d
ON e1.departmentId = d.id
WHERE (d.id, e1.salary) IN (SELECT e2.departmentId, MAX(salary)
                            FROM Employee AS e2
                            WHERE e1.departmentId = e2.departmentId
                            GROUP BY e2.departmentId);


-- MS SQL Server (Dense Rank)
SELECT x.Department, x.Employee, x.Salary
FROM (SELECT b.Name AS Department, a.Name AS Employee, a.Salary AS Salary, 
        DENSE_RANK() OVER (PARTITION BY b.Name ORDER BY a.Salary DESC) AS dept_rank
      FROM Employee AS a
      INNER JOIN Department AS b
      ON a.DepartmentId = b.Id) AS x
WHERE x.dept_rank = 1