-- 601. Human Traffic of Stadium
/*
Write an SQL query to display the recORds with three OR mORe rows with cONsecutive id's, 
AND the number of people is greater than OR equal to 100 fOR each.
  • Return the result table ORdered by visit_date in AScending ORder.
Input: 
Stadium table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
Output: 
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
ExplanatiON: 
The four rows with ids 5, 6, 7, AND 8 have cONsecutive ids AND each of them hAS >= 100 people attended. 
Note that row 8 wAS included even though the visit_date wAS not the next day after row 7.
The rows with ids 2 AND 3 are not included because we need at leASt three cONsecutive ids.
*/

-- Creating SQL Schema
create table stadium (id int, visit_date date null, people int);
insert into stadium (id, visit_date, people) values
	('1','2017-01-01','10'),
	('2','2017-01-02','109'),
	('3','2017-01-03','150'),
	('4','2017-01-04','99'),
	('5','2017-01-05','145'),
	('6','2017-01-06','1455'),
	('7','2017-01-07','199'),
	('8','2017-01-08','188');

-- Write your MySQL query statement below
WITH temp AS(
SELECT a.visit_date AS date1,
b.visit_date AS date2,
c.visit_date AS date3
FROM stadium AS a
LEFT JOIN stadium AS b 
ON DATEDIFF(a.visit_date, b.visit_date) = -1
LEFT JOIN stadium AS c
ON DATEDIFF(b.visit_date, c.visit_date) = -1
WHERE a.people >= 100
AND b.people >= 100
AND c.people >= 100
)
SELECT date1 AS total_date FROM temp
UNION
SELECT date2 AS total_date FROM temp
UNION
SELECT date3 AS total_date FROM temp;

SELECT a.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 1, b is day 2, c is day 3
    ON datediff(a.visit_date,b.visit_date) = -1
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -1
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100
UNION
SELECT b.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 1, b is day 2, c is day 3
    ON datediff(a.visit_date,b.visit_date) = -1
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -1
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100
UNION
SELECT c.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 1, b is day 2, c is day 3
    ON datediff(a.visit_date,b.visit_date) = -1
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -1
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100;

-- #1
SELECT distinct a.visit_date
FROM stadium AS a, stadium AS b, stadium AS c
WHERE (
    --  a is day 1, b is day 2, c is day 3
    (datediff(a.visit_date,b.visit_date) = -1 AND datediff(b.visit_date,c.visit_date) = -1)
    --  a is day 2, b is day 1, c is day 3
    OR (datediff(a.visit_date,b.visit_date) = 1 AND datediff(b.visit_date,c.visit_date) = -2)
    --  a is day 3, b is day 1, c is day 2
    OR (datediff(a.visit_date,b.visit_date) = 2 AND datediff(b.visit_date,c.visit_date) = -1)
) AND a.people >= 100 AND b.people >= 100 AND c.people >= 100
ORDER BY a.visit_date;

-- #2 why dONt change selct a/b/c???
SELECT a.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 1, b is day 2, c is day 3
    ON datediff(a.visit_date,b.visit_date) = -1
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -1
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100
UNION
SELECT a.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 2, b is day 1, c is day 3
    ON datediff(a.visit_date,b.visit_date) = 1
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -2
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100
UNION
SELECT a.visit_date
FROM stadium AS a
LEFT JOIN stadium AS b
    --  a is day 3, b is day 1, c is day 2
    ON datediff(a.visit_date,b.visit_date) = 2
LEFT JOIN stadium AS c
    ON datediff(b.visit_date,c.visit_date) = -1
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100;
