-- 1179.Reformat Department Table
/*
Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+

Result table:
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  `id` INTEGER,
  `revenue` INTEGER,
  `month` VARCHAR(3));

INSERT INTO Department (`id`, `revenue`, `month`) VALUES
  ('1', '8000', 'Jan'),
  ('2', '9000', 'Jan'),
  ('3', '10000', 'Feb'),
  ('1', '7000', 'Feb'),
  ('1', '6000', 'Mar');
  
-- Writing your MySQL query statement below
SELECT id,
    SUM(CASE month WHEN 'Jan' THEN revenue END) AS Jan_Revenue,
    SUM(CASE month WHEN 'Feb' THEN revenue END) AS Feb_Revenue,
    SUM(CASE month WHEN 'Mar' THEN revenue END) AS Mar_Revenue,
    SUM(CASE month WHEN 'Apr' THEN revenue END) AS Apr_Revenue,
    SUM(CASE month WHEN 'May' THEN revenue END) AS May_Revenue,
    SUM(CASE month WHEN 'Jun' THEN revenue END) AS Jun_Revenue,
    SUM(CASE month WHEN 'Jul' THEN revenue END) AS Jul_Revenue,
    SUM(CASE month WHEN 'Aug' THEN revenue END) AS Aug_Revenue,
    SUM(CASE month WHEN 'Sep' THEN revenue END) AS Sep_Revenue,
    SUM(CASE month WHEN 'Oct' THEN revenue END) AS Oct_Revenue,
    SUM(CASE month WHEN 'Nov' THEN revenue END) AS Nov_Revenue,
    SUM(CASE month WHEN 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;
