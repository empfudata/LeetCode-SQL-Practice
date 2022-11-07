-- 627.Swap Salary
/*
Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
with a single update statement and no intermediate temporary tables.
Note that you must write a single update statement, do not write any select statement for this problem.

Salary table:
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
+----+------+-----+--------+

Result table: 
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
+----+------+-----+--------+

Explanation: 
(1, A) and (3, C) were changed from 'm' to 'f'.
(2, B) and (4, D) were changed from 'f' to 'm'.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS salary;
CREATE TABLE salary (`id` INTEGER, `name` VARCHAR(1), `sex` VARCHAR(1), `salary` INTEGER);
INSERT INTO salary (`id`, `name`, `sex`, `salary`) VALUES
	('1', 'A', 'm', '2500'),
	('2', 'B', 'f', '1500'),
	('3', 'C', 'm', '5500'),
	('4', 'D', 'f', '500');
    
-- Writing your MySQL query statement below
UPDATE salary
SET sex = CASE sex
		  WHEN 'm' THEN 'f'
		  ELSE 'm'
		  END;

SELECT * FROM salary;
