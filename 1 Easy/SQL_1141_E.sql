-- 1141.User Activity for the Past 30 Days I
/*
Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
A user was active on some day if he/she made at least one activity on that day.

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
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+

Result table:
+------------+--------------+ 
| day        | active_users |
+------------+--------------+ 
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+ 
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
  ('4', '3', '2019-06-25', 'open_session'),
  ('4', '3', '2019-06-25', 'end_session');
  
-- Writing your MySQL query statement below
SELECT DATE(activity_date) AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE DATEDIFF("2019-07-27", activity_date) < 30 
AND activity_date <= "2019-07-27"
GROUP BY activity_date

