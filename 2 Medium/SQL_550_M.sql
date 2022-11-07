-- 550.Game Play Analysis IV
/*
Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, 
then divide that number by the total number of players.
Input:
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
Output:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date date, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
    (1, 2, "2016-03-01", 5),
    (1, 2, "2016-03-02", 6),
    (2, 3, "2017-06-25", 1),
    (3, 1, "2016-03-02", 0),
    (3, 4, "2018-07-03", 5);

-- Write your MySQL query statement below
-- #1 List first login dates for each player
SELECT player_id, MIN(event_date) AS first_login_date
FROM Activity 
GROUP BY player_id;

-- #2 table a: first login, table b: all information
-- a.first_login_date + 1 = b.event_date means login next day
SELECT ROUND(COUNT(DISTINCT b.player_id) / COUNT(DISTINCT a.player_id),2) AS fraction 
FROM (SELECT player_id, MIN(event_date) AS first_login_date
      FROM Activity 
      GROUP BY player_id) AS a LEFT JOIN Activity AS b 
ON a.player_id = b.player_id 
AND DATE_ADD(a. first_login_date, INTERVAL 1 DAY) = b.event_date;
