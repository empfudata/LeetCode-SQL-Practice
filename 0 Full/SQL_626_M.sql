-- 626.Exchange Seats
/*
Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, 
the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+

Result table: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS seat;
CREATE TABLE seat (`id` INTEGER, `student` VARCHAR(7));
INSERT INTO seat (`id`, `student`) VALUES
	('1', 'Abbot'),
	('2', 'Doris'),
	('3', 'Emerson'),
	('4', 'Green'),
	('5', 'Jeames');

-- Writing your MySQL query statement below
SELECT (CASE WHEN MOD(id, 2) = 0 THEN id - 1
			 WHEN id = (SELECT MAX(id) FROM seat) THEN id
			 ELSE id + 1
			 END) AS id, student
FROM seat
ORDER BY id;