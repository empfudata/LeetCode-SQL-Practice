-- 1142.User Activity for the Past 30 Days II
/*
Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. 
The sessions we want to count for a user are those with at least one activity in that time period.

Activity table:
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 3       | 5          | 2019-07-21    | open_session  |
| 3       | 5          | 2019-07-21    | scroll_down   |
| 3       | 5          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+

Result table:
+---------------------------+
| average_sessions_per_user |
+---------------------------+
| 1.33                      |
+---------------------------+
User 1 and 2 each had 1 session in the past 30 days while user 3 had 2 sessions so the average is (1 + 1 + 2) / 3 = 1.33.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (
  `user_id` INTEGER,
  `session_id` INTEGER,
  `activity_date` DATETIME,
  `activity_type` VARCHAR(12));

INSERT INTO Activity (`user_id`, `session_id`, `activity_date`, `activity_type`) VALUES
  ('1', '1', '2019-07-20', 'open_session'),
  ('1', '1', '2019-07-20', 'scroll_down'),
  ('1', '1', '2019-07-20', 'end_session'),
  ('2', '4', '2019-07-20', 'open_session'),
  ('2', '4', '2019-07-21', 'send_message'),
  ('2', '4', '2019-07-21', 'end_session'),
  ('3', '2', '2019-07-21', 'open_session'),
  ('3', '2', '2019-07-21', 'send_message'),
  ('3', '2', '2019-07-21', 'end_session'),
  ('3', '5', '2019-07-21', 'open_session'),
  ('3', '5', '2019-07-21', 'scroll_down'),
  ('3', '5', '2019-07-21', 'end_session'),
  ('4', '3', '2019-06-25', 'open_session'),
  ('4', '3', '2019-06-25', 'end_session');
  
-- Writing your MySQL query statement below
SELECT DISTINCT user_id, COUNT(DISTINCT session_id) AS active_users
FROM Activity
WHERE DATEDIFF("2019-07-27", activity_date) < 30 
AND activity_date <= "2019-07-27"
GROUP BY user_id;

SELECT IFNULL(ROUND(COUNT(DISTINCT session_id)/COUNT(DISTINCT user_id), 2), 0) AS average_sessions_per_user
FROM Activity
WHERE DATEDIFF("2019-07-27", activity_date) < 30 
AND activity_date <= "2019-07-27";


