-- 197.Rising Temperature

/*
Write an SQL query to find all dates'' id with higher temperatures compared to its previous dates (yesterday).**
Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (id INT, recordDate DATE, temperature INT);
INSERT INTO Weather (id, recordDate, temperature) VALUES
    (1,'2015-01-01',10),   
	(2,'2015-01-02',25), 
	(3,'2015-01-03',20),   
	(4,'2015-01-04',30);   

-- Write your MySQL query statement below

-- #1 List the weather of Today and Yesterday
SELECT *
FROM Weather AS tod
LEFT JOIN Weather AS yes
ON tod.recordDate = ADDDATE(yes.recordDate, INTERVAL 1 DAY);

-- #2 List the dates with higher temperature than previous day
SELECT tod.id 
FROM Weather AS tod
LEFT JOIN Weather AS yes
-- today = yesterday + 1 day
ON tod.recordDate = ADDDATE(yes.recordDate, INTERVAL 1 DAY)
WHERE tod.temperature > yes.temperature;