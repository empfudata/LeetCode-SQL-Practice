-- 620.Not Boring Movies
/*
Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.

Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+

Result table: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema (`id` INTEGER, `movie` VARCHAR(10), `description` VARCHAR(11), `rating` FLOAT);
INSERT INTO cinema (`id`, `movie`, `description`, `rating`) VALUES
	('1', 'War', 'great 3D', '8.9'),
	('2', 'Science', 'fiction', '8.5'),
	('3', 'irish', 'boring', '6.2'),
	('4', 'Ice song', 'Fantacy', '8.6'),
	('5', 'House card', 'Interesting', '9.1');
    
-- Writing your MySQL query statement below
SELECT id, movie, description, rating
FROM cinema
-- Check odd number 
WHERE MOD(id, 2) = 1 
AND description != "boring"
ORDER BY rating DESC;

