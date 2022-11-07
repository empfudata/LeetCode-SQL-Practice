-- 182. Duplicate Emails: 

/*
Write an SQL query to report all the duplicate emails.
Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (Id INT, Email VARCHAR(100));
INSERT INTO Person (Id, Email) VALUES
    (1,'a@b.com'),
    (2,'c@d.com'),
    (3,'a@b.com');
    
-- Write your MySQL query statement below

-- #1 List # of each email, if > 1 means duplicate
SELECT email AS "Email", COUNT(id)
FROM Person
GROUP BY email;

-- #2 List the duplicate emails
SELECT email AS "Email"
FROM Person
GROUP BY email
HAVING COUNT(id) > 1;

