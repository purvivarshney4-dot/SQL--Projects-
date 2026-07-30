-- Sales Data Analysis
-- SQL Data Analytics Project

CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1, '2025-01-05', 'Laptop', 'Electronics', 'North', 2, 55000, 110000),
(2, '2025-01-08', 'Mobile Phone', 'Electronics', 'South', 5, 20000, 100000),
(3, '2025-01-12', 'Office Chair', 'Furniture', 'West', 4, 7500, 30000),
(4, '2025-01-15', 'Desk', 'Furniture', 'East', 3, 12000, 36000),
(5, '2025-01-18', 'Headphones', 'Electronics', 'North', 8, 2500, 20000),
(6, '2025-01-21', 'Keyboard', 'Electronics', 'South', 10, 1500, 15000),
(7, '2025-01-24', 'Monitor', 'Electronics', 'West', 4, 18000, 72000),
(8, '2025-01-27', 'Office Table', 'Furniture', 'East', 2, 15000, 30000),
(9, '2025-01-29', 'Printer', 'Electronics', 'North', 3, 12000, 36000),
(10, '2025-01-31', 'Bookshelf', 'Furniture', 'South', 5, 6000, 30000);

-- 1. View all sales
SELECT *
FROM sales;

-- 2. Total sales
SELECT SUM(total_sales) AS total_sales
FROM sales;

-- 3. Total quantity sold
SELECT SUM(quantity) AS total_quantity_sold
FROM sales;

-- 4. Average sales value
SELECT ROUND(AVG(total_sales), 2) AS average_sales
FROM sales;

-- 5. Highest-value sale
SELECT *
FROM sales
ORDER BY total_sales DESC
LIMIT 1;

-- 6. Sales by category
SELECT category,
       SUM(total_sales) AS category_sales
FROM sales
GROUP BY category
ORDER BY category_sales DESC;

-- 7. Sales by region
SELECT region,
       SUM(total_sales) AS regional_sales
FROM sales
GROUP BY region
ORDER BY regional_sales DESC;

-- 8. Quantity sold by product
SELECT product_name,
       SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC;

-- 9. Top 5 products by sales
SELECT product_name,
       SUM(total_sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- 10. Monthly sales
SELECT MONTH(sale_date) AS sale_month,
       SUM(total_sales) AS monthly_sales
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY sale_month;

-- 11. Sales greater than 50000
SELECT *
FROM sales
WHERE total_sales > 50000
ORDER BY total_sales DESC;

-- 12. Sales ranking
SELECT product_name,
       region,
       total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM sales;
