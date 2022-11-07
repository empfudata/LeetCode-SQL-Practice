-- 603.Consecutive Available Seats
/*
Several friends at a cinema ticket office would like to reserve consecutive available seats.
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?

cinema table:
| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |

result table:
| seat_id |
|---------|
| 3       |
| 4       |
| 5       |

Note:
The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
Consecutive available seats are more than 2(inclusive) seats consecutively available.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema (`seat_id` INTEGER, `free` INTEGER);
INSERT INTO cinema (`seat_id`, `free`)VALUES
	('1', '1'),
	('2', '0'),
	('3', '1'),
	('4', '1'),
	('5', '1');
    
-- Writing your MySQL query statement below
SELECT DISTINCT c1.seat_id
FROM cinema AS c1 INNER JOIN cinema AS c2
-- ABS() returns the absolute value of a number.
ON ABS(c1.seat_id - c2.seat_id) = 1
AND c1.free = 1 AND c2.free = 1
ORDER BY c1.seat_id;
