-- 571.Find Median Given Frequency of Numbers
/*
Write a query to find the median of all numbers and name the result as median.

+----------+-------------+
|  Number  |  Frequency  |
+----------+-------------|
|  0       |  7          |
|  1       |  1          |
|  2       |  3          |
|  3       |  1          |
+----------+-------------+
In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

+--------+
| median |
+--------|
| 0.0000 |
+--------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers (`Number` INTEGER, `Frequency` INTEGER);
INSERT INTO Numbers (`Number`, `Frequency`) VALUES
	('0', '7'),
	('1', '1'),
	('2', '3'),
	('3', '1');

-- Writing your MySQL query statement below
-- #1
SELECT ROUND(SUM(number)/COUNT(number), 2) AS median
FROM (SELECT number, frequency,
             SUM(frequency) OVER (ORDER BY number) AS cumulative_num,
             SUM(frequency) OVER () AS total_num
             FROM numbers) AS temp
WHERE total_num/2.0 BETWEEN cumulative_num - frequency AND cumulative_num;

-- #2
WITH recursive rec_cte AS (
SELECT number, frequency, 1 AS cnt 
FROM numbers
UNION
SELECT number, frequency, cnt+1 AS cnt 
FROM rec_cte
WHERE cnt<frequency),
med_cte AS (
SELECT number, frequency, cnt, 
       ROW_NUMBER() OVER (ORDER BY number) AS row_num, 
       COUNT(*) OVER () AS tot_count
       FROM rec_cte);
/*
SELECT * FROM med_cte;
number, frequency, cnt, row_num, tot_count
'0', '7', '1', '1', '12'
'0', '7', '2', '2', '12'
'0', '7', '3', '3', '12'
'0', '7', '4', '4', '12'
'0', '7', '5', '5', '12'
'0', '7', '6', '6', '12'
'0', '7', '7', '7', '12'
'1', '1', '1', '8', '12'
'2', '3', '1', '9', '12'
'2', '3', '2', '10', '12'
'2', '3', '3', '11', '12'
'3', '1', '1', '12', '12'
*/

SELECT CASE WHEN MOD(tot_count, 2)=0 THEN ROUND(AVG(number), 1)
            ELSE ROUND(number, 1) 
            END AS median
FROM med_cte
WHERE row_num BETWEEN tot_count/2 AND tot_count/2+1;

