SELECT * 
FROM [Sales].[SpecialOffer] so

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so --16

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty > 0 --4

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty <= 0 --EMPTY!

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty = NULL --EMPTY!

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty <> NULL --EMPTY!

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty IS NULL --12 is NULL

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty IS NOT NULL --4 is NOT NULL

SET ANSI_NULLS OFF
SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty
	,so.MaxQty
FROM [Sales].[SpecialOffer] so
WHERE so.MaxQty <> NULL --4 - WORKS AFTER SET ANSI_NULLS OFF :)


-- Expressions with nulls
SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty 
	,so.MaxQty -- has NULL values
	,so.MinQty * 2 AS NewMinQty
	,so.MaxQty *2 AS NewMaxQty
FROM [Sales].[SpecialOffer] so

SELECT
	so.SpecialOfferID
	,so.DiscountPct
	,so.Category
	,so.MinQty 
	,so.MaxQty -- has NULL values
	,so.MinQty * 2 AS NewMinQty
	,so.MaxQty *2 AS NewMaxQty
FROM [Sales].[SpecialOffer] so
ORDER BY MaxQty DESC

--ISNULL
SELECT
	SpecialOfferID
	,DiscountPct
	,Category
	,MinQty 
	,ISNULL(MaxQty,999999) -- instead of NULL here will be 999999
FROM [Sales].[SpecialOffer]

--COALESCE
SELECT
	SpecialOfferID
	,DiscountPct
	,Category
	,MinQty 
	,COALESCE(MaxQty,999999) -- instead of NULL here will be 999999
FROM [Sales].[SpecialOffer]

SELECT
	ProductID, [Name], [Weight], Size, Color
FROM [Production].[Product]
WHERE ProductID IN (1,510,6680,709,711,849)

--COALESCE
SELECT
	ProductID, [Name]
	,COALESCE(CAST([Weight] AS VARCHAR), Size, Color, 'Call for more info') AS DESCRIPTION
	, [Weight], Size, Color
FROM [Production].[Product]
WHERE ProductID IN (1,510,6680,709,711,849)

--the same with IS NULL
SELECT
	ProductID, [Name]
	,ISNULL(
			CAST([Weight] AS VARCHAR),ISNULL(
											Size, ISNULL(
														Color, 'Call for more info'))) AS DESCRIPTION
	, [Weight], Size, Color
FROM [Production].[Product]
WHERE ProductID IN (1,510,6680,709,711,849)

--the same with CASE
SELECT
	ProductID, [Name]
	,CASE
		WHEN Weight IS NOT NULL	THEN CAST([Weight] AS VARCHAR)
		WHEN Size IS NOT NULL	THEN Size
		WHEN Color IS NOT NULL	THEN Color
		ELSE 'Call for more info' 
	END AS DESCRIPTION
	, [Weight], Size, Color
FROM [Production].[Product]
WHERE ProductID IN (1,510,6680,709,711,849)
