-- 578. Get Highest Answer Rate Question
/*
Write a sql query to identify the question which has the highest answer rate.
Input:
+------+-----------+--------------+------------+-----------+------------+
| id   | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+
Output:
+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+
Explanation:
question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.

Note: The highest answer rate meaning is: answer number’s ratio in show number in the same question.
*/

-- Create SQL Schema
DROP TABLE IF EXISTS Survey_log;
CREATE TABLE Survey_log (
  `uid` INTEGER,
  `action` VARCHAR(6),
  `question_id` INTEGER,
  `answer_id` VARCHAR(6),
  `q_num` INTEGER,
  `timestamp` INTEGER
);

INSERT INTO Survey_log (`uid`, `action`, `question_id`, `answer_id`, `q_num`, `timestamp`) VALUES
    ('5', 'show', '285', 'null', '1', '123'),
	('5', 'answer', '285', '124124', '1', '124'),
	('5', 'show', '369', 'null', '2', '125'),
	('5', 'skip', '369', 'null', '2', '126');

-- Write your MySQL query statement below
-- #1
SELECT question_id AS survey_log 
FROM (SELECT question_id,
	  SUM(CASE WHEN action='show' THEN 1 ELSE 0 END) AS nb_show,
	  SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END) AS nb_answer 
   -- SUM(IF(action='show', 1, 0)) AS nb_show,
   -- SUM(IF(action='answer', 1, 0)) AS nb_answer 
	  FROM survey_log
	  GROUP BY question_id) AS temp
ORDER BY nb_answer/nb_show DESC -- 2 Qs have same ratio
LIMIT 1;

-- #2
WITH base AS (SELECT *, nb_answer/nb_show AS answer_rate
              FROM (SELECT question_id,
                    SUM(CASE WHEN action = "show" THEN 1 ELSE 0 END) AS nb_show,
                    SUM(CASE WHEN action = "answer" THEN 1 ELSE 0 END) AS nb_answer
                    FROM survey_log
                    GROUP BY question_id) as tmp)
SELECT question_id
FROM base
WHERE answer_rate IN (SELECT MAX(answer_rate) 
                      FROM base);
                      
-- #3
WITH base AS (SELECT question_id, answer_rate, DENSE_RANK() OVER(ORDER BY answer_rate DESC) AS answer_rank
			  FROM (SELECT question_id,
			  ROUND(SUM(CASE WHEN action = "answer" THEN 1 ELSE 0 END)/
		      SUM(CASE WHEN action = "show" THEN 1 ELSE 0 END), 0) AS answer_rate
			  FROM survey_log
			  GROUP BY question_id) as temp)
SELECT question_id
FROM base
WHERE answer_rank = 1;

