--non corelated subquery
SELECT * FROM
	Production.Product
WHERE ProductID in(SELECT ProductID FROM Sales.SalesOrderDetail WHERE SalesOrderID = 43661)

--corelated subquery
--Products cheaper than average in the subcategory

SELECT
	p1.ProductID, p1.Name, p1.ListPrice, p1.ProductSubcategoryID
FROM Production.Product AS p1
WHERE 
	( --error if you execute only internal query
		SELECT 
			AVG(ListPrice) AS AvgInSubcategory
		FROM Production.Product p2
		WHERE p2.ProductSubcategoryID = p1.ProductSubcategoryID
	) >p1.ListPrice

--Products not cheaper than average in the subcategory
SELECT
	p1.ProductID, p1.Name, p1.ListPrice, p1.ProductSubcategoryID
	, 	(
		SELECT 
			AVG(ListPrice) AS AvgInSubcategory
		FROM Production.Product p2
		WHERE p2.ProductSubcategoryID = p1.ProductSubcategoryID
		)
FROM Production.Product AS p1
WHERE 
	( --error if you execute only internal query
		SELECT 
			AVG(ListPrice) AS AvgInSubcategory
		FROM Production.Product p2
		WHERE p2.ProductSubcategoryID = p1.ProductSubcategoryID
	) <= p1.ListPrice

--find seller having better results than total result in any of territories
SELECT  * FROM Sales.SalesPerson AS sp
SELECT  * FROM Sales.SalesTerritory

SELECT  
	sp.BusinessEntityID, sp.SalesLastYear
FROM Sales.SalesPerson AS sp
WHERE
	(
		SELECT COUNT(*)
		FROM Sales.SalesTerritory AS st
		WHERE st.SalesLastYear < sp.SalesLastYear) > 0 

--find last order data of each product (when was the product last sold?)
SELECT * FROM Sales.SalesOrderDetail sod1
SELECT * FROM Sales.SalesOrderHeader soh1

SELECT 
	DISTINCT sod1.ProductID, soh1.OrderDate
FROM Sales.SalesOrderDetail sod1
JOIN Sales.SalesOrderHeader soh1 ON sod1.SalesOrderID = soh1.SalesOrderID
WHERE 
	soh1.OrderDate = (
	SELECT MAX(soh2.OrderDate) FROM Sales.SalesOrderHeader soh2
	JOIN Sales.SalesOrderDetail sod2 ON sod2.SalesOrderID = soh2.SalesOrderID
	WHERE sod2.ProductID = sod1.ProductID
	)
--if avg sale for a salesman among other salesman with the same bonus is sdequate

SELECT *
FROM Sales.SalesPerson
GO

SELECT 
	sp1.BusinessEntityID, sp1.SalesLastYear, (SELECT AVG(sp2.SalesLastYear) FROM Sales.SalesPerson sp2 WHERE sp2.Bonus = sp1.Bonus)
FROM Sales.SalesPerson sp1
WHERE 
	sp1.SalesLastYear < (SELECT AVG(sp2.SalesLastYear) FROM Sales.SalesPerson sp2 WHERE sp2.bonus = sp1.Bonus)

/* Task 1
Write a query to with 2 tables 
HumanResources.Employee
*/
SELECT * FROM HumanResources.Employee emp
SELECT emp.BusinessEntityID FROM HumanResources.Employee emp

SELECT * FROM Person.Person
SELECT p.BusinessEntityID ,p.FirstName, p.LastName FROM Person.Person p

SELECT 
	emp.BusinessEntityID 
	,p.BusinessEntityID ,p.FirstName, p.LastName
FROM HumanResources.Employee AS emp
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID

/* Task 2
Use previous query from Task1.
Add a subquery with calculation:
how many times each employee changed a department in the company - count quantity of records in 
HumanResources.EmployeeDepartmentHistory = BusinessEntityID the same as this employee
*/

/*
Select *
FROM HumanResources.EmployeeDepartmentHistory
WHERE EndDate IS NOT NULL

Select COUNT(EndDate)
FROM HumanResources.EmployeeDepartmentHistory

*/
SELECT 
	p.FirstName, p.LastName
	,(SELECT COUNT(*) FROM HumanResources.EmployeeDepartmentHistory edh
		WHERE edh.BusinessEntityID = emp.BusinessEntityID) AS 'Amount of departments'
	,edh.DepartmentID,edh.StartDate,edh.EndDate
FROM HumanResources.Employee AS emp
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory edh ON p.BusinessEntityID = edh.BusinessEntityID

/*
Modify a query:
-add a coundidtion to select only employees with at least 2 departmentrs
*/

SELECT 
	p.FirstName, p.LastName
	,(SELECT COUNT(*) FROM HumanResources.EmployeeDepartmentHistory edh
		WHERE edh.BusinessEntityID = emp.BusinessEntityID) AS 'Amount of departments'
	,edh.DepartmentID,edh.StartDate,edh.EndDate
FROM HumanResources.Employee AS emp
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory edh ON p.BusinessEntityID = edh.BusinessEntityID
WHERE 
	(   --the same query as above
		SELECT COUNT(*) FROM HumanResources.EmployeeDepartmentHistory edh
		WHERE edh.BusinessEntityID = emp.BusinessEntityID
	) > 1

/* Task3
Use 
HumanResources.Employee and
Person.Person tables to display FirstName, LastName and hiring year of each employee
*/

SELECT
	p.FirstName, p.LastName, YEAR(emp.HireDate) as 'Year of Hire'
FROM HumanResources.Employee AS emp
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID

/*
Task 5
Use a previous query from Task4.
Add a subquery with number of people hired in the same year as any employee
*/

SELECT
	p.FirstName, p.LastName, YEAR(emp.HireDate) as 'Year of Hire'
	, (SELECT COUNT(*) FROM  HumanResources.Employee AS emp1
		WHERE YEAR(emp.HireDate) = YEAR(emp1.HireDate)) AS 'How many employees hired this year'
FROM HumanResources.Employee AS emp
JOIN Person.Person p ON emp.BusinessEntityID = p.BusinessEntityID

/*
Task 6
Use:
Sales.SalesPerson & Person.Person
Display columns: LastName, FirstName, Bonus, SalesQuota
*/
SELECT * FROM Sales.SalesPerson sp
SELECT * FROM Person.Person p

SELECT
	p.LastName, p.FirstName
	,sp.Bonus, sp.SalesQuota
FROM Sales.SalesPerson sp
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
/*
Task 7
Use a previous query from Task 6.
Add 2 subqueries:
- average amount of Bonus of all employees from the same territory (use TerritoryID)
- average amount of SalesQuota of all employees from the same territory (use TerritoryID)
*/
SELECT sp.Bonus, sp.SalesQuota, sp.TerritoryID
	,(SELECT AVG(spb.Bonus) FROM Sales.SalesPerson spb
		WHERE spb.TerritoryID = sp.TerritoryID) AS 'Average Bonus in the Territory'
FROM Sales.SalesPerson sp
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID

SELECT
	p.LastName, p.FirstName
	,sp.Bonus, sp.SalesQuota
	,(SELECT AVG(spb.Bonus) FROM Sales.SalesPerson spb
		WHERE spb.TerritoryID = sp.TerritoryID) AS 'Average Bonus in the Territory'
FROM Sales.SalesPerson sp
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID

/*
Task 8
Use Sales.SalesPerson table to display 
all columns from the tables for sellers who have
less SalesQuota than average SalesQuota
*/
SELECT *
FROM Sales.SalesPerson sp
WHERE sp.SalesQuota < (SELECT AVG(sp1.SalesQuota) FROM Sales.SalesPerson sp1)

/*
Task 9
Modify a query from Task 8.
Average SalesQuota should be for sellers from the same TerritotyID
*/
SELECT *
FROM Sales.SalesPerson sp
WHERE sp.SalesQuota < (SELECT AVG(sp1.SalesQuota) 
						FROM Sales.SalesPerson sp1
						WHERE sp1.TerritoryID = sp.TerritoryID)
/*
Task 10
Display a year and a month from OrderDate 
table (Sales.SalesOrderHeader)
*/
SELECT 
	--not working with aggregate function: soh.SalesOrderID, soh.OrderDate,
	YEAR(soh.OrderDate) AS 'Year'
	,MONTH(soh.OrderDate) AS 'Month'
	,COUNT(*) AS 'SalesThisYear (how many)'
FROM Sales.SalesOrderHeader soh
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY Year,Month
/*
Task 11
Use a query from Task 10.
Add information about number of orders at the same month last year. Use a subquery.
*/

SELECT 
	--not working with aggregate function: soh.SalesOrderID, soh.OrderDate,
	YEAR(soh.OrderDate) AS 'Year'
	,MONTH(soh.OrderDate) AS 'Month'
	,COUNT(*) AS 'SalesThisYear (how many)',
	(
		SELECT COUNT(*)
		FROM Sales.SalesOrderHeader soh1 --31465 - ONLY ONE VALUE
		WHERE
		YEAR(soh1.OrderDate) =YEAR(soh.OrderDate) - 1 AND Month(soh1.OrderDate)=MONTH(soh.OrderDate)) AS 'SalesLastYear'
FROM Sales.SalesOrderHeader soh
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY 'Year','Month'