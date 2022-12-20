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






-- #177
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(Id INT, Salary INT);
INSERT INTO Employee (id, salary) VALUES 
    ('1', '100'),
	('2', '200'),
	('3', '300');

-- Writing your SQL statement below





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





-- #182
-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (Id INT, Email VARCHAR(100));
INSERT INTO Person (Id, Email) VALUES
    (1,'a@b.com'),
    (2,'c@d.com'),
    (3,'a@b.com');

-- Write your SQL query statement below






-- #183
-- Creating SQL Schema
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