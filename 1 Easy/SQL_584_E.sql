-- 584.Find Customer Referee 
/*
Write a query to return the list of customers NOT referred by the person with id '2'.

Customer table:
+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+

Result table:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(`id` INTEGER, `name` VARCHAR(4), `referee_id` VARCHAR(4));
INSERT INTO customer(`id`, `name`, `referee_id`)VALUES
	('1', 'Will', 'NULL'),
	('2', 'Jane', 'NULL'),
	('3', 'Alex', '2'),
	('4', 'Bill', 'NULL'),
	('5', 'Zack', '1'),
	('6', 'Mark', '2');
  
-- Writing your MySQL query statement below
SELECT name 
FROM customer 
WHERE referee_id != 2 OR referee_id IS NULL;
