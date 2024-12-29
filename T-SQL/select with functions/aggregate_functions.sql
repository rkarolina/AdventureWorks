SELECT *  FROM [Production].[Product] --504 records

SELECT COUNT(name) AS 'Number of records' FROM [Production].[Product] -- sum = 504
SELECT COUNT(*) AS 'Number of records (name)' FROM [Production].[Product]
SELECT COUNT(Color) AS 'Number of record (color)' FROM [Production].[Product] -- sum = 256
SELECT COUNT(1) AS 'Number of records (1)' FROM [Production].[Product] -- sum = 504

SELECT AVG(ListPrice) AS 'Average of List Price' FROM [Production].[Product] --438,6662
SELECT MIN(ListPrice) AS 'Min' FROM [Production].[Product] --0,00
SELECT MAX(ListPrice) AS 'Max' FROM [Production].[Product] --3578,27
SELECT SUM(ListPrice) AS 'Sum' FROM [Production].[Product] --221087,79

--in one query:
SELECT 
	AVG(ListPrice) AS 'Average of List Price' 
	,MIN(ListPrice) AS 'Min'
	,MAX(ListPrice) AS 'Max'
	,SUM(ListPrice) AS 'Sum'
FROM [Production].[Product]

-- Subcategory of product
SELECT 
	p.ProductSubcategoryID
	,p.[Name]
FROM [Production].[Product] p

SELECT *
FROM [Production].[ProductSubcategory]

--error: Column 'Production.Product.ProductSubcategoryID' 
--is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
SELECT 
	p.ProductSubcategoryID
	,COUNT(*) AS 'Number of products in subcategory'
FROM [Production].[Product] p

--now it works with group by
SELECT 
	p.ProductSubcategoryID
	,COUNT(*) AS 'Number of products in subcategory'
FROM [Production].[Product] p
GROUP BY p.ProductSubcategoryID

-- order by
SELECT 
	p.ProductSubcategoryID
	,COUNT(*) AS 'Number of products in subcategory'
FROM [Production].[Product] p
GROUP BY p.ProductSubcategoryID
ORDER BY p.ProductSubcategoryID DESC

-- order by with alias
SELECT 
	p.ProductSubcategoryID AS 'SUBCATEGORY'
	,COUNT(*) AS 'Number of products in subcategory'
FROM [Production].[Product] p
GROUP BY p.ProductSubcategoryID
ORDER BY SUBCATEGORY DESC

SELECT 
	p.ProductSubcategoryID AS 'SUBCATEGORY'
	,MIN(ListPrice) AS 'MinPrice'
FROM [Production].[Product] p
WHERE p.ProductSubcategoryID IS NOT NULL
GROUP BY p.ProductSubcategoryID
ORDER BY MinPrice DESC

--having
SELECT 
	p.ProductSubcategoryID AS 'SUBCATEGORY'
	,MIN(ListPrice) AS 'MinPrice'
FROM [Production].[Product] p
WHERE p.ProductSubcategoryID IS NOT NULL
GROUP BY p.ProductSubcategoryID
HAVING MIN(ListPrice) > 500
--HAVING MinPrice > 500 not work with alias!
ORDER BY MinPrice DESC

