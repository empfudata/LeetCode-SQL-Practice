-- 262.Trips and Users
/*
The cancellation rate is computed by dividing the number of canceled (by client or driver) 
requests with unbanned users by the total number of requests with unbanned users on that day.

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) 
each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

Trips table:
+----+-----------+-----------+---------+---------------------+------------+
| id | client_id | driver_id | city_id | status              | request_at |
+----+-----------+-----------+---------+---------------------+------------+
| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
+----+-----------+-----------+---------+---------------------+------------+
Users table:
+----------+--------+--------+
| users_id | banned | role   |
+----------+--------+--------+
| 1        | No     | client |
| 2        | Yes    | client |
| 3        | No     | client |
| 4        | No     | client |
| 10       | No     | driver |
| 11       | No     | driver |
| 12       | No     | driver |
| 13       | No     | driver |
+----------+--------+--------+

Result table: 
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+
Explanation: 
On 2013-10-01:
  - There were 4 requests in total, 2 of which were canceled.
  - However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
  - Hence there are 3 unbanned requests in total, 1 of which was canceled.
  - The Cancellation Rate is (1 / 3) = 0.33
On 2013-10-02:
  - There were 3 requests in total, 0 of which were canceled.
  - The request with Id=6 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned requests in total, 0 of which were canceled.
  - The Cancellation Rate is (0 / 2) = 0.00
On 2013-10-03:
  - There were 3 requests in total, 1 of which was canceled.
  - The request with Id=8 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned request in total, 1 of which were canceled.
  - The Cancellation Rate is (1 / 2) = 0.50
  */
  
  -- Creating SQL Schema
DROP TABLE IF EXISTS Trips;
CREATE TABLE Trips (`Id` INTEGER, `Client_Id` INTEGER, `Driver_Id` INTEGER, `City_Id` INTEGER, `Status` VARCHAR(19), `Request_at` DATETIME);
INSERT INTO Trips (`Id`, `Client_Id`, `Driver_Id`, `City_Id`, `Status`, `Request_at`) VALUES
	('1', '1', '10', '1', 'completed', '2013-10-01'),
	('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01'),
	('3', '3', '12', '6', 'completed', '2013-10-01'),
	('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01'),
	('5', '1', '10', '1', 'completed', '2013-10-02'),
	('6', '2', '11', '6', 'completed', '2013-10-02'),
	('7', '3', '12', '6', 'completed', '2013-10-02'),
	('8', '2', '12', '12', 'completed', '2013-10-03'),
	('9', '3', '10', '12', 'completed', '2013-10-03'),
	('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (`Users_Id` INTEGER, `Banned` VARCHAR(3), `Role` VARCHAR(6));
INSERT INTO Users (`Users_Id`, `Banned`, `Role`) VALUES
	('1', 'No', 'client'),
	('2', 'Yes', 'client'),
	('3', 'No', 'client'),
	('4', 'No', 'client'),
	('10', 'No', 'driver'),
	('11', 'No', 'driver'),
	('12', 'No', 'driver'),
	('13', 'No', 'driver');
    
-- Writing your MySQL query statement below
SELECT DATE_FORMAT(t.request_at, '%Y-%m-%d') AS Day, 
ROUND(SUM(CASE WHEN t.status != 'completed' THEN 1 ELSE 0 END)/COUNT(*), 2) AS "Cancellation Rate"
FROM Trips t INNER JOIN Users u1 
ON t.client_id = u1.users_id AND u1.banned = "No"
INNER JOIN Users u2
ON t.driver_id = u2.users_id AND u2.banned = "No"
WHERE t.request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY t.request_at
ORDER BY Day;
