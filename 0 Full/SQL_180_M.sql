-- 180. Consecutive Numbers
/*
Write an SQL query to find all numbers that appear at least three times consecutively.
Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
*/

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

-- Write your MySQL query statement below
-- #1 Selft Join 3 tables
SELECT DISTINCT tb1.num AS ConsecutiveNums
FROM Logs AS tb1
LEFT JOIN Logs AS tb2
ON tb1.id + 1 = tb2.id
LEFT JOIN Logs AS tb3
ON tb2.id + 1 = tb3.id -- ON tb1.id + 2 = tb3.id
WHERE tb1.num = tb2.num 
AND tb2.num = tb3.num;  -- tb1.num = tb2.num = tb3.num WRONG

-- #2 SELF JOIN
SELECT DISTINCT tb1.num AS ConsecutiveNums
FROM Logs AS tb1, Logs AS tb2, Logs AS tb3
WHERE tb1.id + 1 = tb2.id AND tb2.id + 1 = tb3.id
AND tb1.num = tb2.num AND tb2.num = tb3.num;

-- #3 Window Function Using Lead
SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT *,
	         LEAD(num) OVER(ORDER BY id) AS Num_2,
			 LEAD(num, 2) OVER(ORDER BY id) AS Num_3
             FROM Logs) AS temp
WHERE Num = Num_2 AND Num_2 = Num_3;

-- #4 Smart way to solve
SELECT DISTINCT Num AS ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) IN (SELECT * FROM Logs) 
AND (Id + 2, Num) IN (SELECT * FROM Logs);

