SELECT LoginID
	,CHARINDEX('\',LoginID) AS [Position number] -- znalezienie pozycji, na której znajduje siê dany znak w rekordzie
	,SUBSTRING(LoginID,1,CHARINDEX('\',LoginID))-- wyciêcie napisu od wskazanej pozycji
	,LEN(LoginID) AS [Length of characters] -- zwraca d³ugoœæ tekstu w polu
	,SUBSTRING(LoginID, CHARINDEX('\',LoginID),1000) AS [\LOGIN]
	,SUBSTRING(LoginID, CHARINDEX('\',LoginID)+1,LEN(LoginID)-CHARINDEX('\',LoginID)) AS [LOGIN]
	,UPPER(LoginID) AS [Upper letters]
	,LOWER(LoginID) [Lower letters]
FROM
[HumanResources].[Employee]
GO

--format function
DECLARE @d DATETIME = GetDate()

--DATA KRÓTKA
SELECT FORMAT(@d,'d','pl-PL') AS PL, --dd.mm.yyyy
	FORMAT(@d,'d','de-de') AS DE, --dd.mm.yyyy
	FORMAT(@d,'d','en-US') AS US --mm/dd/yyyy

SELECT FORMAT(@d,'D','pl-PL') AS PL, --dd.mm.yyyy
FORMAT(@d,'D','de-de') AS DE, --dd.mm.yyyy
FORMAT(@d,'D','en-US') AS US --mm/dd/yyyy

SELECT FORMAT (GetDate(), 'MM/yyyy')
SELECT FORMAT(@d,'dd-MM-yyyy HH:mm') -- everything what we want to display
SELECT FORMAT(122248.3456,'0.0') -- 1 miejsce po przecinku 
SELECT FORMAT(122248.3456,'0.00') -- 2 miejsca po przecinku (zaokr¹gla!)
SELECT FORMAT(122248.3456,'0.000') -- 32 miejsca po przecinku (zaokr¹gla!)

DECLARE @c VARCHAR(100) = '   some text  '
SELECT 
	'!'+@c+'!' AS ['!   some text  !']
	,'!'+LTRIM(@c)+'!' AS ['!some text  !']
	,'!'+RTRIM(@c)+'!' AS ['!   some text!']
	,'!'+LTRIM(RTRIM(@c))+'!' AS ['!some text!']

SELECT 
	ph.PhoneNumber
	,REPLACE(PhoneNumber,'-',' ')
	,REPLACE(REPLACE(REPLACE(REPLACE(PhoneNumber,'-',''),'(',''),')',''),' ','')
FROM [Person].[PersonPhone] ph

SELECT 
	pa.PostalCode
	,REPLICATE('_',12 - LEN(PostalCode))+ PostalCode
FROM [Person].[Address] pa

DECLARE @z VARCHAR(100) = 'download.microsoft.com'
SELECT @z AS [download.microsoft.com]
	,SUBSTRING(@z,1,CHARINDEX('.',@z)-1) AS [download]

SELECT 
	sod.CarrierTrackingNumber
	,REPLACE(CarrierTrackingNumber,'-','/')
FROM [Sales].[SalesOrderDetail] sod

--1) cut 3 first digits from Sales.CreditCard (CardNumber column)
SELECT
	CardNumber
	,SUBSTRING(CardNumber,1,3) AS [First 3 digits]
FROM [Sales].[CreditCard]

--or using LEFT function
SELECT
	CardNumber
	,LEFT(CardNumber,3) AS [First 3 digits]
FROM [Sales].[CreditCard]
--2) 
SELECT
	AddressLine1
	,LEN(AddressLine1) AS [Length od Adress]
	,SUBSTRING(AddressLine1, CHARINDEX(' ',AddressLine1),1000) AS [cut from the beginning to the first space]
FROM [Person].[Address]

--3)
SELECT
	OrderDate -- yyyy-mm-ss hh:mm:ss.sss
	,FORMAT(OrderDate, 'MM/yyyy')
FROM [Sales].[SalesOrderHeader]

--4) format output of OrderQty*UnitPrice to 1 decimal place
SELECT
	OrderQty
	,UnitPrice
	,OrderQty*UnitPrice AS [OrderQty*UnitPrice]
	,FORMAT((OrderQty*UnitPrice),'0.0') AS [1 Decimal place]
FROM [Sales].[SalesOrderDetail]

--5)
SELECT
	ProductNumber
	,REPLACE(ProductNumber,'-','') AS [Product number without '-']
FROM [Production].[Product]

/* 6) Format TotalDue column in SalesOrderHeader table.
	Output should have 17 digits (including ** at the end of the field),
	TotalDue should be rounded to 2 decimal places,
	at the begining we should have ***,
	display length of the output
*/
SELECT
	TotalDue
	,LEN(TotalDue) [TotalDue length]
	,FORMAT(TotalDue, '0.00')+ '**' [TotalDue with **]
	,REPLICATE('*',15 - LEN(TotalDue))+ FORMAT(TotalDue, '0.00')+ '**' AS [Output] -- 15 + ** = 17 
	,LEN(REPLICATE('*',15 - LEN(TotalDue))+ FORMAT(TotalDue, '0.00')+ '**') AS [Output length]
FROM [Sales].[SalesOrderHeader]

