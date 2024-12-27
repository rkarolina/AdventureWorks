SELECT * FROM [Person].[Person]

SELECT
	FirstName, LastName
FROM [Person].[Person]

SELECT
	FirstName+ ' '+ LastName AS Name
FROM [Person].[Person]

SELECT
	CONCAT(FirstName,' ', LastName) AS Name
FROM [Person].[Person]

SELECT
FirstName,MiddleName, LastName
FROM [Person].[Person]

-- if you have NULL value in one of the colums = output will be NULL
SELECT
FirstName,MiddleName, LastName, FirstName + ' ' + MiddleName + ' ' + LastName AS Output
FROM [Person].[Person]

-- CONCAT can handle NULL value
SELECT
FirstName,MiddleName, LastName, CONCAT(FirstName, ' ' ,MiddleName ,' ' , LastName) AS Output
FROM [Person].[Person]

SELECT BusinessEntityID, VacationHours
FROM HumanResources.Employee

SELECT BusinessEntityID, VacationHours, VacationHours / 8 AS [Full Vacation Days]
FROM HumanResources.Employee

SELECT BusinessEntityID, VacationHours, VacationHours / 8 AS [Full Vacation Days Left], 
VacationHours % 8  AS [Full Vacation Hours Left]
FROM HumanResources.Employee

SELECT BusinessEntityID, HireDate, YEAR(HireDate) AS [Employed year]
FROM HumanResources.Employee

SELECT BusinessEntityID,YEAR(HireDate), GETDATE()
FROM HumanResources.Employee

SELECT BusinessEntityID,YEAR(HireDate), YEAR(GETDATE())
FROM HumanResources.Employee


SELECT 
	BusinessEntityID,YEAR(HireDate) AS [Hire Year], 
	YEAR(GETDATE()) AS [Current Year], 
	YEAR(GETDATE()) - YEAR(HireDate) AS [Work anniversary]
FROM HumanResources.Employee

SELECT 
	BusinessEntityID,YEAR(HireDate) AS 'Hire Year', 
	YEAR(GETDATE()) AS [Current Year], 
	YEAR(GETDATE()) - YEAR(HireDate) AS [Work anniversary]
FROM HumanResources.Employee
WHERE (YEAR(GETDATE()) - YEAR(HireDate)) % 5 = 0 --anniversary 5,10,15 etc...

SELECT 
	BusinessEntityID,YEAR(HireDate) AS [Hire Year], 
	YEAR(GETDATE()) AS [Current Year], 
	YEAR(GETDATE()) - YEAR(HireDate) AS [Work anniversary]
FROM HumanResources.Employee
WHERE (YEAR(GETDATE()) - YEAR(HireDate)) IN (11,12,13)
