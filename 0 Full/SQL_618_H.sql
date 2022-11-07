-- 618.Students Report By Geography
/*
Pivot the continent column in this table so that each name is sorted alphabetically 
and displayed underneath its corresponding continent. 
The output headers should be America, Asia and Europe respectively. 
It is guaranteed that the student number from America is no less than either Asia or Europe.

| name   | continent |
|--------|-----------|
| Jack   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jane   | America   |


| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    |      |        |

Follow-up: If it is unknown which continent has the most students, can you write a query to generate the student report?
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS student;
CREATE TABLE student (`name` VARCHAR(6), `continent` VARCHAR(7));
INSERT INTO student (`name`, `continent`) VALUES
	('Jack', 'America'),
	('Pascal', 'Europe'),
	('Xi', 'Asia'),
	('Jane', 'America');
    
-- Writing your MySQL query statement below
SELECT America, Asia, Europe
FROM(SELECT row_num,
		    MAX(CASE WHEN continent = 'America' THEN name END )AS America,
			MAX(CASE WHEN continent = 'Europe' THEN name END )AS Europe,
			MAX(CASE WHEN continent = 'Asia' THEN name END )AS Asia
	 FROM (SELECT *,
				  ROW_NUMBER()OVER(PARTITION BY continent ORDER BY name) AS row_num
		   FROM student) AS SOURCE
GROUP BY row_num)temp;
