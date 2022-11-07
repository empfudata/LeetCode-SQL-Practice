-- 607.Sales Person
/*
Write an SQL query to report the names of all the salespersons 
who did not have any orders related to the company with the name "RED".

SalesPerson table:
+----------+------+--------+-----------------+------------+
| sales_id | name | salary | commission_rate | hire_date  |
+----------+------+--------+-----------------+------------+
| 1        | John | 100000 | 6               | 4/1/2006   |
| 2        | Amy  | 12000  | 5               | 5/1/2010   |
| 3        | Mark | 65000  | 12              | 12/25/2008 |
| 4        | Pam  | 25000  | 25              | 1/1/2005   |
| 5        | Alex | 5000   | 10              | 2/3/2007   |
+----------+------+--------+-----------------+------------+
Company table:
+--------+--------+----------+
| com_id | name   | city     |
+--------+--------+----------+
| 1      | RED    | Boston   |
| 2      | ORANGE | New York |
| 3      | YELLOW | Boston   |
| 4      | GREEN  | Austin   |
+--------+--------+----------+
Orders table:
+----------+------------+--------+----------+--------+
| order_id | order_date | com_id | sales_id | amount |
+----------+------------+--------+----------+--------+
| 1        | 1/1/2014   | 3      | 4        | 10000  |
| 2        | 2/1/2014   | 4      | 5        | 5000   |
| 3        | 3/1/2014   | 1      | 1        | 50000  |
| 4        | 4/1/2014   | 1      | 4        | 25000  |
+----------+------------+--------+----------+--------+

Result table: 
+------+
| name |
+------+
| Amy  |
| Mark |
| Alex |
+------+
Explanation: 
According to orders 3 and 4 in the Orders table, it is easy to tell that only salesperson John and Pam have sales to company RED, 
so we report all the other names in the table salesperson.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS salesperson;
CREATE TABLE salesperson (`sales_id` INTEGER, `name` VARCHAR(4), `salary` INTEGER, `commission_rate` INTEGER, `hire_date` DATETIME);
INSERT INTO salesperson (`sales_id`, `name`, `salary`, `commission_rate`, `hire_date`) VALUES
	('1', 'John', '100000', '6', '2006-4-1'),
	('2', 'Amy', '120000', '5', '2010-5-1'),
	('3', 'Mark', '65000', '12', '2008-12-25'),
	('4', 'Pam', '25000', '25', '2005-1-1'),
	('5', 'Alex', '50000', '10', '2007-2-3');

DROP TABLE IF EXISTS company;
CREATE TABLE company (`com_id` INTEGER, `name` VARCHAR(6), `city` VARCHAR(8));
INSERT INTO company (`com_id`, `name`, `city`) VALUES
	('1', 'RED', 'Boston'),
	('2', 'ORANGE', 'New York'),
	('3', 'YELLOW', 'Boston'),
	('4', 'GREEN', 'Austin');
    
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (`order_id` INTEGER, `order_date` DATETIME, `com_id` INTEGER, `sales_id` INTEGER, `amount` INTEGER);
INSERT INTO orders (`order_id`, `order_date`, `com_id`, `sales_id`, `amount`) VALUES
	('1', '2014-1-1', '3', '4', '100000'),
	('2', '2014-2-1', '4', '5', '5000'),
	('3', '2014-3-1', '1', '1', '50000'),
	('4', '2014-4-1', '1', '4', '25000');
    
-- Writing your MySQL query statement below
SELECT name
FROM salesperson
WHERE sales_id NOT IN(SELECT o.sales_id
					  FROM orders o LEFT JOIN company c 
					  ON o.com_id = c.com_id
					  WHERE c.name = "RED");
