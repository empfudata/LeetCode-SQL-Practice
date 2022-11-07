-- 570.Managers with at Least 5 Direct Reports
/*
Write a SQL query that finds out managers with at least 5 direct report.

Employee table:
+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	  |A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+

Result table:
+-------+
| Name  |
+-------+
| John  |
+-------+
Note:
No one would report to himself.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (`Id` INTEGER, `Name` VARCHAR(5), `Department` VARCHAR(1), `ManagerId` VARCHAR(4));
INSERT INTO Employee (`Id`, `Name`, `Department`, `ManagerId`) VALUES
	('101', 'John', 'A', 'null'),
	('102', 'Dan', 'A', '101'),
	('103', 'James', 'A', '101'),
	('104', 'Amy', 'A', '101'),
	('105', 'Anne', 'A', '101'),
	('106', 'Ron', 'B', '101');

-- Writing your MySQL query statement below
-- Check
SELECT e1.*, e2.* 
FROM employee e1 INNER JOIN employee e2
ON e1.Id = e2.ManagerId;

-- Final
SELECT e1.name
FROM employee e1 INNER JOIN employee e2
ON e1.Id = e2.ManagerId
GROUP BY e1.name
HAVING COUNT(e2.id) >= 5;

