-- scalar
use MypracticeDB;

select avg(sales) as avg_sales from orders;

-- row
select customer_id,order_status from customer_sales
where customer_id in (select customer_id from orders)

--table
select t.customer_id, t.total_sales
from (
	  select customer_id, sum(sales) as total_sales
	  from orders
	  group by customer_id
)t;

---- Location-Based Subquery
-- Subquery in FROM
select * from (
select product, sales, avg(sales) over() as avg_sales
from orders) as t
where sales > avg_sales;

-- Ex2: Rank customers based on their total sales amount.
select * , rank() over(order by total_sales desc) as rank
from (
select customer_id, sum(sales) as total_sales
from orders
group by customer_id) as t;

--Subquery in SELECT
select product_id, product_name, price,
(select count(*) from sales_orders) as total_orders
from products;

-- Show all customer details. Find the total orders of each customer
select * from customers as c 
left join (
        select customer_id, count(*) as total_orders 
        from sales_orders 
        group by customer_id) as o on c.customer_id = o.customer_id;

-- Subquery in WHERE
--Ex 1: Products with Price Higher Than Average
select * from products
where price > (select avg(price) as avg_price from products);

-- Adding the Average Price in the Result
select product_id, product_name, price, 
(select avg(price) from products) as avg_price
from products 
where price > (select avg(price) from products);

-- Subquery Using IN Operator
select * from sales_orders
where customer_id in (
select customer_id from customers
where country = 'Germany');

--Ex 2: Orders from Customers NOT in Germany
select * from sales_orders
where customer_id not in (
select customer_id from customers
where country = 'Germany');

--Subquery using ALL & ANY Operators
select EmpID, Name, Role, salary 
from Employees
where Role = 'Data Engineer'
and salary > any (
             select salary from Employees
             where Role = 'Data Analysts');

-- Retrieve all employees whose salary is greater than the salary of every em
select EmpID, Name, Role, salary 
from Employees
where salary > all (
             select salary from Employees
             where Role = 'Data Analysts');

-- Subquery Using EXISTS
select * from sales_orders o
where exists (
        select 1
        from customers c
        where c.country = 'Germany'
        and c.customer_id = o.customer_id);

-- Using NOT EXISTS
select * from sales_orders o
where not exists (
        select 1
        from customers c
        where c.country = 'Germany'
        and c.customer_id = o.customer_id);


