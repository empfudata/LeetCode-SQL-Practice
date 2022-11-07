-- 1068. Product Sales Analysis I
/*
Write an SQL query that reports all product names of the products in the Sales table along with their selling year and price.

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
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
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
SELECT p.product_name, s.year, s.price
FROM Sales s LEFT JOIN Product p
ON s.product_id = p.product_id

