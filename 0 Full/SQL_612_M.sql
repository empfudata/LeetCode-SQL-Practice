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
SELECT ROUND(SQRT(MIN(POW(a.x-b.x,2) + POW(a.y-b.y,2))),2) shortest
FROM point_2d a 
CROSS JOIN point_2d b
WHERE NOT (a.x = b.x AND a.y = b.y);

-- #2
SELECT
    round(min(sqrt(pow(P1.y-P2.y,2)+pow(P1.x-P2.x,2))),2) as shortest
FROM
    point_2d P1,
    point_2d P2
WHERE
    P1.x <> P2.x OR
    P1.y <> P2.y
-- https://lifewithdata.com/2021/08/06/sql-interview-questions-leetcode-612-shortest-distance-in-a-plane/