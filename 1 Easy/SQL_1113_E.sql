-- 1113.Reported Posts
/*
Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05.

Actions table:
+---------+---------+-------------+--------+--------+
| user_id | post_id | action_date | action | extra  |
+---------+---------+-------------+--------+--------+
| 1       | 1       | 2019-07-01  | view   | null   |
| 1       | 1       | 2019-07-01  | like   | null   |
| 1       | 1       | 2019-07-01  | share  | null   |
| 2       | 4       | 2019-07-04  | view   | null   |
| 2       | 4       | 2019-07-04  | report | spam   |
| 3       | 4       | 2019-07-04  | view   | null   |
| 3       | 4       | 2019-07-04  | report | spam   |
| 4       | 3       | 2019-07-02  | view   | null   |
| 4       | 3       | 2019-07-02  | report | spam   |
| 5       | 2       | 2019-07-04  | view   | null   |
| 5       | 2       | 2019-07-04  | report | racism |
| 5       | 5       | 2019-07-04  | view   | null   |
| 5       | 5       | 2019-07-04  | report | racism |
+---------+---------+-------------+--------+--------+

Result table:
+---------------+--------------+
| report_reason | report_count |
+---------------+--------------+
| spam          | 1            |
| racism        | 2            |
+---------------+--------------+ 
Note that we only care about report reasons with non zero number of reports.
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
  ('2', '4', '2019-07-04', 'view', 'null'),
  ('2', '4', '2019-07-04', 'report', 'spam'),
  ('3', '4', '2019-07-04', 'view', 'null'),
  ('3', '4', '2019-07-04', 'report', 'spam'),
  ('4', '3', '2019-07-02', 'view', 'null'),
  ('4', '3', '2019-07-02', 'report', 'spam'),
  ('5', '2', '2019-07-04', 'view', 'null'),
  ('5', '2', '2019-07-04', 'report', 'racism'),
  ('5', '5', '2019-07-04', 'view', 'null'),
  ('5', '5', '2019-07-04', 'report', 'racism');
  
-- Writing your MySQL query statement below
SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE DATEDIFF('2019-07-05', action_date) = 1 
AND action = "report"
AND extra != "null"
GROUP BY report_reason;
    
