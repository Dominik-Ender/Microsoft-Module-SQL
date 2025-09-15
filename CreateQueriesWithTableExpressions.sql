
-- Challenge 1: Create a view

CREATE VIEW SalesLT.vAddress AS
SELECT AddressLine1
		, City
		, StateProvince
		, CountryRegion
FROM SalesLT.Address
WHERE CountryRegion = 'Canada';

SELECT TOP(20) *
FROM SalesLT.vAddress;

-- Challenge 2: Use a derived table

-- 1. Write a query that classifies products as heavy and normal based on their weight

SELECT ProductID
		, Name
		, Weight
		, ListPrice
		,	CASE	
				WHEN Weight > 1000 THEN N'Heavy'
				ELSE N'Normal'
			END AS WeightType
FROM SalesLT.Product;

-- 2. Create a derived table based on your query

SELECT DerivedTable.ProductID
		, DerivedTable.Name
		, DerivedTable.Weight
		, DerivedTable.ListPrice
FROM (SELECT ProductID
			, Name
			, Weight
			,	CASE
					WHEN Weight > 1000 THEN N'Heavy'
					ELSE N'Normal'
				END AS WeightType
			, ListPrice
		FROM SalesLT.Product) AS DerivedTable
WHERE DerivedTable.WeightType = 'Heavy'
		AND DerivedTable.ListPrice > 2000;


