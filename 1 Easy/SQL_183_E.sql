-- 183. Customers Who Never Order: 
/*
Write an SQL query to report all customers who never order anything.
Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
*/

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

-- Write your MySQL query statement below
-- #1 List customers with their orders
SELECT c.Id AS CustomerID, c.Name, o.Id AS OrderID
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.id = o.customerId;

-- #2 No OrderID (NULL) in Order table means customers never place an order
SELECT c.name AS 'Customers' 
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.id = o.customerId
WHERE o.id IS NULL;