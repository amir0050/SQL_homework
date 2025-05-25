SELECT * FROM Products WHERE Price > 500;

SELECT * FROM Customers WHERE City = 'Chicago';

SELECT Name, City FROM Customers ORDER BY Name;

SELECT COUNT(*) AS Total_Products FROM Products;

SELECT AVG(Price) AS Average_Price FROM Products;

SELECT DISTINCT Customer_ID FROM Orders;

SELECT * FROM Sales WHERE Amount > 1000;

SELECT * FROM Orders WHERE YEAR(Order_Date) = 2023;

SELECT DISTINCT c.Name
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID;

SELECT p.Product_Name, pd.Discount_Percentage
FROM Products p
JOIN Products_Discounted pd ON p.Product_ID = pd.Product_ID;

SELECT c.Name, SUM(s.Amount) AS Total_Sales
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Sales s ON o.Order_ID = s.Order_ID
GROUP BY c.Name;

SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT * FROM Products
WHERE Product_ID NOT IN (SELECT Product_ID FROM Products_Discounted);

SELECT p.Product_Name,
ROUND(p.Price * (1 - pd.Discount_Percentage / 100), 2) AS Discounted_Price
FROM Products p
JOIN Products_Discounted pd ON p.Product_ID = pd.Product_ID;

SELECT p.Product_Name, COUNT(s.Sale_ID) AS Total_Sales
FROM Products p
JOIN Sales s ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Name;

SELECT * FROM Customers
WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Orders);

SELECT City, COUNT(*) AS Client_Count
FROM Customers
GROUP BY City;

SELECT o.Order_ID, c.Name, o.Order_Date
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID;

SELECT c.Name, SUM(s.Amount) AS Total_Sales
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Sales s ON o.Order_ID = s.Order_ID
GROUP BY c.Name;

SELECT COUNT(DISTINCT Product_ID) AS Discounted_Products
FROM Products_Discounted;

SELECT * FROM Orders
WHERE Order_ID NOT IN (SELECT Order_ID FROM Sales);

SELECT p.*
FROM Products p
JOIN Products_Discounted pd ON p.Product_ID = pd.Product_ID
WHERE pd.Discount_Percentage > 15;
