-- Day 1 LeetCode SQL Practice 
-- #175-#178, #180-185

-- #175
-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (personId int, firstName varchar(255), lastName varchar(255));
INSERT INTO Person (personId, lastName, firstName) VALUES 
('1', 'Wang', 'Allen'),
('2', 'Alice', 'Bob');

DROP TABLE IF EXISTS Address;
CREATE TABLE Address (addressId int, personId int, city varchar(255), state varchar(255));
INSERT INTO Address (addressId, personId, city, state) VALUES
('1', '2', 'New York City', 'New York'),
('2', '3', 'Leetcode', 'California');

-- Write your SQL query statement below
-- JOIN: LEFT
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p LEFT JOIN Address a
ON p.personId = a.personId;

-- #176
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INT, salary INT);
INSERT INTO Employee (id, salary) VALUES
    ('1', '100'),
    ('2', '200'),
    ('3', '300'),
    ('4', '300');
    
-- Write your SQL query statement below
-- SUBQUERY
-- ISNULL (MSSQL) = IFNULL(MySQL)
-- OFFSET 1 ROWS FETCH FIRST 1 ROWS ONLY (MSSQL) = LIMIT 1 OFFSET 1 (MySQL)
SELECT IFNULL((SELECT DISTINCT salary 
               FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rk
                     FROM `Employee`) AS temp 
              WHERE rk = 2), NULL) AS SecondHighestSalary;
              
SELECT ISNULL((SELECT DISTINCT salary 
		       FROM Employee
			   ORDER BY salary DESC
			   OFFSET 1 ROWS FETCH FIRST 1 ROWS ONLY), NULL) AS SecondHighestSalary;

-- #177
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(Id INT, Salary INT);
INSERT INTO Employee (id, salary) VALUES 
    ('1', '100'),
	('2', '200'),
	('3', '300');

-- Writing your SQL statement below
-- SUBQUERY
-- ISNULL (MSSQL) = IFNULL(MySQL)
-- DENSE RANK
SELECT IFNULL((SELECT DISTINCT salary 
               FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rk
                     FROM `Employee`) AS temp 
              WHERE rk = 2), NULL) AS 'SecondHighestSalary(2)';

-- #178
-- Creating SQL Schema
DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores (id INT, score DECIMAL(3,2));
INSERT INTO Scores (id, score) VALUES
    ('1', '3.5'),
    ('2', '3.65'),
    ('3', '4.0'),
    ('4', '3.85'),
    ('5', '4.0'),
    ('6', '3.65');

-- Write your SQL query statement below
-- DENSE RANK
SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM `Scores`
ORDER BY score DESC;

-- #180
-- Creating SQL Schema
DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (id INT, num INT);
INSERT INTO Logs (id, num) VALUES 
    ('1', '1'),
    ('2', '1'),
    ('3', '1'),
    ('4', '2'),
    ('5', '1'),
    ('6', '2'),
    ('7', '2');

-- Write your SQL query statement below
-- JOIN: SELF
SELECT DISTINCT tb1.num AS ConsecutiveNums
FROM Logs AS tb1 JOIN Logs AS tb2
ON tb1.id + 1 = tb2.id AND tb1.num = tb2.num JOIN Logs AS tb3
ON tb2.id + 1 = tb3.id AND tb2.num = tb3.num;

-- SUBQUERY
-- Window Function: LEAD & LAG
-- WHERE
SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT num,
	         LEAD(num, 1) OVER(ORDER BY id) AS num_1,
			 LEAD(num, 2) OVER(ORDER BY id) AS num_2
             FROM Logs) AS temp
WHERE num = num_1 AND num_1 = num_2;
-- LEAD & LAG
SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT num,
	         LEAD(num, 1) OVER(ORDER BY id) AS num_1,
			 LAG(num, 1) OVER(ORDER BY id) AS num_2
             FROM Logs) AS temp
WHERE num = num_1 AND num_1 = num_2;

-- #181
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (Id INT,  name VARCHAR(255), salary INT, managerId INT);
INSERT INTO Employee (Id, name, salary, managerId) VALUES
    (1,'Joe',70000,3),
    (2,'Henry',80000,4),
    (3,'Sam',60000,NULL),
    (4,'Max',90000,NULL);

-- Write your SQL query statement below
-- JOIN: SELF, LEFT
-- WHERE
SELECT e1.name AS Employee
FROM Employee e1 LEFT JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

-- #182
-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (Id INT, Email VARCHAR(100));
INSERT INTO Person (Id, Email) VALUES
    (1,'a@b.com'),
    (2,'c@d.com'),
    (3,'a@b.com');

-- Write your SQL query statement below
-- GROUP BY, HAVING
SELECT email
FROM `Person`
GROUP BY email
HAVING COUNT(email) = 2;

-- #183
- Creating SQL Schema
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (Id INT, Name VARCHAR(100));
INSERT INTO Customers (Id, Name) VALUES
    (1,'Joe'),
    (2,'Henry'),
    (3,'Sam'),
    (4,'Max');
    
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (Id INT, CustomerId INT);
INSERT INTO Orders (Id, CustomerId) VALUES
    (1,3),
    (2,1);

-- Write your SQL query statement below
-- JOIN: LEFT, 
-- WHERE 
-- IS NULL
SELECT c.name AS Customers
FROM Customers c LEFT JOIN Orders o 
ON c.id = o.customerId 
WHERE o.id IS NULL;

-- #184
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

-- Write your SQL query statement below
-- SUBQUERY
-- DENSE RANK 
-- JOIN: INNER
-- WHERE
SELECT Department, Employee, Salary  
FROM (SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
             DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rk
      FROM Employee e INNER JOIN Department d
      ON e.departmentId = d.id) AS temp
WHERE rk = 1;

-- #185
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

-- Write your SQL query statement below
-- SUBQUERY
-- DENSE RANK 
-- JOIN: INNER
-- WHERE
SELECT Department, Employee, Salary  
FROM (SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
             DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rk
      FROM Employee e INNER JOIN Department d
      ON e.departmentId = d.id) AS temp
WHERE rk < 4;