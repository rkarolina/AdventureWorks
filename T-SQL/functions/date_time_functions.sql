--SYSDATETIME() - datetime2 , SYSDATETIMEOFFSET -  with time zone
SELECT
	GETDATE() AS [GETDATE], SYSDATETIME() AS [SYSDATETIME], SYSDATETIMEOFFSET() AS [SYSDATETIMEOFFSET] 
GO

SELECT
	SYSDATETIMEOFFSET() 'My time'
	,SWITCHOFFSET(SYSDATETIMEOFFSET(), '-01:00') 'Time in other time zone'
GO

DECLARE @d DATETIME2 = '2016-01-01 14:55:32' --Friday
SELECT
	YEAR(@d) AS 'Year'
	,MONTH(@d) AS 'Month'
	,DAY(@d) AS 'Day'
	,DATEPART(M,@d) AS 'Month'
	,DATEPART(hh,@d) AS 'Hour'
	,DATEPART(n,@d) AS 'Minute'
	,DATEPART(mi,@d) AS 'Minute'
	,DATEPART(dw,@d) AS 'WeekDay'
	,DATEPART(wk,@d) AS 'Week'
GO

SET DATEFIRST 1 --Monday is the first day in week
SELECT DATEPART(dw,'2016-01-01') AS 'WeekDay'

SET DATEFIRST 7 --Sunday is the first day in week
SELECT DATEPART(dw,'2016-01-01') AS 'WeekDay'

DECLARE @d DATETIME2 = '2016-01-01 14:55:32' --Friday
SELECT
	YEAR(@d) AS 'Year'
	,MONTH(@d) AS 'Month'
	,DAY(@d) AS 'Day'
	,DATENAME(M,@d) AS 'Month'
	,DATENAME(hh,@d) AS 'Hour'
	,DATENAME(n,@d) AS 'Minute'
	,DATENAME(mi,@d) AS 'Minute'
	,DATENAME(dw,@d) AS 'WeekDay'
	,DATENAME(wk,@d) AS 'Week'
GO

SET LANGUAGE POLISH
SELECT DATENAME(dw,'2016-01-01') AS 'WeekDay'

SET LANGUAGE GERMAN
SET DATEFIRST 7 --Sunday is the first day in week
SELECT DATENAME(dw,'2016-01-01') AS 'WeekDay'

DECLARE @d DATE = '1/2/3'
SELECT @d
GO

SET DATEFORMAT ymd
DECLARE @d DATE = '1/2/3' 
SELECT @d AS [YYYY-MM-DD]
GO

SET DATEFORMAT dmy
DECLARE @d DATE = '1/2/3'
SELECT @d AS [YYYY-MM-DD]
GO

SELECT DATEFROMPARTS(2016,9,1)
GO

SELECT GETDATE(),EOMONTH(GETDATE()) --the last day of month (end of month)
GO

--Calculations with dates based on Adventure Works tables
-- Calculate date 14 days + orderDate (to pay the invoice)
SELECT 
	 SalesOrderID,OrderDate
	 ,DATEADD(d,14,OrderDate)
FROM [Sales].[SalesOrderHeader]
WHERE SalesOrderID IN (75121,75072,74982)

SELECT 
	 SalesOrderID,OrderDate,DueDate
	 ,DATEDIFF(d,OrderDate,DueDate) -- d - days, OrderDate (begining), DueDate (end)
FROM [Sales].[SalesOrderHeader]
WHERE SalesOrderID IN (75121,75072,74982)

-- Task 1 - display today date
SELECT GETDATE() AS [GETDATE]
-- Task 2 - display parameters from OrderDate column:
SELECT 
	soh.SalesOrderID
	,soh.OrderDate
	,YEAR(OrderDate) AS 'Year'
	,MONTH(OrderDate) AS 'Month'
	,DAY(OrderDate) AS 'Day'
	,DATEPART(dw,OrderDate) AS 'WeekDay'
	,DATEPART(wk,OrderDate) AS 'Week of the Year'
FROM [Sales].[SalesOrderHeader] soh

-- Task 3 - display month and weekday as text
SET LANGUAGE POLISH
SELECT 
	soh.SalesOrderID
	,soh.OrderDate
	,YEAR(OrderDate) AS Year
	,DATENAME(M,OrderDate) AS Month
	,DAY(OrderDate) AS Day
	,DATENAME(dw,OrderDate) AS WeekDay
	,DATEPART(wk,OrderDate) AS 'Week of the Year'
FROM [Sales].[SalesOrderHeader] soh

-- Task 4 - display day of the week from specific date
DECLARE @z DATE = '1990-12-21'
SELECT 
	DATENAME(dw,@z) AS 'WeekDay'
-- Task 5 - prepare a report of employees with their birthday date.
		-- first day of the birthday month (date), the last day of the birthday month (date)
SELECT
	emp.LoginID
	,emp.BirthDate
	,DATEADD(DAY,1,EOMONTH(BirthDate)) AS [Begining of the month - date]
	,EOMONTH(BirthDate) AS [End of the month - date]
	,FORMAT(EOMONTH(BirthDate), 'dd') AS [Last day of the birthday month]
FROM [HumanResources].[Employee] emp

--OR using DATEFROMPARTS function:
SELECT
	emp.LoginID
	,emp.BirthDate
	,DATEFROMPARTS(YEAR(GETDATE()),MONTH(emp.BirthDate),1) AS [Begining of the month - date]
	,EOMONTH(DATEFROMPARTS(YEAR(GETDATE()),MONTH(emp.BirthDate),1)) AS [End of the month - date]
FROM [HumanResources].[Employee] emp

/* Task 6
Calculate an age
Based on date 21.12.1990
*/
SELECT DATEFROMPARTS(1990,12,21) AS [Example Date]
	,FORMAT (GetDate(), 'yyyy-MM-dd') AS [Today Date]
	,DATEDIFF(YEAR,DATEFROMPARTS(1990,12,21),FORMAT (GetDate(), 'yyyy-MM-dd')) AS [Age]

--or using variables
DECLARE @exdate DATE = '1990-12-21'
DECLARE @today DATE = GetDATE()
SELECT 
	DATEDIFF(YEAR,@exdate,@today) AS [Age in Years],
	DATEDIFF(DAY,@exdate,@today) AS [Age in Days]

/* Task 7
Display an employee with LoginID=adventure-works\diane1 and people who was born one year before or after her
*/

SELECT 
	emp.LoginID
	,emp.BirthDate
FROM [HumanResources].[Employee] emp
WHERE LoginID = 'adventure-works\diane1' -- BirthDate '1986-06-05'

SELECT 
	emp.LoginID
	,emp.BirthDate
FROM [HumanResources].[Employee] emp
WHERE BirthDate BETWEEN DATEADD(YEAR,-1,'1986-06-05') AND DATEADD(YEAR,1,'1986-06-05')
ORDER BY BirthDate

--similar solution using a variable - not the same 
-- this solution gives 3 records more
-- it includes also emp born after 05.05.1987
DECLARE @BirthDate DATE
SELECT @BirthDate=BirthDate FROM HumanResources.Employee
WHERE LoginID = 'adventure-works\diane1'

SELECT 
	emp.LoginID
	,emp.BirthDate
FROM [HumanResources].[Employee] emp
WHERE BirthDate BETWEEN DATEADD(YEAR,-1,@BirthDate) AND DATEADD(YEAR,1,@BirthDate)
ORDER BY BirthDate
