-- 579.Find Cumulative Salary of an Employee
/*
Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 months but exclude the most recent month.
The result should be displayed by ‘Id’ ascending, and then by ‘Month’ descending.

Employee table:
| Id | Month | Salary |
|----|-------|--------|
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 1  | 2     | 30     |
| 2  | 2     | 30     |
| 3  | 2     | 40     |
| 1  | 3     | 40     |
| 3  | 3     | 60     |
| 1  | 4     | 60     |
| 3  | 4     | 70     |

Result table:
| Id | Month | Salary |
|----|-------|--------|
| 1  | 3     | 90     |
| 1  | 2     | 50     |
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 3  | 3     | 100    |
| 3  | 2     | 40     |

Explanation:
Employee ‘1’ has 3 salary records for the following 3 months except the most recent month ‘4’: 
salary 40 for month ‘3’, 30 for month ‘2’ and 20 for month ‘1’ 
So the cumulative sum of salary of this employee over 3 months is 90(40+30+20), 50(30+20) and 20 respectively.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (`Id` INTEGER, `Month` INTEGER, `Salary` INTEGER);
INSERT INTO Employee (`Id`, `Month`, `Salary`) VALUES
	('1', '1', '20'),
	('2', '1', '20'),
	('1', '2', '30'),
	('2', '2', '30'),
	('3', '2', '40'),
	('1', '3', '40'),
	('3', '3', '60'),
	('1', '4', '60'),
	('3', '4', '70');

-- Writing your MySQL query statement below
SELECT e1.Id, MAX(e2.month) AS Month, SUM(e2.salary) as Salary
FROM Employee e1 INNER JOIN Employee e2
ON e1.Id = e2.Id
WHERE e2.Month BETWEEN (e1.Month-3) AND (e1.Month-1)
GROUP BY e1.Id, e1.Month
ORDER BY Id, Month DESC;
