 -- 586.Customer Placing the Largest Number of Orders 
/*
Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
The test cases are generated so that exactly one customer will have placed more orders than any other customer.

Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+

Result table: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (`order_number` INTEGER, `customer_number` INTEGER, `order_date` DATETIME, `required_date` DATETIME,
					 `shipped_date` DATETIME, `status` VARCHAR(6), `comment` CHAR(1));
INSERT INTO orders (`order_number`, `customer_number`, `order_date`, `required_date`, `shipped_date`, `status`, `comment`) VALUES
	('1', '1', '2017-04-09', '2017-04-13', '2017-04-12', 'Closed', ''),
	('2', '2', '2017-04-15', '2017-04-20', '2017-04-18', 'Closed', ''),
	('3', '3', '2017-04-16', '2017-04-25', '2017-04-20', 'Closed', ''),
	('4', '3', '2017-04-18', '2017-04-28', '2017-04-25', 'Closed', '');
    
-- Writing your MySQL query statement below
SELECT customer_number 
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

