-- 619.Biggest Single Number
/*
Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once?

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 | 
For the sample data above, your query should return the following result:

+---+
|num|
+---+
| 6 |
Note:
If there is no such number, just output null
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS my_numbers;
CREATE TABLE my_numbers (`num` INTEGER, `ignore` VARCHAR(1));
INSERT INTO my_numbers (`num`, `ignore`) VALUES
	('8', '_'),
	('8', '_'),
	('3', '_'),
	('3', '_'),
	('1', '_'),
	('4', '_'),
	('5', '_'),
	('6', '_');
    
-- Writing your MySQL query statement below
SELECT MAX(num)
FROM (SELECT num
	  FROM my_numbers
	  GROUP BY num 
	  HAVING COUNT(num) = 1) AS temp;
