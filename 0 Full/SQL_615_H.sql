-- 615.Average Salary: Departments VS Company
/*
write a query to display the comparison result (higher/lower/same) of the average salary of employees 
in a department to the company’s average salary.
Input:
Salary Table:
+----+-------------+--------+------------+
| id | employee_id | amount | pay_date   |
|----|-------------|--------|------------|
| 1  | 1           | 9000   | 2017-03-31 |
| 2  | 2           | 6000   | 2017-03-31 |
| 3  | 3           | 10000  | 2017-03-31 |
| 4  | 1           | 7000   | 2017-02-28 |
| 5  | 2           | 6000   | 2017-02-28 |
| 6  | 3           | 8000   | 2017-02-28 |
+----+-------------+--------+------------+
Employee Table:
+-------------+---------------+
| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |
+-------------+---------------+
Output:
+-----------+---------------+-------------+
| pay_month | department_id | comparison  |
|-----------|---------------|-------------|
| 2017-03   | 1             | higher      |
| 2017-03   | 2             | lower       |
| 2017-02   | 1             | same        |
| 2017-02   | 2             | same        |
+-----------+---------------+-------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS salary;
CREATE TABLE salary (id int, employee_id INT, amount INT, pay_date DATE);
INSERT INTO salary (id, employee_id, amount, pay_date) VALUES
	('1','1','9000','2017/03/31'),
	('2','2','6000','2017/03/31'),
	('3','3','10000','2017/03/31'),
	('4','1','7000','2017/02/28'),
	('5','2','6000','2017/02/28'),
	('6','3','8000','2017/02/28');
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (employee_id INT, department_id INT);
INSERT INTO employee (employee_id, department_id) VALUES
	('1','1'),
	('2','2'),
	('3','2');

-- Write your MySQL query statement below
SELECT LEFT(pay_date, 7) AS pay_month, department_id,
	   CASE WHEN department_avg > company_avg THEN 'higher'
	        WHEN department_avg < company_avg THEN 'lower'
			ELSE 'same' 
            END AS comparison
FROM(SELECT DISTINCT pay_date, department_id,
			AVG(amount) OVER(PARTITION BY pay_date) AS company_avg,
			AVG(amount) OVER(PARTITION BY pay_date, department_id) AS department_avg
			FROM salary AS s LEFT JOIN employee AS e
			ON s.employee_id = e. employee_id) AS temp
ORDER BY pay_month DESC;
