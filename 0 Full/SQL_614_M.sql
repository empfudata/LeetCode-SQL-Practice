-- 614.Second Degree Follower
/*
Please write a sql query to get the amount of each follower’s follower if he/she has one.
Followee would not follow himself/herself in all cases.
Please display the result in follower’s alphabet order.

Follow table:
+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+

Result table:
+-------------+------------+
| follower    | num        |
+-------------+------------+
|     B       |  2         |
|     D       |  1         |
+-------------+------------+
Explaination:
Both B and D exist in the follower list, when as a followee, B’s follower is C and D, and D’s follower is E. 
A does not exist in follower list.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS follow;
CREATE TABLE follow (`followee` VARCHAR(1), `follower` VARCHAR(1));
INSERT INTO follow (`followee`, `follower`) VALUES
	('A', 'B'),
	('B', 'C'),
	('B', 'D'),
	('D', 'E');
    
-- Writing your MySQL query statement below
-- Check
SELECT f1.*, f2.*
FROM follow f1 LEFT JOIN follow f2
ON f1.follower = f2.followee;

-- Final
SELECT follower, num 
FROM (SELECT f1.follower AS follower, COUNT(DISTINCT f2.follower) AS num
	  FROM follow f1 LEFT JOIN follow f2
	  ON f1.follower = f2.followee
      GROUP BY f1.follower) AS temp
WHERE num > 0
ORDER BY follower;
