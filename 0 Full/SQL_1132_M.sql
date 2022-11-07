-- 1132.Reported Posts II
/*
Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.

Actions table:
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 2       | 2019-07-04  | view   | null   |
| 2       | 2       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-03  | view   | null   |
| 5       | 2       | 2019-07-03  | report | racism |
| 5       | 5       | 2019-07-03  | view   | null   |
| 5       | 5       | 2019-07-03  | report | racism |
+---------+---------+-------------+--------+--------+

Removals table:
+---------+-------------+
| post_id | remove_date |
+---------+-------------+
| 2       | 2019-07-20  |
| 3       | 2019-07-18  |
+---------+-------------+

Result table:
+-----------------------+
| average_daily_percent |
+-----------------------+
| 75.00                 |
+-----------------------+
The percentage for 2019-07-04 is 50% because only one post of two spam reported posts was removed.
The percentage for 2019-07-02 is 100% because one post was reported as spam and it was removed.
The other days had no spam reports so the average is (50 + 100) / 2 = 75%
Note that the output is only one number and that we do not care about the remove dates.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Actions;
CREATE TABLE Actions (
  `user_id` INTEGER,
  `post_id` INTEGER,
  `action_date` DATETIME,
  `action` VARCHAR(6),
  `extra` VARCHAR(6));

INSERT INTO Actions (`user_id`, `post_id`, `action_date`, `action`, `extra`) VALUES
  ('1', '1', '2019-07-01', 'view', 'null'),
  ('1', '1', '2019-07-01', 'like', 'null'),
  ('1', '1', '2019-07-01', 'share', 'null'),
  ('2', '2', '2019-07-04', 'view', 'null'),
  ('2', '2', '2019-07-04', 'report', 'spam'),
  ('3', '4', '2019-07-04', 'view', 'null'),
  ('3', '4', '2019-07-04', 'report', 'spam'),
  ('4', '3', '2019-07-02', 'view', 'null'),
  ('4', '3', '2019-07-02', 'report', 'spam'),
  ('5', '2', '2019-07-03', 'view', 'null'),
  ('5', '2', '2019-07-03', 'report', 'racism'),
  ('5', '5', '2019-07-03', 'view', 'null'),
  ('5', '5', '2019-07-03', 'report', 'racism');

DROP TABLE IF EXISTS Removals;
CREATE TABLE Removals (
  `post_id` INTEGER,
  `remove_date` DATETIME);

INSERT INTO Removals (`post_id`, `remove_date`) VALUES
  ('2', '2019-07-20'),
  ('3', '2019-07-18');

-- Writing your MySQL query statement below
SELECT IFNULL(ROUND(SUM(remove_count/spam_count * 100)/COUNT(DISTINCT action_date), 2), 0) AS average_daily_percent 
FROM (SELECT action_date, COUNT(DISTINCT a.post_id) AS spam_count, COUNT(DISTINCT r.post_id) AS remove_COUNT
	  FROM Actions a LEFT JOIN Removals r 
	  ON a.post_id = r.post_id
	  WHERE a.extra = 'spam'
	  GROUP BY a.action_date) t;
