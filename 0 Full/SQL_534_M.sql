-- 534.Game Play Analysis III
/*
Write an SQL query that reports for each player and date, how many games played so far by the player.
That is, the total number of games played by the player until that date. Check the example for clarity.
Input:
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 1         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
Output:
+-----------+------------+---------------------+
| player_id | event_date | games_played_so_far |
+-----------+------------+---------------------+
| 1         | 2016-03-01 | 5                   |
| 1         | 2016-05-02 | 11                  |
| 1         | 2017-06-25 | 12                  |
| 3         | 2016-03-02 | 0                   |
| 3         | 2018-07-03 | 5                   |
+-----------+------------+---------------------+
For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and 5 + 6 + 1 = 12 games played by 2017-06-25.
For the player with id 3, 0 + 5 = 5 games played by 2018-07-03.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date date, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
    (1, 2, "2016-03-01", 5),
    (1, 2, "2016-05-02", 6),
    (1, 3, "2017-06-25", 1),
    (3, 1, "2016-03-02", 0),
    (3, 4, "2018-07-03", 5);

-- Write your MySQL query statement below
-- Sum the # of played games base on player_id, then Order By event_date
SELECT player_id, event_date, 
SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM activity;