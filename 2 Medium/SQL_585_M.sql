-- 585. Investments in 2016
/*
Write a query to print the sum of all total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, 
for all policy holders who meet the following criteria:
1. Have the same TIV_2015 value as one or more other policyholders.
2. Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique).

Input:
+-----+----------+----------+-----+-----+
| PID | TIV_2015 | TIV_2016 | LAT | LON |
|-----|----------|----------|-----|-----|
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+

Output:
+----------+
| TIV_2016 |
|----------|
| 45.00    |
+----------+
*/

-- Creat SQL Schema
DROP TABLE IF EXISTS Insurance;
CREATE TABLE insurance (
  `PID` INTEGER,
  `TIV_2015` INTEGER,
  `TIV_2016` INTEGER,
  `LAT` INTEGER,
  `LON` INTEGER
);

INSERT INTO insurance (`PID`, `TIV_2015`, `TIV_2016`, `LAT`, `LON`) VALUES
    ('1', '10', '5', '10', '10'),
    ('2', '20', '20', '20', '20'),
    ('3', '10', '30', '20', '20'),
    ('4', '10', '40', '40', '40');

-- Write your MySQL query statement beloww
SELECT CAST(SUM(TIV_2016) AS DECIMAL(4,2)) AS TIV_2016
FROM Insurance
WHERE TIV_2015 IN (SELECT TIV_2015
				   FROM Insurance
				   GROUP BY TIV_2015
				   HAVING COUNT(*) > 1)
AND (LAT, LON) IN (SELECT LAT, LON
				   FROM Insurance
				   GROUP BY LAT, LON
				   Having COUNT(*) = 1);


