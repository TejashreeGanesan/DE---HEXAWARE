use MypracticeDB;
-- 1. Create the table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    order_date DATE,
    sales DECIMAL(10,2),
    order_status VARCHAR(20)
);

-- 2. Insert sample values
INSERT INTO orders (order_id, customer_id, product, order_date, sales, order_status) VALUES
(1, 101, 'Cap',     '2025-01-01', 10.00, 'delivered'),
(2, 101, 'Cap',     '2025-01-05', NULL,  'delivered'), -- NULL sales for testing COUNT(column)
(3, 102, 'Gloves',  '2025-01-10', 20.00, 'shipped'),
(4, 102, 'Gloves',  '2025-02-01', 25.00, 'delivered'),
(5, 103, 'Cap',     '2025-02-05', 15.00, 'shipped'),
(6, 104, 'Shoes',   '2025-02-10', 30.00, 'delivered'),
(7, 104, 'Shoes',   '2025-02-15', 35.00, 'delivered'),
(8, 105, 'Gloves',  '2025-02-20', 40.00, 'shipped');

Select * from orders;
select product, count(sales) over (partition by product) from orders;
SELECT product, COUNT(1) OVER() AS total_orders FROM orders;

SELECT
  order_id,
  sales,
  SUM(sales) OVER () AS total_sales,
  ROUND(CAST(sales AS FLOAT) / SUM(sales) OVER () * 100, 2) AS percentage_of_total
FROM orders;

SELECT order_id, product, sales,
       SUM(sales) OVER(PARTITION BY product) AS total_sales_by_product
FROM orders;

SELECT *
FROM (
    SELECT order_id, product, sales,
           AVG(sales) OVER() AS avg_sales
    FROM orders
) t
WHERE sales > avg_sales;

-- finding min and max sales product
-- a. Highest & Lowest Sales Across All Order
select order_id, product, sales,
min(sales) over () as min_sales,
max(sales) over() as max_sales
from orders;

-- b. Highest & Lowest Sales Per Product
select order_id, product, sales,
min(sales) over (partition by product) as min_sales,
max(sales) over(partition by product) as max_sales
from orders;


ALTER TABLE orders
ADD month VARCHAR(20);

UPDATE orders
SET month = DATENAME(MONTH, order_date);

SELECT order_id, order_date, month
FROM orders;

-- Running Total (Default Behavior)
select month, sales,
sum(sales) over(order by month) as running_total
from orders;

-- Rolling Total (Fixed Window)
select month, sales,
sum(sales) over(order by month rows between 2 preceding and current row) as rolling_total
from orders;

select * from orders;

-- Average per Product (Static Average)
select order_id, product, order_date, sales,
avg(sales) over(partition by product) as avg_by_product
from orders;

-- To calculate the cumulative moving average
select order_id, product, order_date, sales,
avg(sales) over(partition by product order by order_date desc) as moving_avg
from orders;

-- 5. Rolling Average (Custom Frame)
select order_id, product, order_date, sales,
avg(sales) over(partition by product order by order_date  rows between current row and 1 following) as rolling_avg
from orders;

INSERT INTO orders (order_id, customer_id, product, order_date, sales, order_status)
VALUES
(9,  106, 'Cap',     '2025-03-02', 12.00, 'delivered'),
(10, 107, 'Cap',     '2025-03-05', 22.00, 'shipped'),
(11, 108, 'Cap',     '2025-03-10', 22.00, 'delivered'), -- same sales as order 10 for tie testing
(12, 109, 'Gloves',  '2025-03-15', 35.00, 'delivered'),
(13, 110, 'Gloves',  '2025-03-18', 35.00, 'shipped'),   -- tie with order 12
(14, 111, 'Shoes',   '2025-03-20', 50.00, 'delivered'),
(15, 112, 'Shoes',   '2025-03-22', 45.00, 'shipped'),
(16, 113, 'Shoes',   '2025-03-25', NULL,  'delivered'), -- NULL sales for testing
(17, 114, 'Cap',     '2025-04-01', 18.00, 'shipped'),
(18, 115, 'Gloves',  '2025-04-02', 28.00, 'delivered'),
(19, 116, 'Shoes',   '2025-04-05', 55.00, 'delivered'),
(20, 117, 'Shoes',   '2025-04-08', 55.00, 'shipped');  -- tie for highest sales

UPDATE orders
SET month = DATENAME(MONTH, order_date);

select * from orders;
-- window ranking functions integer based
--row_number()
select order_id, product, sales, 
row_number() over(order by sales desc) as sales_rank
from orders;
-- with partition by
select order_id, month, product, sales,
row_number() over(partition by month order by sales desc) as sales_rank
from orders;

-- rank function
select order_id, month, product, sales,
rank() over(order by sales desc) as sales_rank
from orders;

--with partition
select order_id, month, product, sales,
rank() over(partition by month order by sales desc) as sales_rank
from orders;

-- Dense_rank()
select order_id, month, product, sales,
dense_rank() over(order by sales desc) as sales_rank
from orders;

-- with partition
select order_id, month, product, sales,
rank() over(partition by product order by sales desc) as sales_rank
from orders;

-- Use Case 1: Top N Analysis – Highest Sales per Product
-- Find the top highest sales for each product.
select * from (
    select order_id, product, sales,
    row_number() over(partition by product order by sales desc) as rank_by_product
    from orders
) subquery
where rank_by_product = 1;

-- Use Case 2: Bottom N Analysis – Lowest 2 Customers by Total Sales
CREATE TABLE customer_sales (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    order_date DATE,
    sales DECIMAL(10,2),
    order_status VARCHAR(20)
);

INSERT INTO customer_sales (order_id, customer_id, product, order_date, sales, order_status) VALUES
(1, 101, 'Cap',     '2025-01-01',  10.00, 'delivered'),
(2, 101, 'Cap',     '2025-01-05',  15.00, 'delivered'),
(3, 102, 'Gloves',  '2025-01-10',  20.00, 'shipped'),
(4, 102, 'Gloves',  '2025-02-01',  25.00, 'delivered'),
(5, 103, 'Shoes',   '2025-02-05',  5.00,  'shipped'),
(6, 103, 'Shoes',   '2025-02-10',  8.00,  'delivered'),
(7, 104, 'Cap',     '2025-02-15',  30.00, 'delivered'),
(8, 105, 'Gloves',  '2025-02-20',  12.00, 'shipped'),
(9, 105, 'Gloves',  '2025-02-25',  18.00, 'delivered'),
(10, 106, 'Shoes',  '2025-03-01',  7.00,  'delivered');

select * from customer_sales;

select * from(
select customer_id, total_sales,
row_number() over(order by total_sales asc) as rank_customers
from (
        select customer_id, sum(sales) as total_sales
        from customer_sales
        group by customer_id) subquery) ranked
where rank_customers <=2;

CREATE TABLE SalesOrdersArchive (
    order_id INT,
    order_date DATE,
    product VARCHAR(50),
    sales DECIMAL(10, 2)
);

INSERT INTO SalesOrdersArchive (order_id, order_date, product, sales) VALUES
(4, '2025-01-01', 'Cap',     20.00),
(4, '2025-01-02', 'Cap',     25.00),
(6, '2025-01-03', 'Gloves',  15.00),
(6, '2025-01-04', 'Gloves',  10.00),
(6, '2025-01-05', 'Gloves',  30.00),
(7, '2025-01-06', 'Shoes',   50.00),
(8, '2025-01-07', 'Shoes',   60.00),
(8, '2025-01-08', 'Shoes',   60.00),
(9, '2025-01-09', 'Cap',     18.00),
(9, '2025-01-10', 'Cap',     22.00);


select * from SalesOrdersArchive;

-- Assigning Unique IDs with ROW_NUMBER()
select *, row_number() over(order by order_id, order_date) as unique_id
from SalesOrdersArchive;

-- Identify Duplicates with ROW_NUMBER in SQL
ALTER TABLE SalesOrdersArchive
ADD creation_time DATETIME;

TRUNCATE TABLE SalesOrdersArchive;

INSERT INTO SalesOrdersArchive (order_id, order_date, product, sales, creation_time) VALUES
(4, '2025-01-01', 'Cap',     20.00, '2025-01-01 10:00:00'),
(4, '2025-01-02', 'Cap',     25.00, '2025-01-02 12:00:00'), -- duplicate, newer record
(6, '2025-01-03', 'Gloves',  15.00, '2025-01-03 09:00:00'),
(6, '2025-01-04', 'Gloves',  10.00, '2025-01-04 11:00:00'),
(6, '2025-01-05', 'Gloves',  30.00, '2025-01-05 13:00:00'), -- latest duplicate
(7, '2025-01-06', 'Shoes',   50.00, '2025-01-06 14:00:00'),
(8, '2025-01-07', 'Shoes',   60.00, '2025-01-07 10:00:00'),
(8, '2025-01-08', 'Shoes',   60.00, '2025-01-08 15:00:00'), -- duplicate, newer record
(9, '2025-01-09', 'Cap',     18.00, '2025-01-09 08:00:00'),
(9, '2025-01-10', 'Cap',     22.00, '2025-01-10 16:00:00'); -- duplicate, newer record
-- Identify and Keep Only the Latest Records
select * from (
    select *,
        row_number() over(partition by order_id order by creation_time desc) as rn
    from SalesOrdersArchive) subquery
where rn = 1;

select * from (
    select *,
        row_number() over(partition by order_id order by creation_time desc) as rn
    from SalesOrdersArchive) subquery
where rn >1;

-- Percentage-Based Ranking Functions
-- Cume_dist()
select order_id, product, sales,
cume_dist() over(order by sales desc) as sales_distribution
from orders;
-- with partition by example
select order_id, product, sales, 
cume_dist() over( partition by product order by sales desc) as sales_distribution
from orders;

-- Percent Rank
select order_id, product, sales,
percent_rank() over(order by sales desc) as percent_rank
from orders;

-- Use Case: Find Top 40% Products by Price 
select * from (
        select product, sales,
            percent_rank() over(order by sales desc) as percent_rank
        from orders) ranked
where percent_rank <= 0.4;

--  Ntile
-- a) NTILE(2) → Two Buckets
select order_id, product,sales,
ntile(2) over(order by sales desc) as bucket
from orders;

-- b) NTILE(3) → Three Buckets
select order_id, product,sales,
ntile(3) over(order by sales desc) as bucket
from orders;

-- 1. Data Segmentation
select order_id, product, sales,
case ntile(3) over (order by sales desc)
when 1 then 'High'
when 2 then 'Medium'
when 3 then 'Low'
end as sales_category
from orders;

-- Window Value Functions ---
-- lag & lead
select * from orders;
select month, sales,
lag(sales, 2, 0) over(partition by month order by sales) as lag_example,
lead(sales, 2, 0) over(partition by month order by sales) as lead_example
from orders;

-- first value and last value
select month, sales,
first_value(sales) over(order by month) as first_sales,
last_value(sales) over(order by month) as last_sales
from orders;