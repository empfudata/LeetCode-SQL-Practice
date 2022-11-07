-- 1098.Unpopular Books
/*
Write an SQL query that reports the books that have sold less than 10 copies in the last year, 
excluding books that have been available for less than 1 month from today. Assume today is 2019-06-23.

Books table:
+---------+--------------------+----------------+
| book_id | name               | available_from |
+---------+--------------------+----------------+
| 1       | "Kalila And Demna" | 2010-01-01     |
| 2       | "28 Letters"       | 2012-05-12     |
| 3       | "The Hobbit"       | 2019-06-10     |
| 4       | "13 Reasons Why"   | 2019-06-01     |
| 5       | "The Hunger Games" | 2008-09-21     |
+---------+--------------------+----------------+

Orders table:
+----------+---------+----------+---------------+
| order_id | book_id | quantity | dispatch_date |
+----------+---------+----------+---------------+
| 1        | 1       | 2        | 2018-07-26    |
| 2        | 1       | 1        | 2018-11-05    |
| 3        | 3       | 8        | 2019-06-11    |
| 4        | 4       | 6        | 2019-06-05    |
| 5        | 4       | 5        | 2019-06-20    |
| 6        | 5       | 9        | 2009-02-02    |
| 7        | 5       | 8        | 2010-04-13    |
+----------+---------+----------+---------------+

Result table:
+-----------+--------------------+
| book_id   | name               |
+-----------+--------------------+
| 1         | "Kalila And Demna" |
| 2         | "28 Letters"       |
| 5         | "The Hunger Games" |
+-----------+--------------------+
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
  `book_id` INTEGER,
  `name` VARCHAR(18),
  `available_from` DATETIME);

INSERT INTO Books (`book_id`, `name`, `available_from`) VALUES
  ('1', 'Kalila And Demna', '2010-01-01'),
  ('2', '28 Letters', '2012-05-12'),
  ('3', 'The Hobbit', '2019-06-10'),
  ('4', '13 Reasons Why', '2019-06-01'),
  ('5', 'The Hunger Games', '2008-09-21');

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  `order_id` INTEGER,
  `book_id` INTEGER,
  `quantity` INTEGER,
  `dispatch_date` DATETIME);

INSERT INTO Orders (`order_id`, `book_id`, `quantity`, `dispatch_date`) VALUES
  ('1', '1', '2', '2018-07-26'),
  ('2', '1', '1', '2018-11-05'),
  ('3', '3', '8', '2019-06-11'),
  ('4', '4', '6', '2019-06-05'),
  ('5', '4', '5', '2019-06-20'),
  ('6', '5', '9', '2009-02-02'),
  ('7', '5', '8', '2010-04-13');
  
-- Writing your MySQL query statement below
#
SELECT b.book_id, b.name
FROM Books b LEFT JOIN Orders o
ON b.book_id = o.book_id
WHERE DATE_ADD(b.available_from, INTERVAL 1 MONTH) < "2019-06-23"
GROUP BY b.book_id, b.name
HAVING SUM(CASE WHEN DATE_ADD(o.dispatch_date, INTERVAL 1 YEAR) > '2019-06-23'
                THEN o.quantity
                ELSE 0 END) < 10;
-- HAVING SUM(IF(DATE_ADD(o.dispatch_date, INTERVAL 1 YEAR) > "2019-06-23", o.quantity, 0)) < 10;
##
SELECT b.book_id, b.name
FROM Books b LEFT JOIN (SELECT book_id, SUM(quantity) AS sold
						FROM Orders
                        WHERE dispatch_date BETWEEN "2018-06-23" AND "2019-06-23"
                        GROUP BY book_id) t
ON b.book_id = t.book_id
WHERE IFNULL(sold, 0) <= 10 AND available_from < DATE_SUB("2019-06-23", INTERVAL 1 MONTH);
###
SELECT book_id, name 
FROM Books
WHERE available_from < DATE_SUB("2019-06-23", INTERVAL 1 MONTH) 
AND book_id NOT IN (SELECT book_id
					FROM Orders 
                    WHERE dispatch_date > DATE_SUB("2019-06-23", INTERVAL 1 YEAR));