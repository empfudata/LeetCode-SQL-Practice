-- 1097.Game Play Analysis V
/*
Write an SQL query that reports for each install date, the number of players that installed the game on that day and the day 1 retention.

Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-01 | 0            |
| 3         | 4         | 2016-07-03 | 5            |
+-----------+-----------+------------+--------------+

Result table:
+------------+----------+----------------+
| install_dt | installs | Day1_retention |
+------------+----------+----------------+
| 2016-03-01 | 2        | 0.50           |
| 2017-06-25 | 1        | 0.00           |
+------------+----------+----------------+
Player 1 and 3 installed the game on 2016-03-01 but only player 1 logged back in on 2016-03-02 so the day 1 retention of 2016-03-01 is 1 / 2 = 0.50
Player 2 installed the game on 2017-06-25 but didn't log back in on 2017-06-26 so the day 1 retention of 2017-06-25 is 0 / 1 = 0.00
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (
  `player_id` INTEGER,
  `device_id` INTEGER,
  `event_date` DATETIME,
  `games_played` INTEGER);

INSERT INTO Activity (`player_id`, `device_id`, `event_date`, `games_played`) VALUES
  ('1', '2', '2016-03-01', '5'),
  ('1', '2', '2016-03-02', '6'),
  ('2', '3', '2017-06-25', '1'),
  ('3', '1', '2016-03-01', '0'),
  ('3', '4', '2016-07-03', '5');
  
-- Writing your MySQL query statement below
SELECT CAST(t1.event_date AS DATE) AS install_dt, COUNT(t1.player_id) AS installs, ROUND(COUNT(t3.player_id)/COUNT(t1.player_id), 2) AS Day1_retention
FROM Activity t1 LEFT JOIN Activity t2 
ON t1.player_id = t2.player_id AND t1.event_date > t2.event_date LEFT JOIN Activity t3
ON t1.player_id = t3.player_id AND DATEDIFF(t3.event_date, t1.event_date) = 1
WHERE t2.event_date IS NULL 
GROUP BY t1.event_date;


