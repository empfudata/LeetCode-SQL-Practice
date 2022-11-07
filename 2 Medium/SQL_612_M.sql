-- 612.Shortest Distance in a Plane
/*
 Write a query to find the shortest distance between these points rounded to 2 decimals.

Point_2d table:
 | x  | y  |
 |----|----|
 | -1 | -1 |
 | 0  | 0  |
 | -1 | -2 |

Result table:
 | shortest |
 |----------|
 | 1.00     |
 
Note: 
The shortest distance is 1.00 from point (-1,-1) to (-1,-2). 
The longest distance among all the points are less than 10000.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS point_2d;
CREATE TABLE point_2d (`x` INTEGER, `y` INTEGER);
INSERT INTO point_2d (`x`, `y`) VALUES
	('-1', '-1'),
	('0', '0'),
	('-1', '-2');
    
-- Writing your MySQL query statement below
-- #1
SELECT ROUND(SQRT(MIN(POW(p1.x-p2.x,2) + POW(p1.y-p2.y,2))),2) shortest
FROM point_2d p1 
CROSS JOIN point_2d p2
WHERE NOT (p1.x = p2.x AND p1.y = p2.y);

-- #2
SELECT  ROUND(SQRT(MIN(POW(p1.x-p2.x,2) + POW(p1.y-p2.y,2))),2) shortest
FROM point_2d p1, point_2d p2
WHERE p1.x <> p2.x OR p1.y <> p2.y
-- https://lifewithdata.com/2021/08/06/sql-interview-questions-leetcode-612-shortest-distance-in-a-plane/