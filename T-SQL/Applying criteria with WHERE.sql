
SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      /*,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle] */
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
  WHERE [SalariedFlag] = 0
  --WHERE [JobTitle] = 'Research and Development Engineer'

 /* Ex.1
 Select any rows from the "Person.Person" table where the value in the "FirstName" column
 is "Pilar". Include all columns EXCEPT "BusinessEntityID","rowguid", 
 and "ModifiedDate" in your output.
*/

SELECT [PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [FirstName] = 'Pilar'

/*
 Select any rows from the "Purchasing.Vendor" table where the value in the "Name" column
 is "Northwind Traders". Include all columns EXCEPT "BusinessEntityID"
 and "ModifiedDate" in your output.
*/

SELECT [AccountNumber]
      ,[Name]
      ,[CreditRating]
      ,[PreferredVendorStatus]
      ,[ActiveFlag]
      ,[PurchasingWebServiceURL]
  FROM [AdventureWorks2019].[Purchasing].[Vendor]
  WHERE [Name] = 'Northwind Traders'

/*
 Modify your previous query by commenting out the WHERE statement, and then adding a new criterion 
 that filters for preferred vendors only - that is to say, where the value in the "PreferredVendorStatus"
 column is 1.
*/

SELECT [AccountNumber]
      ,[Name]
      ,[CreditRating]
      ,[PreferredVendorStatus]
      ,[ActiveFlag]
      ,[PurchasingWebServiceURL]
  FROM [AdventureWorks2019].[Purchasing].[Vendor]
 -- WHERE [Name] = 'Northwind Traders'
 WHERE [PreferredVendorStatus] = 1

-- Inequalities and NULLs

SELECT TOP (1000) [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesPerson]
  WHERE [SalesQuota] != 250000.00 -- != does not equal
  OR [SalesQuota] IS NULL

/*
Select any records from the "Person.Person" where the person
type is not equal to "IN". Do not include the "BusinessEntityID"
and "rowguid" fields in your output.
*/

SELECT [PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [PersonType] != 'IN'

/*
Select all people from the "Person.Person" who have a "Title".
Do not include the "BusinessEntityID" and "rowguid" fields
in your output.
*/
SELECT [PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [Title] IS NOT NULL

/*
Select all people from the "Person.Person" who do NOT have a
middle name listed.
Do not include the "BusinessEntityID" and "rowguid" fields
in your output.
*/
SELECT [PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [MiddleName] IS NULL

/*
Select all people from the "Person.Person" who do NOT have a
title of "Mr.". Make sure to include NULL values in your result.
*/
SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [Title] != 'Mr.'
  OR [Title] IS NULL
