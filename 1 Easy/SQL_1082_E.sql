-- 1082.Sales Analysis I
/*
Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

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
| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| seller_id   |
+-------------+
| 1           |
| 3           |
+-------------+
Both sellers with id 1 and 3 sold products with the most total price of 2800.
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
  ('2', '2', '3', '2019-06-02', '1', '800'),
  ('3', '3', '4', '2019-05-13', '2', '2800');
  
-- Writing your MySQL query statement below
SELECT seller_id 
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
					 FROM Sales
					 GROUP BY seller_id
                     ORDER BY SUM(price) DESC
                     LIMIT 1);
      