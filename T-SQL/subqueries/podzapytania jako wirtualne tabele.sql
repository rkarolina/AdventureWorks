--adresy domowe wszystkich z tabeli Person

-- a more complicated query returning address
SELECT
	p.BusinessEntityID, p.LastName, p.FirstName, at.Name
	,a.PostalCode, a.City, a.AddressLine1, a.AddressLine2
FROM Person.Person as p
JOIN Person.BusinessEntityAddress bea ON bea.BusinessEntityID = p.BusinessEntityID
JOIN Person.Address AS a ON a.AddressID = bea.AddressID
JOIN Person.AddressType AS at ON bea.AddressTypeID = at.AddressTypeID
WHERE at.Name = 'Home'

--Let's use it with employee table
SELECT 
	emp.BusinessEntityID, emp.HireDate, emp.LoginID, Addr.*
FROM HumanResources.Employee AS emp
JOIN
( --the same subquery as in previous example
	SELECT
	p.BusinessEntityID, p.LastName, p.FirstName, at.Name
	,a.PostalCode, a.City, a.AddressLine1, a.AddressLine2
	FROM Person.Person as p
	JOIN Person.BusinessEntityAddress bea ON bea.BusinessEntityID = p.BusinessEntityID
	JOIN Person.Address AS a ON a.AddressID = bea.AddressID
	JOIN Person.AddressType AS at ON bea.AddressTypeID = at.AddressTypeID
	WHERE at.Name = 'Home'
) 
AS Addr ON Addr.BusinessEntityID = emp.BusinessEntityID

SELECT 
	Addr.*
FROM HumanResources.JobCandidate jc
JOIN
(
	SELECT
	p.BusinessEntityID, p.LastName, p.FirstName, at.Name
	,a.PostalCode, a.City, a.AddressLine1, a.AddressLine2
	FROM Person.Person as p
	JOIN Person.BusinessEntityAddress bea ON bea.BusinessEntityID = p.BusinessEntityID
	JOIN Person.Address AS a ON a.AddressID = bea.AddressID
	JOIN Person.AddressType AS at ON bea.AddressTypeID = at.AddressTypeID
	WHERE at.Name = 'Home'
)
AS Addr ON Addr.BusinessEntityID = jc.BusinessEntityID

--display employees living in the same city
SELECT 
	a.FirstName, a.LastName, a.City
	,b.FirstName, b.LastName, b.City
FROM
(
	SELECT 
		emp.HireDate, emp.LoginID
		, p.BusinessEntityID, p.LastName, p.FirstName, at.[Name]
		, a.PostalCode, a.City, a.AddressLine1, a.AddressLine2
	FROM HumanResources.Employee AS emp
		JOIN Person.Person AS p ON p.BusinessEntityID = emp.BusinessEntityID
		JOIN Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = p.BusinessEntityID
		JOIN Person.Address AS a ON a.AddressID = bea.AddressID
		JOIN Person.AddressType AS at ON at.AddressTypeID = bea.AddressTypeID
	WHERE at.Name = 'Home'
) AS a
JOIN
(
	SELECT 
		emp.HireDate, emp.LoginID
		, p.BusinessEntityID, p.LastName, p.FirstName, at.[Name]
		, a.PostalCode, a.City, a.AddressLine1, a.AddressLine2
	FROM HumanResources.Employee AS emp
		JOIN Person.Person AS p ON p.BusinessEntityID = emp.BusinessEntityID
		JOIN Person.BusinessEntityAddress AS bea ON bea.BusinessEntityID = p.BusinessEntityID
		JOIN Person.Address AS a ON a.AddressID = bea.AddressID
		JOIN Person.AddressType AS at ON at.AddressTypeID = bea.AddressTypeID
	WHERE at.Name = 'Home'
) AS b ON a.City = b.City AND a.BusinessEntityID >b.BusinessEntityID