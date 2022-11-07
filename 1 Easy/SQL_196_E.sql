-- 196.Delete Duplicate Emails
/*
Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
Note that you are supposed to write a DELETE statement and not a SELECT one.

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. 
We keep the row with the smallest Id = 1.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (Id int, Email varchar(255));
INSERT INTO Person (id, email) VALUES
	('1', 'john@example.com'),
	('2', 'bob@example.com'),
    ('3', 'john@example.com');

-- Writing your MySQL statement below
-- #1
DELETE p1
FROM Person p1, Person p2
WHERE p1.email = p2.email AND p1.id > p2.id;

-- #2
DELETE FROM Person 
WHERE id NOT IN (SELECT *
				 FROM (SELECT min(id)
					   FROM Person
					   GROUP BY email)AS temp);
SELECT * FROM Person;				