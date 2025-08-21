-- 1. CASE Statements

use MypracticeDB; 

select employee_id, first_name,last_name,
case
    when gender = 'F' then 'Female'
    when gender = 'M' then 'Male'
    else 'Not available'
end as gender_full_text,
case country
    when 'USA' then 'US'
    when 'Germany' then 'DE'
    when 'India' then 'IN'
    else 'NA'
end as country_abbreviation
from employees;

/* Task 1: 
Generate a report that classifies total sales for each order into the following categories:

- **High:** If the total sales are higher than 50,000.
- **Medium:** If the total sales are between 20,000 and 50,000.
- **Low:** If the total sales are equal to or less than 20,000.

Display the following columns:

- **OrderID**
- **CustomerName**
- **ProductName**
- **TotalSales** (Quantity × Price)
- **SalesCategory** (High/Medium/Low)

Finally, **sort the result from the lowest total sales to the highest.**
*/

select OrderID, CustomerName, ProductName, Quantity, Price,
(Quantity * Price) as Total_sales,
case
    when (Quantity * Price) > 50000 then 'High'
    when (Quantity * Price) between 20000 and 50000 then 'Medium'
    else 'Low'
end as sales_category
from sales
order by Total_sales asc;


/* Handling Nulls and Conditional Aggregations with Case Statements

Task:Find the average scores of customers and treat Nulls as O
And additional provide details such CustomerID & LastName */

select customer_id, last_name, score, avg(score) over() as avg_score
from sales_customers;

-- Handle NULLs (Treat as 0)
select customer_id, last_name, score, 
avg(case when score is null then 0 else score end) over() as avg_score_cleaned
from sales_customers;

-- 2. Normal aggregation
SELECT customer_id, SUM(sales) AS total_sales
FROM sales_orders
GROUP BY customer_id;

-- 3.Conditonal Aggregation
select customer_id,
sum(case when sales>30 then 1 else 0 end) as high_sales_orders
from sales_orders
group by customer_id;
