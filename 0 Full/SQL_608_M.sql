-- 608.Tree Node: print node id and type
/*
Write an SQL query to report the type of each node in the tree.
  •Return the result table ordered by id in ascending order.
Each node in the tree can be one of three types:
  • "Leaf": if the node is a leaf node.
  • "Root": if the node is the root of the tree.
  • "Inner": If the node is neither a leaf node nor a root node.
Input: 
Tree table:
+----+------+
| id | p_id |
+----+------+
| 1  | null |
| 2  | 1    |
| 3  | 1    |
| 4  | 2    |
| 5  | 2    |
+----+------+
Output: 
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+
Explanation: 
Node 1 is the root node because its parent node is null and it has child nodes 2 and 3.
Node 2 is an inner node because it has parent node 1 and child node 4 and 5.
Nodes 3, 4, and 5 are leaf nodes because they have parent nodes and they do not have child nodes.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS tree;
CREATE TABLE tree (id INT, p_id int);
INSERT INTO tree VALUES 
	(1,NULL), 
    (2,1), 
    (3,1), 
    (4,2), 
    (5,2);

-- Write your MySQL query statement below
SELECT t1.id, t1.p_id, t2.id, t2.p_id
FROM tree AS t1 LEFT JOIN tree AS t2 
ON t1.id = t2.p_id;
/*
# id, p_id, id, p_id
'1', NULL, '3', '1'
'1', NULL, '2', '1'
'2', '1', '5', '2'
'2', '1', '4', '2'
'3', '1', NULL, NULL
'4', '2', NULL, NULL
'5', '2', NULL, NULL
*/

SELECT DISTINCT t1.id, 
	   CASE WHEN ISNULL(t1.p_id) THEN 'Root' 
            WHEN ISNULL(t2.id) THEN 'Leaf' 
            ELSE 'Inner'
	   END AS 'type'
FROM tree AS t1 LEFT JOIN tree AS t2 
ON t1.id = t2.p_id





