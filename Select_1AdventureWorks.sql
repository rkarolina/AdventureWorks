USE AdventureWorks2019
GO

SELECT * FROM [Sales].[SpecialOffer]
GO

SELECT [SpecialOfferID]
      ,[Description]
      ,[DiscountPct]
      ,[Type]
      ,[Category]
      ,[StartDate]
      ,[EndDate]
      ,[MinQty]
      ,[MaxQty]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SpecialOffer]

SELECT 
	Description
	,DiscountPct
FROM Sales.SpecialOffer

SELECT
	s.Category
	,s.DiscountPct
FROM Sales.SpecialOffer AS s
 
SELECT *
FROM Sales.SpecialOffer
WHERE 
	Category='Reseller'
	AND DiscountPct > 0.05
	AND MinQty = 0
	OR Category = 'No Discount'
GO

SELECT [ProductID]
      ,p.[Name]
	  ,p.[ListPrice]
      ,p.[Color]
  FROM [AdventureWorks2019].[Production].[Product] p 
 -- WHERE Color = 'blue'

 use tempdb
 GO
 SELECT * FROM AdventureWorks2019.Production.ScrapReason

 USE AdventureWorks2019
 GO

 SELECT * FROM Production.Product
	WHERE 
	ListPrice > 0 
GO

SELECT * FROM Production.Product
	WHERE 
	ListPrice > 0 AND ListPrice < 200

SELECT * FROM Production.Product
	WHERE 
	ListPrice > 0 
	AND NOT ListPrice >= 200

SELECT * FROM Production.Product
	WHERE 
	ListPrice BETWEEN 0 AND 200
GO

SELECT * FROM Production.Product
	WHERE 
	Color = 'Black'
	OR Color = 'Silver'
	OR Color = 'Yellow'

	SELECT 
	p.Name
	,p.Color
	,p.ListPrice
	,p.Size
FROM Production.Product p
WHERE 
	Color = 'Blue' and ListPrice > 100
	OR Color = 'Multi' and ListPrice < 50

SELECT 
	p.Name
	,p.Color
	,p.ListPrice
	,p.Size
FROM Production.Product p
WHERE 
	(Color = 'Blue' and ListPrice > 100
	OR Color = 'Multi' and ListPrice < 50)
	AND Size = 'XL'

SELECT * FROM Production.Product
	WHERE 
	Color IN ( 'Black','Silver', 'Yellow')

SELECT * FROM [Sales].[SalesOrderHeader]

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE OrderDate BETWEEN '2011-06-12' AND '2011-06-13'

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE OrderDate >= '2011-06-12' AND OrderDate <='2011-06-13'

SELECT * FROM HumanResources.Employee

SELECT 
	e.JobTitle
	,e.BirthDate
	,e.Gender
	,e.VacationHours
FROM HumanResources.Employee e
WHERE 
	BirthDate >= '1980-01-01' 
	AND Gender = 'M'

SELECT 
	e.JobTitle
	,e.BirthDate
	,e.Gender
	,e.VacationHours
FROM HumanResources.Employee e
WHERE 
	VacationHours BETWEEN 80 AND 89
	OR (BirthDate >= '1980-01-01' 
	AND Gender = 'M'
	AND VacationHours BETWEEN 80 AND 89)

SELECT 
	e.JobTitle
	,e.BirthDate
	,e.Gender
	,e.VacationHours
FROM HumanResources.Employee e
WHERE 
	(Gender = 'M' AND VacationHours BETWEEN 90 AND 99
	OR Gender = 'K' AND VacationHours BETWEEN 80 AND 89)
	AND BirthDate >= '1990-01-01'

SELECT 
	e.JobTitle
	,e.BirthDate
	,e.Gender
	,e.VacationHours
FROM HumanResources.Employee e
WHERE JobTitle IN ('Marketing Specialist', 'Control Specialist', 'Accounts Receivable Specialist', 'Benefits Specialist')
ORDER BY JobTitle

