use subtotal;

select * from sys.tables;

select * from SalesList;

select salesMonth, sum(salestotal) over() as total_sales
from SalesList;

select salesmonth, salesyear, sum(salestotal) over(partition by salesyear) as total_sales_per_year
from SalesList;

select salesmonth, salesyear, salesquartes, sum(salestotal) over(partition by salesyear, salesquartes) as sales_status
from SalesList;

select salesMonth, salesQuartes, salesYear, salestotal,
rank() over(order by salestotal asc) as rank_sales
from SalesList;

select salesMonth, salesQuartes, salesYear, salestotal,
rank() over(partition by salesquartes order by salestotal desc) as rank_sales
from SalesList;

--window frame
-- 1. Current Row + Next 2 Rows
select salesMonth,salesYear, 
sum(salesTotal) over(order by salesMonth rows between current row and 2 following) as total_sales
from SalesList
order by SalesMonth asc;
-- 2. All Rows Up to Current Row (Default)
select salesMonth, Salesyear,
sum(salesTotal) over(order by salesMonth) as running_total
from SalesList;
-- rows between 1 preceding and current row
select salesMonth, SalesTotal,
sum(salesTotal) over(order by salesMonth
rows between 1 preceding and current row) as curr_preceding
from SalesList;

-- rows between unbounded preceding and current row
select salesMonth, SalesTotal,
sum(salesTotal) over(order by salesMonth
rows between unbounded preceding and current row) as curr_preceding
from SalesList;

-- Rows between 1 preceeding and 1 following
select salesMonth, SalesTotal,
sum(salesTotal) over(order by salesMonth
rows between 1 preceding and 1 following) as curr_preceding
from SalesList;

-- Rows between unbounded preceding and unbounded following
select salesMonth, SalesTotal,
sum(salesTotal) over(order by salesMonth
rows between unbounded preceding and unbounded following) as curr_preceding
from SalesList;


