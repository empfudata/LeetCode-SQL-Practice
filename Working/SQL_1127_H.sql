-- 1127.User Purchase Platform
/*
Write an SQL query to find the total number of users and the total amount spent using mobile only, 
desktop only and both mobile and desktop together for each date.

Spending table:
+---------+------------+----------+--------+
| user_id | spend_date | platform | amount |
+---------+------------+----------+--------+
| 1       | 2019-07-01 | mobile   | 100    |
| 1       | 2019-07-01 | desktop  | 100    |
| 2       | 2019-07-01 | mobile   | 100    |
| 2       | 2019-07-02 | mobile   | 100    |
| 3       | 2019-07-01 | desktop  | 100    |
| 3       | 2019-07-02 | desktop  | 100    |
+---------+------------+----------+--------+

Result table:
+------------+----------+--------------+-------------+
| spend_date | platform | total_amount | total_users |
+------------+----------+--------------+-------------+
| 2019-07-01 | desktop  | 100          | 1           |
| 2019-07-01 | mobile   | 100          | 1           |
| 2019-07-01 | both     | 200          | 1           |
| 2019-07-02 | desktop  | 100          | 1           |
| 2019-07-02 | mobile   | 100          | 1           |
| 2019-07-02 | both     | 0            | 0           |
+------------+----------+--------------+-------------+ 
On 2019-07-01, user 1 purchased using both desktop and mobile, user 2 purchased using mobile only and user 3 purchased using desktop only.
On 2019-07-02, user 2 purchased using mobile only, user 3 purchased using desktop only and no one purchased using both platforms.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Spending;
CREATE TABLE Spending (
  `user_id` INTEGER,
  `spend_date` DATETIME,
  `platform` VARCHAR(7),
  `amount` INTEGER);

INSERT INTO Spending (`user_id`, `spend_date`, `platform`, `amount`) VALUES
  ('1', '2019-07-01', 'mobile', '100'),
  ('1', '2019-07-01', 'desktop', '100'),
  ('2', '2019-07-01', 'mobile', '100'),
  ('2', '2019-07-02', 'mobile', '100'),
  ('3', '2019-07-01', 'desktop', '100'),
  ('3', '2019-07-02', 'desktop', '100');
  
-- Writing your MySQL query statement below

														
