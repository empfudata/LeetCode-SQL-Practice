-- 176. Second Highest Salary
/*
Write an SQL query to report the second highest salary from the Employee table. 
If there is no second highest salary, the query should report null.
Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (id INT, salary INT);
INSERT INTO Employee (id, salary) VALUES
    ('1', '100'),
    ('2', '200'),
    ('3', '300'),
    ('4', '300');
    
-- Write your MySQL query statement below
-- #1 Where
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary)
				FROM Employee);
                
-- #2 
SELECT IFNULL((SELECT DISTINCT salary 
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary; 
        -- LIMIT 1, 1 (# rows to skip (offset), # rows to show)
        
-- #3 
SELECT IFNULL((SELECT DISTINCT salary 
               FROM (SELECT salary,
	                 DENSE_RANK() OVER(ORDER BY salary DESC) AS 'nb_dense_rank'
					 FROM Employee) AS temp
			   WHERE nb_dense_rank = 2), NULL) AS SecondHighestSalary;

