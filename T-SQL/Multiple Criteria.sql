SELECT [BusinessEntityID]
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
  WHERE [JobTitle] = 'Sales Representative'
  AND [MaritalStatus] = 'S'

  SELECT [BusinessEntityID]
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
  WHERE [JobTitle] = 'Sales Representative'
  OR [MaritalStatus] = 'S'

SELECT [OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE [JobTitle] IN('Sales Representative', 'Research and Development Engineer', 'Senior Design Engineer') -- Many OR

/*
Select all people from the "Person.Person" table with a first name
of "Laura" and a last name of "Norman". Include only the following
columns in your output: PersonType, Title, FirstName, LastName
*/

SELECT [PersonType]
      ,[Title]
      ,[FirstName]
      ,[LastName]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [FirstName] = 'Laura' AND [LastName] = 'Norman'

/*
Modify your query as follows: Change your criteria to only
look for records where the person type is either
"SP", "EM", or "VC".
*/

SELECT [PersonType]
      ,[Title]
      ,[FirstName]
      ,[LastName]
  FROM [AdventureWorks2019].[Person].[Person]
  WHERE [PersonType] IN('SP','EM','VC')

SELECT [OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  WHERE [OrganizationLevel] = 4
  AND (SalariedFlag = 1 or JobTitle = 'Quality Assurance Technician')

/*
Select all rows from the "HumanResources.Employee" table
where gender = "F" AND the job title is either "Network Manager" 
OR "Application Specialist".
*/

SELECT *
FROM [HumanResources].[Employee]
WHERE [Gender] = 'F'
AND [JobTitle] IN('Network Manager', 'Application Specialist')

/*
Select all rows from the "Person.Person" table where person
type is "EM" AND there is a NULL value in either the "Title" or "MiddleName"
fields. Include the following fields in your query:
- PersonType (aliased as "Person Type")
- Title 
- FirstName (aliased as "First Name")
- MiddleName (aliased as "Middle Name")
- LastName (aliased as "Last Name")
- Suffix
*/

SELECT [Person Type] = [PersonType]
	   , [Title]
	   , [First Name] = [FirstName]
	   , [Middle Name] = [MiddleName]
	   , [Last Name] = [LastName]
	   , [Suffix]
FROM [Person].[Person]
WHERE [PersonType] = 'EM'
AND ([Title] IS NULL OR [MiddleName] IS NULL)

/*
Modify previous query. You are now selecting all rows
where person type is either "EM" or "SP" AND
there is a NULL value in either the "Title", 
"MiddleName" OR "Suffix" fields.
*/

SELECT [Person Type] = [PersonType]
	   , [Title]
	   , [First Name] = [FirstName]
	   , [Middle Name] = [MiddleName]
	   , [Last Name] = [LastName]
	   , [Suffix]
FROM [Person].[Person]
WHERE [PersonType] IN('EM', 'SP')
AND ([Title] IS NULL OR [MiddleName] IS NULL OR [Suffix] IS NULL)
