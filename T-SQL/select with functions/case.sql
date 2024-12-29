SELECT 
	SalesOrderID
	,OrderDate
	,MONTH(OrderDate) AS 'Month'
	,MONTH((OrderDate)+2) / 3 AS 'Quarter number'
	,CASE(
		MONTH(OrderDate)+2) / 3
		WHEN 1 THEN 'First quarter'
		WHEN 2 THEN 'Second quarter'
		WHEN 3 THEN 'Third quarter'
		WHEN 4 THEN 'Fourth quarter'
		ELSE '????'
		END AS 'Quarter name'
FROM [Sales].[SalesOrderHeader]
GO 

SELECT
	pnt.PhoneNumberTypeID
	,pnt.[Name]
	,CASE
		WHEN [Name] = 'Cell' THEN 'mobile phone'
		WHEN [Name] IN( 'Home','Work') THEN 'Stationary'
		ELSE 'Other'
		END AS 'Type of phone'
FROM  [Person].[PhoneNumberType] pnt
GO

SELECT
	pnt.PhoneNumberTypeID
	,pnt.[Name]
	,CASE [Name]
		WHEN 'Cell' THEN 'mobile phone'
		WHEN 'Home' THEN 'Stationary'
		WHEN 'Work' THEN 'Stationary'
		ELSE 'Other'
		END AS 'Type of phone'
FROM  [Person].[PhoneNumberType] pnt
GO

SELECT
	pnt.PhoneNumberTypeID
	,pnt.[Name]
	,CASE pnt.PhoneNumberTypeID
		WHEN  1 THEN 'mobile phone'
		WHEN  2 THEN 'Stationary'
		WHEN  3 THEN 'Stationary'
		ELSE 'Other'
		END AS 'Type of phone'
FROM  [Person].[PhoneNumberType] pnt
GO

SELECT 
	p.ProductID
	,p.[Name]
	,p.Size
	,CASE 
		WHEN SIZE IS NULL THEN 'NO INFORMATION'
		WHEN SIZE = 'S' THEN 'SMALL'
		WHEN SIZE = 'M' THEN 'MEDIUM'
		WHEN SIZE = 'L' THEN 'LARGE'
		WHEN SIZE = 'XL' THEN 'EXTRA LARGE'
		ELSE 'OTHER'
		END AS 'Size Description'
FROM [Production].[Product] p
