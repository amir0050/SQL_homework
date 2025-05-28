CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

select*from sales
select*from products

create table #monthlysales
(productid int,
totalquantity int,
totalrevenue decimal(18,2)) 

insert into #monthlysales (productid,
totalquantity,
totalrevenue) 
select s.productid,
sum(s.quantity) as totalquantity,
sum(s.quantity*p.price) as totalrevenue from sales s
join products p on s.productid=p.productid
group by s.productid

select*from #monthlysales

create view vw_productsalessummary as
select p.productid,
p.productname,
p.category,
sum(s.quantity) as totalquantitysold from Products p
join sales s on p.ProductID=s.ProductID
group by p.ProductID,p.productname,
p.category

select*from vw_productsalessummary


create function dbo.fn_gettotalrevenueforproduct(@category varchar(50))
returns table
as return (select productid, sum(Price) as totalrevenue from Products
where productid=@category
group by ProductID)

select*from fn_gettotalrevenueforproduct ('6')


create function dbo.fn_getsalesbycategory(@category varchar(50))
returns table 
as return (select p.productname,sum(s.quantity) as totalquantity,sum(p.price) as totalrevenue from products p
join sales s on p.productid=s.ProductID
where  @category=p.category
group by p.Category,p.productname)

select*from dbo.fn_getsalesbycategory('electronics')


CREATE FUNCTION fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
 DECLARE @i INT = 2;
IF @Number < 2
RETURN 'No';
WHILE @i * @i <= @Number
BEGIN
IF @Number % @i = 0
RETURN 'No';
SET @i = @i + 1;
END
RETURN 'Yes';
END;

select dbo.fn_IsPrime (6) 



create FUNCTION fn_getNumbersBetween
(@start int,@end int)
returns @result table(number int)
as begin 
declare @between int
set @between=@Start+1
while @between<@end
begin
insert into @result(number)
values (@between)
set @between=@between+1
end
return
end




create TABLE Employee 
(id INT PRIMARY KEY,
    salary INT);

INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);


CREATE FUNCTION getNthHighestSalary (@N INT)
RETURNS INT
AS
BEGIN
DECLARE @result INT;

SELECT @result = MIN(salary)
FROM (
        SELECT DISTINCT TOP (@N) salary
        FROM Employee
        ORDER BY salary DESC) AS temp;

RETURN @result;
END;




CREATE TABLE RequestAccepted 
(requester_id INT,
accepter_id INT,
accept_date DATE);


INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');


SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY num DESC;





CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2));

INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

CREATE VIEW vw_CustomerOrderSummary AS
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;



CREATE TABLE Gaps
(RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,'Charlie'),(8,NULL),(9,NULL);


SELECT 
    RowNumber,
    TestCase = (
SELECT TOP 1 TestCase
FROM Gaps g2
WHERE g2.RowNumber <= g1.RowNumber AND g2.TestCase IS NOT NULL
ORDER BY g2.RowNumber DESC)
FROM Gaps g1
ORDER BY RowNumber
