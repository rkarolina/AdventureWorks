SELECT TOP (10) 
	   [Ouery Auther] = 'Karolina'
	  ,[Ouery Number] = 10
	  ,[BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]

/* Ex.1
Write a query that selects your first name and age. 
Name the columns "First Name", and "Age", respecively.
*/

SELECT [First Name] = 'Karolina'
	   ,[Age] = 18

/* Ex.2
Write a query that outputs:
- All columns from the Sales.SalesOrderHeader table EXCEPT 
"roweguid" and "ModifiedDate".
- A column called "Query Run By" that outputs your first name.
This should be the first column in the query output.
The query should only output the top 5000 rows from the table.
*/

SELECT TOP (5000)
	   [Query Run By] = 'Karolina'
	  ,[SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  -- Select all the columns in the table
SELECT *
  FROM [AdventureWorks2019].[Person].[Address]

SELECT *
  FROM [Person].[Person]

SELECT * FROM [Sales].[Customer]
/*
Select all columns and the top 100 rows from
the "Production. Product" table, using SELECT *
*/
SELECT TOP(100) * FROM [Production].[Product]

/*
Copy and paste the queries from the first two exercises into a single query editor 
window, one below the other. 
*/
SELECT * FROM [Sales].[Customer]
SELECT TOP(100) * FROM [Production].[Product]
