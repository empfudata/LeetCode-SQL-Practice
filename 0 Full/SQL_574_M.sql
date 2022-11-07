-- 574. Winning Candidate
/*
Write a sql to find the name of the winning candidate.

Candidate table:
+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+
Vote table:
+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+

Reuslt table:
+------+
| Name |
+------+
| B    |
+------+
Notes:
You may assume there is no tie, in other words there will be only one winning candidate.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Candidate;
CREATE TABLE Candidate (`id` INTEGER, `Name` VARCHAR(1));
INSERT INTO Candidate (`id`, `Name`) VALUES
	('1', 'A'),
	('2', 'B'),
	('3', 'C'),
	('4', 'D'),
	('5', 'E');
  
DROP TABLE IF EXISTS Vote;
CREATE TABLE Vote (`id` INTEGER, `CandidateId` INTEGER);
INSERT INTO Vote (`id`, `CandidateId`) VALUES
	('1', '2'),
	('2', '4'),
	('3', '3'),
	('4', '2'),
	('5', '5');
    
-- Writing your MySQL query statement below
-- #1
SELECT name 
FROM Candidate 
WHERE id = (SELECT CandidateId
			FROM Vote
			GROUP BY CandidateId
			ORDER BY COUNT(CandidateId) DESC
			LIMIT 1);

-- #2
SELECT name 
FROM Candidate AS c 
INNER JOIN (SELECT CandidateId
			FROM Vote
			GROUP BY CandidateId
			ORDER BY COUNT(CandidateId) DESC
			LIMIT 1) AS t
ON c.Id = t.CandidateId;

