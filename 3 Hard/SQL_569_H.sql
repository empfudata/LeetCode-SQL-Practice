-- 569.Median Employee Salary
-- (Median is middle of a sorted list, more descriptive than mean as outliers skew mean)
/*
Write a SQL query to find the median salary of each company. 
Bonus points if you can solve it without using any built-in SQL functions.

Input:
Employee Table:
+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|1    | A          | 2341   |
|2    | A          | 341    |
|3    | A          | 15     |
|4    | A          | 15314  |
|5    | A          | 451    |
|6    | A          | 513    |
|7    | B          | 15     |
|8    | B          | 13     |
|9    | B          | 1154   |
|10   | B          | 1345   |
|11   | B          | 1221   |
|12   | B          | 234    |
|13   | C          | 2345   |
|14   | C          | 2645   |
|15   | C          | 2645   |
|16   | C          | 2652   |
|17   | C          | 65     |
+-----+------------+--------+
Output:
+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|5    | A          | 451    |
|6    | A          | 513    |
|12   | B          | 234    |
|9    | B          | 1154   |
|14   | C          | 2645   |
+-----+------------+--------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE  Employee (Id INT, Company VARCHAR(100), Salary INT);
INSERT INTO Employee (Id, Company, Salary) VALUES
	('1','A','2341'),
	('2','A','341'),
	('3','A','15'),
	('4','A','15314'),
	('5','A','451'),
	('6','A','513'),
	('7','B','15'),
	('8','B','13'),
	('9','B','1154'),
	('10','B','1345'),
	('11','B','1221'),
	('12','B','234'),
	('13','C','2345'),
	('14','C','2645'),
	('15','C','2645'),
	('16','C','2652'),
	('17','C','65');

-- Write your MySQL query statement below
SELECT Id, Company, Salary FROM
(SELECT *,
	   ROW_NUMBER() OVER(PARTITION BY company ORDER BY Salary) AS rank_num,
	   COUNT(*) OVER(PARTITION BY company) AS total_num 
FROM Employee) AS temp
WHERE (total_num % 2 = 0 AND rank_num = total_num/2)
   OR (total_num % 2 = 0 AND rank_num = total_num/2 + 1)
   OR (total_num % 2 = 1 AND rank_num = (total_num + 1)/2);

# Bonus Solution
SELECT t1.Id AS Id, t1.Company, t1.Salary 
FROM Employee AS t1 JOIN Employee AS t2 
ON t1.Company = t2.Company
GROUP BY t1.Id, t1.Company, t1.Salary 
HAVING abs(SUM(CASE WHEN t2.Salary<t1.Salary THEN 1 
					WHEN t2.Salary>t1.Salary THEN -1
					WHEN t2.Salary=t1.Salary AND t2.Id<t1.Id THEN 1 
                    WHEN t2.Salary=t1.Salary AND t2.Id>t1.Id THEN -1 
                    ELSE 0 
			   END)) <= 1
ORDER BY t1.Company, t1.Salary, t1.Id;