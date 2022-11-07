-- 178. Rank Scores
/*
Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

1.The scores should be ranked from the highest to the lowest.
2.If there is a tie between two scores, both should have the same ranking.
3.After a tie, the next ranking number should be the next consecutive integer value. 
  In other words, there should be no holes between ranks.
4.Return the result table ordered by score in descending order.

Input: 
Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output: 
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores (id INT, score DECIMAL(3,2));
INSERT INTO Scores (id, score) VALUES
    ('1', '3.5'),
    ('2', '3.65'),
    ('3', '4.0'),
    ('4', '3.85'),
    ('5', '4.0'),
    ('6', '3.65');

-- Write your MySQL query statement below
-- #1
SELECT score,
	   DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores;

-- #2
SELECT score,
	  (SELECT COUNT(DISTINCT score) 
	   FROM Scores 
	   WHERE score >= s.score) AS 'rank'
FROM Scores s
ORDER BY Score DESC;

