-- 185.Department Top Three Salaries
/*
Write a SQL query to find employees who earn the top three salaries in each of the department. 
Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |
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
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
Explanation: 
In the IT department:
- Max earns the highest unique salary
- Both Randy and Joe earn the second-highest unique salary
- Will earns the third-highest unique salary
In the Sales department:
- Henry earns the highest salary
- Sam earns the second-highest salary
- There is no third-highest salary as there are only two employees
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT, Name VARCHAR(100), Salary INT, departmentId INT);
INSERT INTO Employee VALUES
    (1,'Joe',85000,1),
    (2,'Henry',80000,2),
    (3,'Sam',60000,2),
    (4,'Max',90000,1),
    (5,'Janet',69000,1),
    (6,'Randy',85000,1),
    (7,'Will',70000,1);
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (Id INT, Name VARCHAR(100));
INSERT INTO Department (Id, Name) VALUES
    (1,'IT'),
    (2,'Sales');
    
-- Write your MySQL query statement below
-- #1 Solution
-- #1 Compare every employee's salary with their collegues (include themslef) in same department
-- List the person (Employee2) whose salary is higher or eaqual than themself  
SELECT d.name AS Department, e1.name AS Employee1, e1.salary AS Salary1, e2.name AS Employee2, e2.salary AS Salary2
FROM Department AS d LEFT JOIN Employee AS e1
ON d.id = e1.departmentId LEFT JOIN Employee AS e2
ON e1.departmentId = e2.departmentId
WHERE e1.salary <= e2.salary
ORDER BY d.name, e1.name;

-- #2 List how many people get more (include themself) pay than themself
SELECT d.name AS Department, e1.name AS Employee1, e1.salary AS Salary1, COUNT(DISTINCT e2.salary) AS Higher_Salary
FROM Department AS d LEFT JOIN Employee AS e1
ON d.id = e1.departmentId LEFT JOIN Employee AS e2
ON e1.departmentId = e2.departmentId
WHERE e1.salary <= e2.salary
GROUP BY d.name, e1.name, e1.salary
ORDER BY d.name, e1.name;

-- #3 List the people who earn the top three salaries
SELECT d.name AS Department, e1.name AS Employee, e1.salary AS Salary
FROM Department AS d LEFT JOIN Employee AS e1
ON d.id = e1.departmentId LEFT JOIN Employee AS e2
ON e1.departmentId = e2.departmentId
WHERE e1.salary <= e2.salary
GROUP BY d.name, e1.name, e1.salary
HAVING COUNT(DISTINCT e2.salary) <= 3
ORDER BY d.name, e1.salary DESC;

-- #2 Solution 
SELECT x.Department, x.Employee, x.Salary
FROM (SELECT b.Name AS Department, a.Name AS Employee, a.Salary AS Salary, 
        DENSE_RANK() OVER (PARTITION BY b.Name ORDER BY a.Salary DESC) AS dept_rank
      FROM Employee AS a
      INNER JOIN Department AS b
      ON a.DepartmentId = b.Id) AS x
WHERE x.dept_rank <= 3;