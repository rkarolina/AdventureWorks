-- UNION ALL
SELECT CustomerID AS ID, PersonID, 'Customer' AS Role
FROM Sales.Customer -- 19 820

UNION ALL-- 19 820 + 290 = 

SELECT BusinessEntityID AS ID, NULL AS PersonID, 'Employee' AS Role
FROM HumanResources.Employee; -- 290



-- UNION
SELECT CustomerID AS ID, PersonID, 'Customer' AS Role
FROM Sales.Customer -- 19 820

UNION -- 19 820 + 290 = 20110

SELECT BusinessEntityID AS ID, NULL AS PersonID, 'Employee' AS Role
FROM HumanResources.Employee; -- 290

-- EXCEPT in SQL is used to compare two queries and returns rows from the first query.
SELECT BusinessEntityID
FROM Person.Person -- 19 972
EXCEPT -- 19972-290 = 19 682
SELECT BusinessEntityID
FROM HumanResources.Employee; -- 290

-- INTERSECT
SELECT BusinessEntityID -- 290
FROM HumanResources.Employee
INTERSECT -- returns only records existing in both tables (290)
SELECT BusinessEntityID
FROM Person.Person; -- 19 972

SELECT BusinessEntityID
FROM Person.Person -- 19 972
INTERSECT -- the same - 290
SELECT BusinessEntityID -- 290
FROM HumanResources.Employee

-- RowCount in AdentureWorks2019 database
SELECT 
    t.name AS TableName,
    p.rows AS [RowCount]
FROM 
    sys.tables t
INNER JOIN 
    sys.partitions p
ON 
    t.object_id = p.object_id
WHERE 
    p.index_id IN (0, 1)
ORDER BY 
    p.rows DESC;


SELECT * FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000

SELECT Count(SalesOrderID) AS [Number of orders] -- 3 
FROM Sales.SalesOrderHeader 
WHERE CustomerID = 11000

SELECT SUM(SubTotal) AS [Sum of amount in orders]
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000

SELECT 
	SalesOrderID,
    OrderDate,
	CustomerID,
    SUM(SubTotal) OVER (PARTITION BY CustomerID) AS TotalSpentByCustomer
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000

