-- MATH FUNCTIONS
SELECT ABS(100), ABS(-100)  -- Absolute value

SELECT CEILING(1.0), CEILING (1.5), CEILING(2.0), CEILING (2.5), CEILING (3.0) --smallest integer

SELECT CEILING(-1.0), CEILING (-1.5), CEILING(-2.0), CEILING (-2.5), CEILING (-3.0)

SELECT FLOOR(1.0), FLOOR(1.5), FLOOR(2.0), FLOOR(2.5),  FLOOR(3.0) --largest integer

SELECT FLOOR(-1.0), FLOOR(-1.5), FLOOR(-2.0), FLOOR(-2.5),  FLOOR(-3.0)

SELECT PI()

SELECT 
	POWER(2,0) --2^0
	,POWER(2,1) --2^1
	,POWER(2,2) --2^2
	,POWER(2,3)
	,POWER(2,4)
	,POWER(2,5)

SELECT SQUARE(2),SQUARE(3),SQUARE(4)
SELECT SQRT(4),SQRT(9),SQRT(16) 

SELECT RAND(),RAND(),RAND() --float random number

DECLARE @f  FLOAT = RAND() * 10
DECLARE @i INT = FLOOR(@f)
SELECT @f, @i

--zaokr¹glenia
SELECT ROUND(245.445,0),ROUND(245.445,1),ROUND(245.445,2)
SELECT ROUND(245.445,0,1),ROUND(245.445,1,1),ROUND(245.445,2,1) -- 3 argument = 1 means that there is no rounding
SELECT ROUND(245.445,-1),ROUND(245.445,-2),ROUND(245.445,-3)

/* Task 1
Display columns SalesOrderId, TaxAmt with informations
- 0 if tax < 100
- 1000 if tax is >=1000 and < 2000
Use FLOOR function
*/
SELECT 
	SalesOrderId
	,TaxAmt
	,(FLOOR(TaxAmt/1000))*1000 AS [TaxAmt / 1000 *1000]
FROM [Sales].[SalesOrderHeader]
--ORDER BY (FLOOR(TaxAmt/1000))*1000 DESC

/*Task 2
Use RAND and CEILING function with random 1-49 digits
*/
SELECT CEILING(RAND()*49)

--Task 3
SELECT 
	SalesOrderId
	,TaxAmt
	,ROUND(TaxAmt,0)
FROM [Sales].[SalesOrderHeader]

--Task 4
SELECT
	SalesOrderId
	,TaxAmt
	,ROUND(TaxAmt,-3)
FROM [Sales].[SalesOrderHeader]