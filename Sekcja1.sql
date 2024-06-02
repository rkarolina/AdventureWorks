
/* Exercise 1.
Select the first 3.000 rows from the Person.Person table. Display only
the Title, LastName, FirstName columns, in that order. */

SELECT TOP (3000)
       [Title]
      ,[LastName]
      ,[FirstName]
  FROM [AdventureWorks2019].[Person].[Person]

/* Exercise 2.
Select the first 500 rows from the Sales.SalesOrderHeader table.
Display only the OrderDate, DueDate, ShipDate, and TotalDue colums, in that order.*/

SELECT TOP (500)
       [OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[TotalDue]
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

/* Exercise 3.
Select the first 100 rows from the Sales.SalesPerson table.
Display only the SalesLastYear and SalesYTD colums, in that order.*/

SELECT TOP (100)
       [SalesLastYear]
      ,[SalesYTD]
  FROM [AdventureWorks2019].[Sales].[SalesPerson]

/* Aliasing columns */
 SELECT 
OrganizationLevel AS OrganizationLvl,
[JobTitle] JobTitle, --the same as with AS
[Hire Date] = [HireDate], --and other way to rename
VacationHoursss = [VacationHours]
FROM 
[HumanResources].[Employee]

/* Exercise 1.
Modify the query in the "Aliasing Columns - Example Code.sql"
file such that all column names in the query output have spaces 
between the words */

/* Aliasing columns */
 SELECT 
[Organization Level] = [OrganizationLevel],
[Job Title] = [JobTitle],
[Hire Date] = [HireDate],
[Vacation Hours] = [VacationHours]
FROM 
[AdventureWorks2019].[HumanResources].[Employee]

/* Exercise 2.
Write a query thet outputs the "Name" and "ListPrice" fields from
the "Production.Product" table. These column names in the query output should 
read "Product Name" and "List Price $$",
respectively. */

SELECT
	[Product Name] = [Name],
	[List Price $$] = [ListPrice]
FROM [Production].[Product]

/* Exercise 3.
Write a query thet outputs the "PurchaseOrderID", "OrderQty", and "LineTotal"
fields from the "Purchasing.PurchaseOrderDetail" table.
"PurchaseOrderID" should be renamed to "OrderID", and "OrderQty" to "OrderQuantity".
"LineTotal" can remain unchanged. */

SELECT
	[OrderID] = [PurchaseOrderID],
	[OrderQuantity] = [OrderQty],
	[LineTotal]
FROM [Purchasing].[PurchaseOrderDetail]