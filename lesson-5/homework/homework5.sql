use home5 

CREATE TABLE Products ( ProductID INT PRIMARY KEY, name VARCHAR(100), Price DECIMAL(10, 2), Category VARCHAR(50), StockQuantity INT );
INSERT INTO Products VALUES (1, 'Laptop', 1200.00, 'Electronics', 30), (2, 'Smartphone', 800.00, 'Electronics', 50), (3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60), (5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120), (7, 'Chair', 150.00, 'Furniture', 80), 
(8, 'Desk', 200.00, 'Furniture', 75), (9, 'Pen', 5.00, 'Stationery', 300), (10, 'Notebook', 10.00, 'Stationery', 500), (11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200), (14, 'Shirt', 30.00, 'Clothing', 150), (15, 'Jeans', 45.00, 'Clothing', 120), (16, 'Jacket', 80.00, 'Clothing', 70)

sp_rename 'products.productname', 'name'
select*from Products

CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, FirstName VARCHAR(100), LastName VARCHAR(100), Email VARCHAR(100), Phone VARCHAR(50), Address VARCHAR(255),
City VARCHAR(100), State VARCHAR(100), PostalCode VARCHAR(20), Country VARCHAR(100) );
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'), 
(3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia')

exec sp_rename 'customers','client'

CREATE TABLE Products_Discounted ( ProductID INT PRIMARY KEY, ProductName VARCHAR(100), Price DECIMAL(10, 2), Category VARCHAR(50), StockQuantity INT );
INSERT INTO Products_Discounted VALUES (1, 'Gaming Laptop', 950.00, 'Electronics', 25), (2, 'High-End Smartphone', 750.00, 'Electronics', 45), 
(3, 'Convertible Tablet', 350.00, 'Electronics', 35), (4, 'Ultra-Wide Monitor', 220.00, 'Electronics', 55), 
(5, 'Mechanical Keyboard', 45.00, 'Accessories', 90), (6, 'Wireless Mouse', 25.00, 'Accessories', 110), (7, 'Ergonomic Chair', 130.00, 'Furniture', 75), 
(8, 'Standing Desk', 190.00, 'Furniture', 70), (9, 'Luxury Pen', 4.50, 'Stationery', 280), (10, 'Leather Notebook', 9.00, 'Stationery', 480), 
(11, 'Laser Printer', 160.00, 'Electronics', 20), (12, 'DSLR Camera', 480.00, 'Electronics', 35), (13, 'LED Flashlight', 20.00, 'Tools', 190), 
(14, 'Designer Shirt', 28.00, 'Clothing', 140), (15, 'Slim Fit Jeans', 40.00, 'Clothing', 110), (16, 'Winter Jacket', 70.00, 'Clothing', 60), 
(17, 'Running Shoes', 55.00, 'Clothing', 90), (18, 'Wool Hat', 18.00, 'Accessories', 45), (19, 'Thermal Socks', 9.00, 'Clothing', 180),
(20, 'Graphic T-Shirt', 22.00, 'Clothing', 140), (21, 'Desk Lamp', 55.00, 'Furniture', 35), (22, 'Marble Coffee Table', 95.00, 'Furniture', 30), 
(23, 'Hardcover Book', 13.00, 'Stationery', 230), (24, 'Persian Rug', 85.00, 'Furniture', 50), (25, 'Glass Cup', 4.50, 'Accessories', 470), 
(26, 'Leather Bag', 22.00, 'Accessories', 270),
(27, 'Recliner Couch', 420.00, 'Furniture', 10), (28, 'Smart Fridge', 570.00, 'Electronics', 15), (29, 'Gas Stove', 460.00, 'Electronics', 12)

SELECT name
FROM Products
union
SELECT ProductName
FROM Products_Discounted

select ProductID , Name, Price, Category, StockQuantity
FROM Products
intersect
select ProductID,ProductName, Price, Category, StockQuantity 
FROM Products_Discounted


select distinct firstname,lastname,country
from client

select name,price,
case when price>=1000 then 'high'
else 'low'
end as pricecategory
from products

CREATE TABLE OutOfStock ( ProductID INT PRIMARY KEY, ProductName VARCHAR(100), Price DECIMAL(10, 2), Category VARCHAR(50), StockQuantity INT );
INSERT INTO OutOfStock VALUES (1, 'Gaming Console', 500.00, 'Electronics', 0), (2, 'Smartwatch', 250.00, 'Electronics', 0), 
(3, 'Wireless Earbuds', 150.00, 'Electronics', 0), (4, 'Projector', 700.00, 'Electronics', 0), (5, 'Mechanical Keyboard', 120.00, 'Accessories', 0),
(6, 'Wireless Mouse', 45.00, 'Accessories', 0), (7, 'Office Chair', 250.00, 'Furniture', 0), (8, 'Standing Desk', 400.00, 'Furniture', 0),
(9, 'Marker Set', 20.00, 'Stationery', 0), (10, 'Sketchbook', 35.00, 'Stationery', 0), (11, 'Scanner', 220.00, 'Electronics', 0),
(12, 'Drone', 800.00, 'Electronics', 0), (13, 'Power Drill', 90.00, 'Tools', 0), (14, 'Sweater', 55.00, 'Clothing', 0), 
(15, 'Shorts', 30.00, 'Clothing', 0), (16, 'Raincoat', 75.00, 'Clothing', 0), (17, 'Sandals', 40.00, 'Clothing', 0), 
(18, 'Gloves', 15.00, 'Accessories', 0), (19, 'Necklace', 120.00, 'Accessories', 0), (20, 'Sunglasses', 80.00, 'Accessories', 0), 
(21, 'Bedside Lamp', 45.00, 'Furniture', 0), (22, 'Bookshelf', 150.00, 'Furniture', 0), (23, 'Dictionary', 25.00, 'Stationery', 0),
(24, 'Wall Clock', 60.00, 'Furniture', 0)

select name
from products
union
select ProductName
from OutOfStock

select ProductID , Name, Price, Category, StockQuantity
FROM Products
except
select ProductID,ProductName, Price, Category, StockQuantity
FROM Products_Discounted


select name,price,iif(price>1000,'expensive','affortable')
as pricecategory
from Products


CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, FirstName VARCHAR(50) NULL, LastName VARCHAR(50) NULL, DepartmentName VARCHAR(50), Salary DECIMAL(10, 2), HireDate DATE, Age INT, Email VARCHAR(100) NULL, Country VARCHAR(50) );
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentName, Salary, HireDate, Age, Email, Country) VALUES
(1, 'John', 'Doe', 'IT', 55000.00, '2020-01-01', 30, 'johndoe@example.com', 'USA'), 
(2, 'Jane', 'Smith', 'HR', 65000.00, '2019-03-15', 28, 'janesmith@example.com', 'USA'), (3, NULL, 'Johnson', 'Finance', 45000.00, '2021-05-10', 25, NULL, 'Canada'),
(4, 'James', 'Brown', 'Marketing', 60000.00, '2018-07-22', 35, 'jamesbrown@example.com', 'UK'),
(5, 'Patricia', NULL, 'HR', 70000.00, '2017-08-30', 40, NULL, 'USA'), (6, 'Michael', 'Miller', 'IT', 75000.00, '2020-12-12', 27, 'michaelm@example.com', 'Germany'),
(7, 'Linda', NULL, 'Finance', 48000.00, '2016-11-02', 42, NULL, 'Canada'), 
(8, 'David', 'Moore', 'Marketing', 85000.00, '2021-09-01', 29, 'davidm@example.com', 'UK'),
(9, 'Elizabeth', 'Taylor', 'HR', 60000.00, '2019-05-18', 31, 'elizabetht@example.com', 'USA'),
(10, 'William', NULL, 'IT', 64000.00, '2020-04-10', 26, NULL, 'Germany'), (11, NULL, 'Thomas', 'Finance', 47000.00, '2017-01-25', 38, NULL, 'Canada'), 
(12, 'Joseph', 'Jackson', 'Marketing', 78000.00, '2016-09-30', 44, 'josephj@example.com', 'UK')

select age,salary
from Employees
where (age<=25)or(salary>=60000)

UPDATE Employees
SET Salary = CASe WHEN Departmentname = 'HR' OR EmployeeID = 5 THEN Salary * 1.10
ELSE Salary 
end



select ProductID, Name, Price, Category, StockQuantity
FROM Products
intersect
select ProductID,ProductName, Price, Category, StockQuantity
FROM Products_Discounted

CREATE TABLE Sales ( SaleID INT PRIMARY KEY, ProductID INT, CustomerID INT, SaleDate DATE, SaleAmount DECIMAL(10, 2) );
INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES (1, 1, 1, '2023-01-01', 150.00), (2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00), (4, 4, 4, '2023-01-04', 300.00), (5, 5, 5, '2023-01-05', 350.00), (6, 6, 6, '2023-01-06', 400.00), 
(7, 7, 7, '2023-01-07', 450.00), (8, 8, 8, '2023-01-08', 500.00), (9, 9, 9, '2023-01-09', 550.00), (10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00), (12, 2, 2, '2023-01-12', 200.00), (13, 3, 3, '2023-01-13', 250.00), (14, 4, 4, '2023-01-14', 300.00), 
(15, 5, 5, '2023-01-15', 350.00), (16, 6, 6, '2023-01-16', 400.00), (17, 7, 7, '2023-01-17', 450.00), (18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00), (20, 10, 10, '2023-01-20', 600.00), (21, 1, 2, '2023-01-21', 150.00), (22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00), (24, 4, 5, '2023-01-24', 300.00), (25, 5, 6, '2023-01-25', 350.00), (26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00), (28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00), (30, 10, 1, '2023-01-30', 600.00)

SELECT SaleID, SaleAmount,
CASE WHEN SaleAmount > 500 THEN 'Top Tier'
 WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
 ELSE 'Low Tier' 
END AS SalesTier
FROM Sales;
