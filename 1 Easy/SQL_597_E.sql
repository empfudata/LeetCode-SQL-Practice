-- 597.Friend Requests I: Overall Acceptance Rate
/*
Write a query to find the overall acceptance rate of requests rounded to 2 decimals, 
which is the number of acceptance divide the number of requests.

friend_request table:
| sender_id | send_to_id |request_date|
|-----------|------------|------------|
| 1         | 2          | 2016_06-01 |
| 1         | 3          | 2016_06-01 |
| 1         | 4          | 2016_06-01 |
| 2         | 3          | 2016_06-02 |
| 3         | 4          | 2016-06-09 |

request_accepted table:
| requester_id | accepter_id |accept_date |
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
| 3            | 4           | 2016-06-10 |

result table:
|accept_rate|
|-----------|
|       0.80|

Note:
The accepted requests are not necessarily from the table friend_request. 
In this case, you just need to simply count the total accepted requests 
(no matter whether they are in the original requests), 
and divide it by the number of requests to get the acceptance rate.

It is possible that a sender sends multiple requests to the same receiver, 
and a request could be accepted more than once. 
In this case, the ‘duplicated’ requests or acceptances are only counted once.
If there is no requests at all, you should return 0.00 as the accept_rate.
*/

-- Creating SQL Schema
DROP TABLE IF EXISTS friend_request;
CREATE TABLE friend_request (`sender_id` INTEGER, `send_to_id` INTEGER, `request_date` VARCHAR(10));
INSERT INTO friend_request (`sender_id`, `send_to_id`, `request_date`) VALUES
	('1', '2', '2016_06-01'),
	('1', '3', '2016_06-01'),
	('1', '4', '2016_06-01'),
	('2', '3', '2016_06-02'),
	('3', '4', '2016-06-09');

DROP TABLE IF EXISTS request_accepted;
CREATE TABLE request_accepted (`requester_id` INTEGER, `accepter_id` INTEGER, `accept_date` VARCHAR(10));
INSERT INTO request_accepted (`requester_id`, `accepter_id`, `accept_date`) VALUES
	('1', '2', '2016_06-03'),
	('1', '3', '2016-06-08'),
	('2', '3', '2016-06-08'),
	('3', '4', '2016-06-09'),
	('3', '4', '2016-06-10');
  
-- Writing your MySQL query statement below
SELECT ROUND(IFNULL(
(SELECT COUNT(DISTINCT requester_id, accepter_id)
FROM request_accepted)
/(SELECT COUNT(DISTINCT sender_id, send_to_id) 
FROM friend_request), 0), 2) AS accept_rate;
