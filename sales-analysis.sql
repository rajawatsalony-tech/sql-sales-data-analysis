-- PROJECT 3: SALES DATA ANALYSIS

CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1, '2026-09-01', 'Laptop', 'Electronics', 2, 50000),
(2, '2026-09-03', 'Mouse', 'Accessories', 5, 500),
(3, '2026-09-10', 'Chair', 'Furniture', 3, 6000),
(4, '2026-09-15', 'Keyboard', 'Accessories', 4, 1200),
(5, '2026-09-20', 'Phone', 'Electronics', 2, 30000),
(6, '2026-10-02', 'Desk', 'Furniture', 2, 15000),
(7, '2026-10-05', 'Laptop', 'Electronics', 1, 50000),
(8, '2026-10-08', 'Mouse', 'Accessories', 10, 500),
(9, '2026-10-12', 'Phone', 'Electronics', 3, 30000),
(10, '2026-10-15', 'Chair', 'Furniture', 2, 6000);

-- 1. View all sales
SELECT * FROM sales;

-- 2. Calculate total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 3. Revenue by category
SELECT category,
       SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 4. Best-selling products by quantity
SELECT product,
       SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;

-- 5. Monthly revenue
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;