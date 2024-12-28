-- conversion functions

--1) Cannot convert a char value to money. The char value has incorrect syntax.
SELECT 
	 TotalDue
	 ,'Total Due equals ' + TotalDue
FROM [Sales].[SalesOrderHeader]
WHERE SalesOrderID IN (75121,75072,74982)

-- https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-type-precedence-transact-sql?view=sql-server-ver16

SELECT 
	 TotalDue
	 ,'Total Due equals ' + CAST(TotalDue AS VARCHAR(100))
FROM [Sales].[SalesOrderHeader]
WHERE SalesOrderID IN (75121,75072,74982)


SELECT 
	 TotalDue
	 ,'Total Due equals ' + CONVERT(VARCHAR(100),TotalDue)
FROM [Sales].[SalesOrderHeader]
WHERE SalesOrderID IN (75121,75072,74982)

DECLARE @d DATETIME = '2016-07-30'
SELECT
	CAST(@d AS VARCHAR(20)) AS 'CAST'
	,CONVERT(VARCHAR(20), @d, 101) AS 'US'
	,CONVERT(VARCHAR(20), @d, 102) AS 'ANSI'
	,CONVERT(VARCHAR(20), @d, 104) AS 'German'

-- https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16

DECLARE @txt CHAR(10) = '2016-07-12'
SELECT DAY(@txt) AS Day
GO

--doesnt work
--Conversion failed when converting date and/or time from character string.
DECLARE @txt CHAR(10) = '16/07/12'
SELECT DAY(@txt) AS Day
GO

--solution
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/parse-transact-sql?view=sql-server-ver16
DECLARE @txt CHAR(10) = '16/07/12'
SELECT PARSE(@txt AS DATE USING 'pl-PL')
SELECT PARSE(@txt AS DATE USING 'de-DE')
SELECT PARSE(@txt AS DATE USING 'fr-FR')
GO

DECLARE @txt CHAR(10) = '12 lipca 2016'
SELECT PARSE(@txt AS DATE USING 'pl-PL')
GO

DECLARE @txt CHAR(10) = '12 lipca 2016'
SELECT TRY_PARSE(@txt AS DATE USING 'pl-PL')
SELECT TRY_PARSE(@txt AS DATE USING 'de-DE') --return NULL
SELECT TRY_PARSE(@txt AS DATE USING 'fr-FR') --return NULL
GO

DECLARE @txt CHAR(10) = '16/07/12'
SELECT TRY_PARSE(@txt AS DATE USING 'en-US') --return NULL
SELECT PARSE(@txt AS DATE USING 'en-US') --error
GO

DECLARE @txt CHAR(10) = '16/07/12'
SELECT TRY_CAST(@txt AS DATE)  --return NULL
SELECT TRY_CONVERT(date, @txt) --return NULL
GO

SELECT 
	'Shift starts at '+ CONVERT(VARCHAR(100),StartTime)
FROM [HumanResources].[Shift]

-- logical functions

SELECT 
	Name
	,DaysToManufacture
	,IIF(DaysToManufacture=0,'True','False') AS 'Output'
FROM [Production].[Product]
GO

SELECT 
	SalesOrderID
	,OrderDate
	,MONTH(OrderDate) AS 'Month'
	,MONTH((OrderDate)+2) / 3 AS 'Quarter number'
	,CHOOSE(
		MONTH((OrderDate)+2) / 3,
		'First quarter',
		'Second quarter',
		'Third quarter',
		'Fourth quarter') AS 'Quarter name'
FROM [Sales].[SalesOrderHeader]
GO 

SELECT
	LoginID
	,HireDate
	,DATEDIFF(year, HireDate, GetDate()) AS 'Years Worked'
	,IIF(DATEDIFF(year, HireDate, GetDate()) > 15,
	'Old stranger', --true
	'Adept') AS 'Result'
FROM [HumanResources].[Employee]
GO

SELECT
	LoginID
	,HireDate
	,DATEDIFF(year, HireDate, GetDate()) AS 'Years Worked'
	,IIF(DATEDIFF(year, HireDate, GetDate()) > 13,
		'Old stranger',
		IIF(DATEDIFF(year, HireDate, GetDate()) > 11,
		'Veteran',
		'Adept'))
FROM [HumanResources].[Employee]

SELECT 
	SalesOrderID,
	OrderDate
	,DATEPART(WEEKDAY,OrderDate) AS 'Week Day'
	,CHOOSE(DATEPART(WEEKDAY,OrderDate),
	'poniedzia³ek',
	'wtorek',
	'œroda',
	'czwartek',
	'pi¹tek',
	'sobota',
	'niedziela'
	)
FROM [Sales].[SalesOrderHeader]
