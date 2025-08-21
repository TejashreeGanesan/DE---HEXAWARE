-- 1. ISNULL Function
USE MypracticeDB;

-- Replace NULL with a static value
SELECT ISNULL(shipping_address, 'unknown') AS address
FROM Orders;

-- Replace NULL with another column's value
SELECT ISNULL(shipping_address, billing_address) AS address
FROM Orders;

-- 2. COALESCE Function
--Two-column replacement
SELECT COALESCE(shipping_address, billing_address) AS address
FROM Orders;

--Multiple values with a default
SELECT COALESCE(shipping_address, billing_address, 'na') AS address
FROM Orders;

-- 3. NullIf()
--Replace Invalid Values
SELECT OrderID,
       NULLIF(OriginalPrice, DiscountPrice) AS PriceCheck
FROM SalesOrders;

--Prevent Divide by Zero
SELECT OrderID,
       Sales,
       Quantity,
       Sales / NULLIF(Quantity, 0) AS PricePerUnit
FROM SalesOrders;

-- Data Cleanup
SELECT OrderID,
       ProductName,
       NULLIF(DiscountPrice, 0) AS CleanDiscount
FROM SalesOrders;

--4. isnull(), isnotnull()
select * from SalesOrders where Quantity is null;
select * from SalesOrders where Quantity is not null;


