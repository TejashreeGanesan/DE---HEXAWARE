---- date functions ----

--- Part Extraction

Use MypracticeDB;

-- Extracting Year
SELECT Name, JoinDate, DATEPART(year, JoinDate) AS Join_Year
FROM Employees;

-- Extracting Month
SELECT Name, JoinDate, DATEPART(month, JoinDate) AS Join_Month
FROM Employees;

-- Extracting Day
SELECT Name, JoinDate, DATEPART(day, JoinDate) AS Join_Day
FROM Employees;

-- Extracting Quarter
SELECT Name, JoinDate, DATEPART(quarter, JoinDate) AS Join_Quarter
FROM Employees;

--Extracting Week Number
SELECT Name, JoinDate, DATEPART(week, JoinDate) AS Join_WeekNumber
FROM Employees;

-- Extracting Weekday
SELECT Name, JoinDate, DATEPART(weekday, JoinDate) AS Join_Weekday
FROM Employees;

-- Extracting Hour 
SELECT GETDATE() AS CurrentDateTime,
       DATEPART(hour, GETDATE()) AS CurrentHour;

---  DateName
-- Getting the Month Name
SELECT Name, JoinDate, DATENAME(month, JoinDate) AS Month_Name
FROM Employees;

-- Getting the Weekday Name
SELECT Name, JoinDate, DATENAME(weekday, JoinDate) AS Day_Name
FROM Employees;

-- Getting the Day of the Month
SELECT Name, JoinDate, DATENAME(day, JoinDate) AS Day_Of_Month
FROM Employees;

-- Getting the Year
SELECT Name, JoinDate, DATENAME(year, JoinDate) AS Year_Name
FROM Employees;

--- DATETRUNC
-- Truncate to Day Level
SELECT Name, JoinDate, DATETRUNC(day, JoinDate) AS Day_Truncated
FROM Employees;

-- Truncate to Month Level
SELECT Name, JoinDate, DATETRUNC(month, JoinDate) AS Month_Truncated
FROM Employees;

-- Truncate to Year Level
SELECT Name, JoinDate, DATETRUNC(year, JoinDate) AS Year_Truncated
FROM Employees;

-- Truncate to Hour or Minute
SELECT GETDATE() AS CurrentDateTime,
       DATETRUNC(hour, GETDATE()) AS Hour_Truncated,
       DATETRUNC(minute, GETDATE()) AS Minute_Truncated;

--- EOMONTH()
-- Last Day of the Current Month
SELECT Name, JoinDate, EOMONTH(JoinDate) AS Month_End
FROM Employees;

-- Last Day of Next Month
SELECT Name, JoinDate, EOMONTH(JoinDate, 1) AS Next_Month_End
FROM Employees

-- Last Day of Previous Month
SELECT Name, JoinDate, EOMONTH(JoinDate, -1) AS Previous_Month_End
FROM Employees;


---- DateAdd()
-- Add Years
SELECT DATEADD(year, 2, '2025-08-20') AS Add_2_Years;

--Subtract Years
SELECT DATEADD(year, -3, '2025-08-20') AS Subtract_3_Years;

-- Add Months
SELECT DATEADD(month, 2, '2025-08-20') AS Add_2_Months;

--Subtract Months
SELECT DATEADD(month, -4, '2025-08-20') AS Subtract_4_Months;

-- Add Days
SELECT DATEADD(day, 5, '2025-08-20') AS Add_5_Days;

-- Subtract Days
SELECT DATEADD(day, -10, '2025-08-20') AS Subtract_10_Days;


--- DateDiff()
-- Difference in Years
SELECT DATEDIFF(year, '2025-08-20', '2026-02-01') AS Year_Diff;

-- Difference in Months
SELECT DATEDIFF(month, '2025-08-20', '2026-02-01') AS Month_Diff;

-- Difference in Days
SELECT DATEDIFF(day, '2025-08-20', '2026-02-01') AS Day_Diff;

--- IsDate()
SELECT ISDATE('123') AS date_check_1,
       ISDATE('2025-08-20') AS date_check_2,
       ISDATE('20-08-2025') AS date_check_3,
       ISDATE(2025) AS date_check_4,
       ISDATE('August') AS date_check_5;

SELECT order_date
FROM Orders
WHERE ISDATE(order_date) = 0;

SELECT
  CASE
      WHEN ISDATE(order_date) = 1
      THEN CAST(order_date AS DATE)
      ELSE NULL
  END AS new_order_date
FROM Orders;

SELECT
  CASE
      WHEN ISDATE(order_date) = 1
      THEN CAST(order_date AS DATE)
      ELSE '9999-12-31'
  END AS new_order_date
FROM Orders;

