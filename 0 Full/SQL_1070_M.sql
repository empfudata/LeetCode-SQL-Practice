-- 1070.Product Sales Analysis III
/*
Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

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
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
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
SELECT product_id, year AS first_year, quantity, price
FROM (SELECT product_id, year, quantity, price, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year ASC) AS yr
	  FROM Sales) t
WHERE yr = 1;


SELECT product_id, product_name, year AS first_year, quantity, price
FROM (SELECT s.product_id, p.product_name, s.year, s.quantity, s.price, ROW_NUMBER() OVER (PARTITION BY s.product_id ORDER BY s.year ASC) AS yr
	  FROM Sales s LEFT JOIN Product p 
	  ON s.product_id = p.product_id) t
WHERE yr = 1;