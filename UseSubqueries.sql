
-- Challenge 1: Retrieve product price information

-- 1. Retrieve products whose list price is higher than the average unit price

SELECT ProductID
		, Name
		, ListPrice
FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice)
					FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID;

-- 2. Retrieve Products with a list price of 100 or more that have been sold for less than 100.

SELECT DISTINCT p.ProductID	
		, p.Name
		, p.ListPrice
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod ON sod.ProductID = p.ProductID
WHERE ListPrice >= 100
		AND sod.UnitPrice < 100;
	
SELECT p.ProductID
		, p.Name
		, p.ListPrice
FROM SalesLT.Product AS p
WHERE ProductID IN (SELECT ProductID
					FROM SalesLT.SalesOrderDetail
					WHERE UnitPrice < 100)
		AND ListPrice >= 100
ORDER BY ProductID;

-- Challenge 2: Analyze profitability

-- 1. Retrieve the cost, list price, and average selling price for each product

SELECT p.ProductID	
		, p.Name
		, p.StandardCost
		, p.ListPrice
		, (SELECT AVG(UnitPrice)
			FROM SalesLT.SalesOrderDetail AS sod
			WHERE sod.ProductID = p.ProductID)
FROM SalesLT.Product AS p
ORDER BY p.ProductID;

-- 2. Retrieve products that have an average selling price that is lower than the cost

SELECT p.ProductID
		, p.Name
		, p.ListPrice
		, (SELECT AVG(UnitPrice)
			FROM SalesLT.SalesOrderDetail AS sod
			WHERE sod.ProductID = p.ProductID)
FROM SalesLT.Product AS p
WHERE p.StandardCost > (SELECT AVG(UnitPrice)
						FROM SalesLT.SalesOrderDetail AS sod
						WHERE sod.ProductID = p.ProductID)
ORDER BY p.ProductID;































































































