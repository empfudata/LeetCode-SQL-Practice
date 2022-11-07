-- 1083.Sales Analysis II
/*
Write an SQL query that reports the buyers who have bought S8 but not iPhone. 
Note that S8 and iPhone are products present in the Product table.

Product table:
+------------+--------------+------------+
| product_id | product_name | unit_price |
+------------+--------------+------------+
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |
+------------+--------------+------------+

Sales table:
+-----------+------------+----------+------------+----------+-------+
| seller_id | product_id | buyer_id | sale_date  | quantity | price |
+-----------+------------+----------+------------+----------+-------+
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
| 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| buyer_id    |
+-------------+
| 1           |
+-------------+
The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bought both.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Product;
CREATE TABLE Product (
  `product_id` INTEGER,
  `product_name` VARCHAR(6),
  `unit_price` INTEGER);

INSERT INTO Product (`product_id`, `product_name`, `unit_price`) VALUES
  ('1', 'S8', '1000'),
  ('2', 'G4', '800'),
  ('3', 'iPhone', '1400');

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales (
  `seller_id` INTEGER,
  `product_id` INTEGER,
  `buyer_id` INTEGER,
  `sale_date` DATETIME,
  `quantity` INTEGER,
  `price` INTEGER);

INSERT INTO Sales (`seller_id`, `product_id`, `buyer_id`, `sale_date`, `quantity`, `price`) VALUES
  ('1', '1', '1', '2019-01-21', '2', '2000'),
  ('1', '2', '2', '2019-02-17', '1', '800'),
  ('2', '1', '3', '2019-06-02', '1', '800'),
  ('3', '3', '3', '2019-05-13', '2', '2800');

-- Writing your MySQL query statement below
SELECT DISTINCT s.buyer_id
FROM Sales s LEFT JOIN Product p
ON s.product_id = p.product_id
WHERE p.product_name = "S8"
AND s.buyer_id NOT IN (SELECT s.buyer_id
					   FROM Sales s LEFT JOIN Product p
					   ON s.product_id = p.product_id
					   WHERE p.product_name IN ("G4", "iPhone"));

SELECT s.buyer_id
FROM Sales s LEFT JOIN Product p
ON s.product_id = p.product_id
GROUP BY buyer_id
HAVING SUM(product_name = 'S8') > 0 
AND SUM(product_name = 'G4') = 0
AND SUM(product_name = 'iPhone') = 0;