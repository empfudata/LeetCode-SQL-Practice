-- 577. Employee Bonus 
/*
Select all employee's name and bonus whose bonus is < 1000.

Employee table:
+-------+--------+-----------+--------+
| empId |  name  | supervisor| salary |
+-------+--------+-----------+--------+
|   1   | John   |  3        | 1000   |
|   2   | Dan    |  3        | 2000   |
|   3   | Brad   |  null     | 4000   |
|   4   | Thomas |  3        | 4000   |
+-------+--------+-----------+--------+

Bonus table:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+

Result table:
+-------+-------+
| name  | bonus |
+-------+-------+
| John  | null  |
| Dan   | 500   |
| Brad  | null  |
+-------+-------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (`empId` INTEGER, `name` VARCHAR(6), `supervisor` VARCHAR(4), `salary` INTEGER);
INSERT INTO Employee (`empId`, `name`, `supervisor`, `salary`) VALUES
	('1', 'John', '3', '1000'),
	('2', 'Dan', '3', '2000'),
	('3', 'Brad', 'null', '4000'),
	('4', 'Thomas', '3', '4000');

DROP TABLE IF EXISTS Bonus;
CREATE TABLE Bonus (`empId` INTEGER, `bonus` INTEGER);
INSERT INTO Bonus (`empId`, `bonus`)VALUES
	('2', '500'),
	('4', '2000');
  
-- Writing your MySQL query statement below
SELECT e.name, b.bonus
FROM employee e LEFT JOIN bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR bonus IS NULL;