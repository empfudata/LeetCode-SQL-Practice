-- 602.Friend Requests II: Who has the most friends
/*
Write a query to find the the people who has most friends and the most friends number under the following rules:
• It is guaranteed there is only 1 people having the most friends.
• The friend request could only been accepted once, which mean there is no multiple records 
  with the same requester_id and accepter_id value.
  
Input:
request_accepted Table:
+--------------+-------------+------------+
| requester_id | accepter_id | accept_date|
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
+--------------+-------------+------------+
Output:
+----+-----+
| id | num |
|----|-----|
| 3  | 3   |
+----+-----+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS request_accepted;
CREATE TABLE request_accepted (requester_id INT NOT NULL, accepter_id INT NULL, accept_date DATE NULL);
INSERT INTO request_accepted (requester_id, accepter_id, accept_date) VALUES
	('1','2','2016/06/03'),
	('1','3','2016/06/08'),
	('2','3','2016/06/08'),
	('3','4','2016/06/09');

-- Write your MySQL query statement below
SELECT id, COUNT(id) AS num
FROM (SELECT requester_id AS id FROM request_accepted
	  UNION ALL 
      SELECT accepter_id AS id FROM request_accepted) AS temp
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1;

-- list all combination???
1 2
1 3
2 1
2 3
3 1
3 2
3 4
4 3