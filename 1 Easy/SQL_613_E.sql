-- 613.Shortest Distance in a Line
/*
Write a query to find the shortest distance between two points in these points.

Point table:
| x   |
|-----|
| -1  |
| 0   |
| 2   |

Result table: 
| shortest|
|---------|
| 1       |
The shortest distance is '1' obviously, which is from point '-1' to '0'.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS point;
CREATE TABLE point (`x` INTEGER, `ignore` VARCHAR(1));
INSERT INTO point (`x`, `ignore`) VALUES
	('-1', '_'),
	('0', '_'),
	('2', '_');
    
-- Writing your MySQL query statement below
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM point p1 INNER JOIN point p2
ON p1.x != p2.x;

