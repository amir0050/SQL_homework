
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East');

-- Таблица: OneColumn
CREATE TABLE OneColumn (
    Value SMALLINT
);

INSERT INTO OneColumn VALUES 
(10), (20), (30), (40), (100);

-- Таблица: Row_Nums
CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);

INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), (103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');

-- Таблица: MyData
CREATE TABLE MyData (
    Id INT, 
    Grp INT, 
    Val1 INT, 
    Val2 INT
);

INSERT INTO MyData VALUES
(1,1,30,29), 
(2,1,19,0), 
(3,1,11,45), 
(4,2,0,0), 
(5,2,100,17);

-- Таблица: TheSumPuzzle
CREATE TABLE TheSumPuzzle (
    ID INT, 
    Cost INT, 
    Quantity INT
);

INSERT INTO TheSumPuzzle VALUES
(1234,12,164), 
(1234,13,164), 
(1235,100,130), 
(1235,100,135), 
(1236,12,136);

-- Таблица: Seats
CREATE TABLE Seats (
    SeatNumber INTEGER
);

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54);

-- Таблица: YourTable (для вопроса 12)
CREATE TABLE YourTable (
    ID INT
);

INSERT INTO YourTable VALUES
(1), (2), (3), (4), (5);

-- Easy

-- 1
SELECT customer_id, customer_name, order_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM sales_data;

-- 2
SELECT product_category, COUNT(*) AS order_count
FROM sales_data
GROUP BY product_category;

-- 3
SELECT product_category, MAX(total_amount) AS max_total_amount
FROM sales_data
GROUP BY product_category;

-- 4
SELECT product_category, MIN(unit_price) AS min_price
FROM sales_data
GROUP BY product_category;

-- 5
SELECT order_date, 
       AVG(total_amount) OVER (
           ORDER BY order_date 
           ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS moving_avg
FROM sales_data;

-- 6
SELECT region, SUM(total_amount) AS total_sales
FROM sales_data
GROUP BY region;

-- 7
SELECT customer_id, customer_name, 
       SUM(total_amount) AS total_purchase,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank
FROM sales_data
GROUP BY customer_id, customer_name;

-- 8
SELECT customer_id, order_date, total_amount,
       total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS diff_from_prev
FROM sales_data;

-- 9
SELECT *
FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY product_category ORDER BY unit_price DESC) AS rnk
    FROM sales_data
) t
WHERE rnk <= 3;

-- 10
SELECT region, order_date,
       SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date) AS cumulative_sales
FROM sales_data;

-- Medium

-- 11
SELECT product_category, order_date,
       SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date) AS cumulative_revenue
FROM sales_data;

-- 12
SELECT ID,
       SUM(ID) OVER (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SumPreValues
FROM YourTable;

-- 13
SELECT Value,
       SUM(Value) OVER (ORDER BY Value ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "Sum of Previous"
FROM OneColumn;

-- 14
SELECT Id, Vals,
       ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) + 
       (DENSE_RANK() OVER (ORDER BY Id) * 2 - 2) AS RowNumber
FROM Row_Nums;

-- 15
SELECT customer_id, customer_name
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;

-- 16
WITH avg_region AS (
  SELECT region, AVG(total_amount) AS avg_amount
  FROM sales_data
  GROUP BY region
)
SELECT s.customer_id, s.customer_name, s.region, SUM(s.total_amount) AS customer_total
FROM sales_data s
JOIN avg_region a ON s.region = a.region
GROUP BY s.customer_id, s.customer_name, s.region
HAVING SUM(s.total_amount) > a.avg_amount;

-- 17
SELECT customer_id, customer_name, region,
       SUM(total_amount) AS total_spending,
       RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS rank
FROM sales_data
GROUP BY customer_id, customer_name, region;

-- 18
SELECT customer_id, order_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_sales
FROM sales_data;

-- 19
WITH monthly_sales AS (
  SELECT DATE_TRUNC('month', order_date) AS month,
         SUM(total_amount) AS total
  FROM sales_data
  GROUP BY DATE_TRUNC('month', order_date)
)
SELECT month, total,
       ROUND(((total - LAG(total) OVER (ORDER BY month)) / NULLIF(LAG(total) OVER (ORDER BY month), 0)) * 100, 2) AS growth_rate
FROM monthly_sales;

-- 20
WITH ranked_sales AS (
  SELECT *,
         LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount
  FROM sales_data
)
SELECT customer_id, customer_name, order_date, total_amount
FROM ranked_sales
WHERE total_amount > prev_amount;

-- Hard

-- 21
WITH avg_prices AS (
  SELECT product_category, AVG(unit_price) AS avg_price
  FROM sales_data
  GROUP BY product_category
)
SELECT s.*
FROM sales_data s
JOIN avg_prices a ON s.product_category = a.product_category
WHERE s.unit_price > a.avg_price;

-- 22
SELECT Id, Grp, Val1, Val2,
       CASE WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1
            THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
       END AS Tot
FROM MyData;

-- 23
SELECT ID,
       SUM(DISTINCT Cost) AS Cost,
       SUM(DISTINCT Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;

-- 24
WITH numbers AS (
  SELECT generate_series(1, 60) AS num
),
missing AS (
  SELECT num
  FROM numbers
  LEFT JOIN Seats ON num = SeatNumber
  WHERE SeatNumber IS NULL
),
grp AS (
  SELECT num, num - ROW_NUMBER() OVER () AS grp_id
  FROM missing
)
SELECT MIN(num) AS "Gap Start", MAX(num) AS "Gap End"
FROM grp
GROUP BY grp_id
ORDER BY "Gap Start";

-- 25
SELECT Id, Vals,
       ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) +
       (DENSE_RANK() OVER (ORDER BY Id) * 2 - 1) AS Changed
FROM Row_Nums;
