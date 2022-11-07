-- 1069.Product Sales Analysis II
/*
Write an SQL query that reports the total quantity sold for every product id.

Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Result table:
+--------------+----------------+
| product_id   | total_quantity |
+--------------+----------------+
| 100          | 22             |
| 200          | 15             |
+--------------+----------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
`sale_id` INTEGER,
  `product_id` INTEGER,
  `year` INTEGER,
  `quantity` INTEGER,
  `price` INTEGER);

INSERT INTO Sales (`sale_id`, `product_id`, `year`, `quantity`, `price`) VALUES
  ('1', '100', '2008', '10', '5000'),
  ('2', '100', '2009', '12', '5000'),
  ('7', '200', '2011', '15', '9000');

DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
  `product_id` INTEGER,
  `product_name` VARCHAR(7));

INSERT INTO Product (`product_id`, `product_name`) VALUES
  ('100', 'Nokia'),
  ('200', 'Apple'),
  ('300', 'Samsung');
  
-- Writing your MySQL query statement below
SELECT  product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id


