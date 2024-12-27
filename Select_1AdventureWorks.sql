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

SELECT * FROM Person.Address
WHERE
	PostalCode LIKE '[89]47%' -- ONLY 8 OR 9 as first characters

SELECT * FROM Person.Address
WHERE
	PostalCode LIKE '[^89]%'

SELECT * FROM Person.Address
WHERE
	PostalCode LIKE '____' --shows only 4 characters records

	SELECT * FROM Person.Address
WHERE
	PostalCode LIKE '___' -- 3 characters

SELECT * FROM Person.Address
WHERE
	PostalCode LIKE '6___' --4 characters but first character is '6'

SELECT * FROM Production.ProductDescription
UPDATE Production.ProductDescription
	SET Description = 'Very good quality 100% guarantee'
	WHERE ProductDescriptionID = 1607

SELECT * FROM Production.ProductDescription
	WHERE Description like '%' --do not work with searching of '%'

--possible solution 1
SELECT * FROM Production.ProductDescription
	WHERE Description like '%[%]%' -- put '%' into square bracket

--possible solution 2
SELECT * FROM Production.ProductDescription
	WHERE Description like '%\%%' ESCAPE '\'

-- Task 1 - show only records containing "Specialist" in JobTitle column
SELECT JobTitle FROM HumanResources.Employee
	WHERE JobTitle LIKE '%Specialist%'

--Task 2 - show only records containing "Specialist" and "Marketing" in JobTitle column
SELECT * FROM HumanResources.Employee
	WHERE JobTitle LIKE '%Specialist%' AND JobTitle LIKE '%Marketing%'

--Task 3 - show only records containing "Specialist" OR "Marketing" in JobTitle column
SELECT * FROM HumanResources.Employee
	WHERE JobTitle LIKE '%Specialist%' OR JobTitle LIKE '%Marketing%'

--Task 4 - show only records containing at least 1 digit in the Name column
SELECT * FROM Production.Product
	WHERE [Name] LIKE '%[0-9]%'

--Task 5 - show only records containing 2 digits in the Name column
SELECT * FROM Production.Product
	WHERE [Name] LIKE '%[0-9][0-9]%'

SELECT * FROM Production.Product ---- co to robi w takim razie?
	WHERE [Name] LIKE '%[0-9]__%'

--Task 6 - show only records containing 2 digits but without digit at the end 
SELECT * FROM Production.Product
	WHERE [Name] LIKE '%[0-9][0-9]%[^0-9]'

--Task 7 - show only records with 4 characters in the Name column
SELECT * FROM Production.Product
	WHERE [Name] LIKE '____'

SELECT * FROM Production.Product -- 5 characters
	WHERE [Name] LIKE '_____'

SELECT 
	p.BusinessEntityID
	,p.LastName
	,p.FirstName
FROM Person.Person p 
WHERE p.BusinessEntityID = 163

SELECT 
	e.BusinessEntityID
	,e.LoginID
FROM HumanResources.Employee e
WHERE e.BusinessEntityID = 163

SELECT 
	 LastName
	,FirstName
	,LoginID
FROM Person.Person
JOIN HumanResources.Employee 
	ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID

SELECT 
	 p.LastName
	,p.FirstName
	,e.LoginID
FROM Person.Person p
JOIN HumanResources.Employee e
	ON p.BusinessEntityID = e.BusinessEntityID

--Task 1 - add new column 
SELECT
	sod.UnitPrice 
	,sod.OrderQty
	,sod.UnitPrice*OrderQty AS [Wartoœæ Sprzedazy]
FROM Sales.SalesOrderDetail sod

--Task 2
SELECT --DISTINCT UnitPriceDiscount --FROM
	sod.UnitPrice 
	,sod.OrderQty
	,sod.UnitPriceDiscount
	,sod.OrderQty*(UnitPrice-UnitPriceDiscount) AS [OrderQty*(UnitPrice-UnitPriceDiscount)]
	,sod.OrderQty*(UnitPrice*(1-UnitPriceDiscount)) AS [OrderQty*(UnitPrice*(1-UnitPriceDiscount))]
FROM Sales.SalesOrderDetail sod
ORDER BY UnitPriceDiscount DESC

--Task 3
SELECT 
	sc.CardType + ':' + sc.CardNumber AS [Type and number of the card]
FROM [Sales].[CreditCard] sc

--Task 4 
SELECT 
	soh.SalesOrderNumber
	,soh.PurchaseOrderNumber
FROM [Sales].[SalesOrderHeader] soh

--Task 5 - NULL values
SELECT 
	soh.SalesOrderNumber
	,soh.PurchaseOrderNumber
	,(soh.SalesOrderNumber + '-' +
	soh.PurchaseOrderNumber) AS 'Sales Order Number - Purchase Order Number'
FROM [Sales].[SalesOrderHeader] soh

--Task 6 - avoiding NULL values
SELECT 
	soh.SalesOrderNumber
	,soh.PurchaseOrderNumber
	,CONCAT(soh.SalesOrderNumber,'-'
	,soh.PurchaseOrderNumber) AS 'Sales Order Number - Purchase Order Number with CONCAT function'
FROM [Sales].[SalesOrderHeader] soh

