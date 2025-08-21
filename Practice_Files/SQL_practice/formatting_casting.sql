---- Format  
-- Basic Date Formatting
SELECT Name, JoinDate,
       FORMAT(JoinDate, 'dd/MM/yyyy') AS Formatted_Date
FROM Employees;

--  Month Names and Day Names
SELECT Name, JoinDate,
       FORMAT(JoinDate, 'dddd, MMMM dd yyyy') AS Full_Format
FROM Employees;

-- Culture-Specific Formatting
SELECT FORMAT(JoinDate, 'D', 'ja-JP') AS Japanese_Format
FROM Employees;

-- Custom Complex Format
SELECT Name, JoinDate,
       FORMAT(JoinDate, 'ddd MMM yyyy h:mm tt') AS Custom_Format
FROM Employees;

-- Examples Using Numbers
SELECT FORMAT(12345.678, 'N2') AS Number_Format; 
SELECT FORMAT(0.756, 'P1') AS Percentage_Format;
SELECT FORMAT(1500000, 'C', 'en-IN') AS Currency_Format;


-- Casting
-- String to Integer
SELECT CAST('123' AS INT) AS String_To_Int;

-- Integer to String
SELECT CAST(123 AS VARCHAR(10)) AS Int_To_String;

-- String to Date
SELECT CAST('2023-01-01' AS DATE) AS String_To_Date;

-- String to DateTime
SELECT CAST('2023-01-01' AS DATETIME) AS String_To_DateTime;

-- DateTime to Date (Remove Time Part)
USE MypracticeDB; 

SELECT CAST(JoinDate AS DATE) AS Date_Only, JoinDate
FROM Employees;


--- Convert()
-- Convert String to Integer
SELECT CONVERT(int, '123') AS [String_To_Integer];

-- Convert String to Date
SELECT CONVERT(date, '2023-01-01') AS [String_To_Date];

-- Convert DateTime to Date (Remove Time Part)
SELECT CONVERT(date, JoinDate) AS Date_Only, JoinDate
FROM Employees;

-- USA Date Format (MM/DD/YY)
SELECT CONVERT(varchar, JoinDate, 1) AS USA_Format
FROM Employees;

-- European Date Format (DD.MM.YY)
SELECT CONVERT(varchar, JoinDate, 4) AS European_Format
FROM Employees;

-- Full Date & Time (ISO Format)
SELECT CONVERT(varchar, JoinDate, 120) AS ISO_Format
FROM Employees;