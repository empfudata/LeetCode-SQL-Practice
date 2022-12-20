-- Day 2 LeetCode SQL Practice 

-- #196
-- Creating SQL Schema
DROP TABLE IF EXISTS Person;
CREATE TABLE Person (Id INT, Email VARCHAR(255));
INSERT INTO Person (id, email) VALUES
	('1', 'john@example.com'),
	('2', 'bob@example.com'),
    ('3', 'john@example.com');

-- Writing your MySQL statement below

-- #197
-- Creating SQL Schema
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (id INT, recordDate DATE, temperature INT);
INSERT INTO Weather (id, recordDate, temperature) VALUES
    (1,'2015-01-01',10),   
	(2,'2015-01-02',25), 
	(3,'2015-01-03',20),   
	(4,'2015-01-04',30);   

-- Write your MySQL query statement below

-- #262
 -- Creating SQL Schema
DROP TABLE IF EXISTS Trips;
CREATE TABLE Trips (`Id` INT, `Client_Id` INT, `Driver_Id` INT, `City_Id` INT, `Status` VARCHAR(19), `Request_at` DATETIME);
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
CREATE TABLE Users (`Users_Id` INT, `Banned` VARCHAR(3), `Role` VARCHAR(6));
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

-- #511
-- Creating MySQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date DATE, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES 
	('1', '2', '2016-03-01', '5'),
	('1', '2', '2016-05-02', '6'),
	('2', '3', '2017-06-25', '1'),
	('3', '1', '2016-03-02', '0'),
	('3', '4', '2018-07-03', '5');
    
-- Writing your MySQL query statement below

-- #512
-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date DATE, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES 
	('1', '2', '2016-03-01', '5'),
	('1', '2', '2016-05-02', '6'),
	('2', '3', '2017-06-25', '1'),
	('3', '1', '2016-03-02', '0'),
	('3', '4', '2018-07-03', '5');
    
-- Writing your MySQL query statement below

-- #534
-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date date, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
    (1, 2, "2016-03-01", 5),
    (1, 2, "2016-05-02", 6),
    (1, 3, "2017-06-25", 1),
    (3, 1, "2016-03-02", 0),
    (3, 4, "2018-07-03", 5);

-- Write your MySQL query statement below

-- #550
-- Creating SQL Schema
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (player_id INT, device_id INT, event_date date, games_played INT);
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
    (1, 2, "2016-03-01", 5),
    (1, 2, "2016-03-02", 6),
    (2, 3, "2017-06-25", 1),
    (3, 1, "2016-03-02", 0),
    (3, 4, "2018-07-03", 5);

-- Write your MySQL query statement below

-- #569
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE  Employee (Id INT, Company VARCHAR(100), Salary INT);
INSERT INTO Employee (Id, Company, Salary) VALUES
	('1','A','2341'),
	('2','A','341'),
	('3','A','15'),
	('4','A','15314'),
	('5','A','451'),
	('6','A','513'),
	('7','B','15'),
	('8','B','13'),
	('9','B','1154'),
	('10','B','1345'),
	('11','B','1221'),
	('12','B','234'),
	('13','C','2345'),
	('14','C','2645'),
	('15','C','2645'),
	('16','C','2652'),
	('17','C','65');

-- Write your MySQL query statement below

-- #570
-- Creating SQL Schema
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (`Id` INT, `Name` VARCHAR(5), `Department` VARCHAR(1), `ManagerId` VARCHAR(4));
INSERT INTO Employee (`Id`, `Name`, `Department`, `ManagerId`) VALUES
	('101', 'John', 'A', 'null'),
	('102', 'Dan', 'A', '101'),
	('103', 'James', 'A', '101'),
	('104', 'Amy', 'A', '101'),
	('105', 'Anne', 'A', '101'),
	('106', 'Ron', 'B', '101');

-- Writing your MySQL query statement below

-- #571
-- Creating SQL Schema
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers (`Number` INT, `Frequency` INT);
INSERT INTO Numbers (`Number`, `Frequency`) VALUES
	('0', '7'),
	('1', '1'),
	('2', '3'),
	('3', '1');

-- Writing your MySQL query statement below
