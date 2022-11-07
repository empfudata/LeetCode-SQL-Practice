-- 610.Triangle Judgement
/*
A pupil Tim gets homework to identify whether three line segments could possibly form a triangle.
However, this assignment is very heavy because there are hundreds of records to calculate.
Could you help Tim by writing a query to judge whether these three sides can form a triangle, 
assuming table triangle holds the length of the three sides x, y and z.

Triangle table:
| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

Result table:
| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS triangle;
CREATE TABLE triangle (`x` INTEGER, `y` INTEGER, `z` INTEGER);
INSERT INTO triangle (`x`, `y`, `z`) VALUES
	('13', '15', '30'),
	('10', '20', '15');

-- Writing your MySQL query statement below
SELECT *, CASE WHEN x + y > z 
			 AND x + z > y
             AND y + z > x
			Then "Yes"
		    ELSE "No" END AS triangle
FROM triangle
