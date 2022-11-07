-- 1173.Immediate Food Delivery I
/*
Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.
If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it’s called scheduled.

Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 5           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-11                  |
| 4           | 3           | 2019-08-24 | 2019-08-26                  |
| 5           | 4           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
+-------------+-------------+------------+-----------------------------+

Result table:
+----------------------+
| immediate_percentage |
+----------------------+
| 33.33                |
+----------------------+
The orders with delivery id 2 and 3 are immediate while the others are scheduled.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (
  `delivery_id` INTEGER,
  `customer_id` INTEGER,
  `order_date` DATETIME,
  `customer_pref_delivery_date` DATETIME);

INSERT INTO Delivery (`delivery_id`, `customer_id`, `order_date`, `customer_pref_delivery_date`) VALUES
  ('1', '1', '2019-08-01', '2019-08-02'),
  ('2', '5', '2019-08-02', '2019-08-02'),
  ('3', '1', '2019-08-11', '2019-08-11'),
  ('4', '3', '2019-08-24', '2019-08-26'),
  ('5', '4', '2019-08-21', '2019-08-22'),
  ('6', '2', '2019-08-11', '2019-08-13');
  
-- Writing your MySQL query statement below
SELECT IFNULL(ROUND((SELECT COUNT(delivery_id)
					 FROM Delivery
					 WHERE order_date = customer_pref_delivery_date)
                     /COUNT(delivery_id)*100, 2), 0) AS immediate_percentage
FROM Delivery
