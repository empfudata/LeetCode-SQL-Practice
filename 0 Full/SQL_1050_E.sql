-- 1050.Actors and Directors Who Cooperated At Least Three Times
/*
Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+

Result table: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS ActorDirector;
CREATE TABLE ActorDirector (
  `actor_id` INTEGER,
  `director_id` INTEGER,
  `timestamp` INTEGER);

INSERT INTO ActorDirector (`actor_id`, `director_id`, `timestamp`) VALUES
  ('1', '1', '0'),
  ('1', '1', '1'),
  ('1', '1', '2'),
  ('1', '2', '3'),
  ('1', '2', '4'),
  ('2', '1', '5'),
  ('2', '1', '6');
  
-- Writing your MySQL query statement below
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(director_id) >=3
