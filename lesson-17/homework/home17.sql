

DROP TABLE IF EXISTS #RegionSales;
CREATE TABLE #RegionSales (
  Region VARCHAR(100),
  Distributor VARCHAR(100),
  Sales INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);
SELECT r.Region, d.Distributor, ISNULL(rs.Sales, 0) AS Sales
FROM (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN #RegionSales rs ON r.Region = rs.Region AND d.Distributor = rs.Distributor
ORDER BY r.Region, d.Distributor;

CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  department VARCHAR(255),
  managerId INT
);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);
SELECT name
FROM Employee
WHERE id IN (
  SELECT managerId
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) >= 5
);

CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(40),
  product_category VARCHAR(40)
);
CREATE TABLE Orders (
  product_id INT,
  order_date DATE,
  unit INT
);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count] MONEY NOT NULL,
  Vendor VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');
SELECT CustomerID, Vendor
FROM (
  SELECT CustomerID, Vendor, COUNT(*) AS cnt,
         RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
  FROM Orders
  GROUP BY CustomerID, Vendor
) t
WHERE rnk = 1;

DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2, @isPrime BIT = 1;
WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @isPrime = 0;
        BREAK;
    END
    SET @i += 1;
END
IF @Check_Prime < 2
    PRINT 'This number is not prime';
ELSE IF @isPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';

CREATE TABLE Device (
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');
WITH CTE AS (
  SELECT Device_id, Locations, COUNT(*) AS cnt
  FROM Device
  GROUP BY Device_id, Locations
),
CTE2 AS (
  SELECT *,
         RANK() OVER (PARTITION BY Device_id ORDER BY cnt DESC) AS rnk
  FROM CTE
)
SELECT
  c.Device_id,
  COUNT(DISTINCT c.Locations) AS no_of_location,
  MAX(CASE WHEN c2.rnk = 1 THEN c2.Locations END) AS max_signal_location,
  SUM(c.cnt) AS no_of_signals
FROM CTE c
JOIN CTE2 c2 ON c.Device_id = c2.Device_id AND c.Locations = c2.Locations
GROUP BY c.Device_id;

CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES

Amir, [28.05.2025 17:16]
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1),
(1006,'Albert',25000,3), (1007,'Donald',35000,3);
SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
  SELECT AVG(Salary)
  FROM Employee
  WHERE DeptID = e.DeptID
);

CREATE TABLE WinningNumbers (Number INT);
INSERT INTO WinningNumbers VALUES (25), (45), (78);
CREATE TABLE Tickets (TicketID VARCHAR(10), Number INT);
INSERT INTO Tickets VALUES
('A23423', 25), ('A23423', 45), ('A23423', 78),
('B35643', 25), ('B35643', 45), ('B35643', 98),
('C98787', 67), ('C98787', 86), ('C98787', 91);
SELECT SUM(Winnings) AS Total_Winnings
FROM (
  SELECT TicketID,
         CASE 
           WHEN COUNT(*) = (SELECT COUNT(*) FROM WinningNumbers) THEN 100
           WHEN COUNT(*) > 0 THEN 10
           ELSE 0
         END AS Winnings
  FROM (
    SELECT DISTINCT t.TicketID, t.Number
    FROM Tickets t
    JOIN WinningNumbers w ON t.Number = w.Number
  ) matched
  GROUP BY TicketID
) result;

