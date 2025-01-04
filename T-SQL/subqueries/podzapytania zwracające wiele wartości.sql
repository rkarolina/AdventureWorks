SELECT
	BusinessEntityID
	,Bonus
FROM Sales.SalesPerson sp
WHERE
	sp.Bonus = (SELECT Bonus FROM Sales.SalesPerson WHERE BusinessEntityID = 280)

--Query returning multiple values
SELECT 
	ProductID
from Production.Product 
WHERE Color = 'Multi'

--Let's use the result in outer query - error
SELECT *
FROM Sales.SalesOrderDetail AS sod
WHERE 
	sod.ProductID = 
	(
		SELECT
			ProductID
			from Production.Product WHERE Color = 'Multi'
	)

--inner query put as resultset
SELECT *
FROM Sales.SalesOrderDetail AS sod
WHERE 
	sod.ProductID IN (712,713,714,715,716,855,856,857)

SELECT * 
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IN 
(
	SELECT 
	--*
	BusinessEntityID
	FROM Sales.SalesPerson
	WHERE TerritoryID = 1
)

SELECT * 
FROM Sales.SalesOrderHeader s
JOIN Sales.SalesPerson p ON s.SalesPersonID = p.BusinessEntityID
WHERE p.TerritoryID = 1


--Task 1 
SELECT * -- 3 rows
FROM Sales.SalesPerson
WHERE TerritoryID = 1

SELECT TOP(1) BusinessEntityID -- 1 row
FROM Sales.SalesPerson
WHERE TerritoryID = 1

--Task 2 -95 rows
SELECT * 
FROM Sales.SalesOrderHeader soh
WHERE SalesPersonID IN
	(SELECT TOP(1) BusinessEntityID
	FROM Sales.SalesPerson
	WHERE TerritoryID = 1)

--Task 3 --3 rows
SELECT BusinessEntityID
FROM Sales.SalesPerson
WHERE TerritoryID = 1

--Task 4 --424 rows
SELECT * 
FROM Sales.SalesOrderHeader soh
WHERE SalesPersonID IN
	(SELECT BusinessEntityID
	FROM Sales.SalesPerson
	WHERE TerritoryID = 1)

--change to return 94 rows
