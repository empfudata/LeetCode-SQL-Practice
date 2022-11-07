-- 1045.Customers Who Bought All Products
/*
Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+

Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+

Result table:
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
The customers who bought all the products (5 and 6) are customers with id 1 and 3.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
  `customer_id` INTEGER,
  `product_key` INTEGER);

INSERT INTO Customer (`customer_id`, `product_key`) VALUES
  ('1', '5'),
  ('2', '6'),
  ('3', '5'),
  ('3', '6'),
  ('1', '6');

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
  `product_key` INTEGER,
  `ignore` VARCHAR(1));

INSERT INTO Product (`product_key`, `ignore`) VALUES
  ('5', '_'),
  ('6', '_');
  
-- Writing your MySQL query statement below
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);
