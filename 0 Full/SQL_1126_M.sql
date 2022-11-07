-- 1126.Active Businesses
/*
Write an SQL query to find all active businesses.
An active business is a business that has more than one event type with occurences 
greater than the average occurences of that event type among all businesses.

Events table:
+-------------+------------+------------+
| business_id | event_type | occurences |
+-------------+------------+------------+
| 1           | reviews    | 7          |
| 3           | reviews    | 3          |
| 1           | ads        | 11         |
| 2           | ads        | 7          |
| 3           | ads        | 6          |
| 1           | page views | 3          |
| 2           | page views | 12         |
+-------------+------------+------------+

Result table:
+-------------+
| business_id |
+-------------+
| 1           |
+-------------+ 
Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.
Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Events;
CREATE TABLE Events (
  `business_id` INTEGER,
  `event_type` VARCHAR(10),
  `occurences` INTEGER);

INSERT INTO Events (`business_id`, `event_type`, `occurences`) VALUES
  ('1', 'reviews', '7'),
  ('3', 'reviews', '3'),
  ('1', 'ads', '11'),
  ('2', 'ads', '7'),
  ('3', 'ads', '6'),
  ('1', 'page views', '3'),
  ('2', 'page views', '12');
  
-- Writing your MySQL query statement below
#
SELECT b.business_id
FROM Events b LEFT JOIN (SELECT event_type, CAST(AVG(occurences) AS FLOAT) AS avg_occurences
						 FROM Events
						 GROUP BY event_type) t
ON b.event_type = t.event_type
GROUP BY business_id
HAVING SUM(IF(b.occurences > t.avg_occurences, 1, 0)) > 1;
##
SELECT business_id
FROM (SELECT *, AVG(CAST(occurences AS FLOAT)) OVER (PARTITION BY event_type) AS avg_occurences
	  FROM Events) t
GROUP BY business_id
HAVING SUM(IF(occurences > avg_occurences, 1, 0)) > 1;
