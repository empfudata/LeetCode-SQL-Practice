-- 175.Combine Two Tables
/*
Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead.

Input: 
Person table:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
Explanation: 
There is no address in the address table for the personId = 1 so we return null in their city and state.
addressId = 1 contains information about the address of personId = 2.
*/

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

-- Write your MySQL query statement below
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p LEFT JOIN Address a
ON p.personId = a.personId

