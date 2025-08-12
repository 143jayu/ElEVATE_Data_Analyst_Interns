-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    product_id INT NOT NULL
);

-- Insert 30 sample records
INSERT INTO orders (order_id,order_date, amount, product_id) VALUES
(1,'2023-01-05', 49.99, 101),
(2,'2023-01-12', 29.95, 102),
(3,'2023-01-18', 99.50, 103),
(4,'2023-01-22', 15.75, 101),
(5,'2023-02-03', 199.00, 104),
(6,'2023-02-10', 24.99, 105),
(7,'2023-02-15', 79.99, 102),
(8,'2023-02-20', 59.50, 103),
(9,'2023-03-01', 149.95, 106),
(10,'2023-03-08', 39.99, 101),
(11,'2023-03-14', 89.00, 104),
(12,'2023-03-21', 19.99, 105),
(13,'2023-04-02', 129.00, 107),
(14,'2023-04-09', 34.50, 102),
(15,'2023-04-16', 69.95, 103),
(16,'2023-04-23', 14.99, 101),
(17,'2023-05-05', 179.00, 108),
(18,'2023-05-12', 44.95, 102),
(19,'2023-05-18', 94.50, 104),
(20,'2023-05-25', 29.99, 105),
(21,'2023-06-03', 159.95, 109),
(22,'2023-06-10', 54.00, 103),
(23,'2023-06-17', 119.00, 107),
(24,'2023-06-24', 24.50, 101),
(25,'2023-07-02', 199.95, 110),
(26,'2023-07-09', 49.99, 102),
(27,'2023-07-16', 109.50, 104),
(28,'2023-07-23', 39.95, 105),
(29,'2023-08-01', 89.99, 108),
(30,'2023-08-08', 19.50, 101);

select * from orders;

-- Example query using EXTRACT(MONTH FROM order_date)
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    amount,
    product_id
FROM 
    orders
ORDER BY 
    order_date;

-- Group by year-month in YYYY-MM format
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS year_month,
    COUNT(*) AS order_count,
    SUM(amount) AS total_amount
FROM orders
GROUP BY 
    TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 
    year_month;

--Query Using SUM() for Revenue by Product
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM 
    orders
GROUP BY 
    product_id
ORDER BY 
    total_revenue DESC;

-- Get total order volume (count of distinct order_ids)
SELECT 
    COUNT(DISTINCT order_id) AS total_order_volume
FROM 
    orders;

--Use ORDER BY for sorting.
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    amount,
    product_id
FROM 
    orders
ORDER BY 
    EXTRACT(MONTH FROM order_date) DESC,
    order_date DESC;


--Limiting results for specific time periods
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31'
ORDER BY order_date;
	
