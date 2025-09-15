
-- Challenge 1: Retrieve order shipping information

-- 1. Retrieve the order ID and freight cost of each order

SELECT SalesOrderID
		, ROUND(Freight, 2) AS FreightCost
FROM SalesLT.SalesOrderHeader
GROUP BY SalesOrderID, Freight;

-- 2. Add the shipping method

SELECT SalesOrderID
		, ROUND(Freight, 2) AS FreightCost
		, LOWER(ShipMethod) AS ShippingMethod
FROM SalesLT.SalesOrderHeader;

-- 3. Add shipping date details

SELECT SalesOrderID
		, ROUND(Freight, 2) AS FreightCost
		, LOWER(ShipMethod) AS ShippingMethod
		, YEAR(ShipDate) AS ShipYear
		, DATENAME(mm, ShipDate) AS ShipMonth
		, DAY(ShipDate) AS ShipDay
FROM SalesLT.SalesOrderHeader;

-- Challenge 2: Aggregate product sales

-- 1. Retrieve total sales by product

SELECT p.Name	
		, SUM(sod.OrderQty) AS TotalSales
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.Product AS p ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalSales DESC;

-- 2. Filter the product sales list to include only products that cost over 1.000

SELECT p.Name
		, SUM(sod.OrderQty) AS TotalSales
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.Product AS p ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalSales DESC;

-- 3. Filter the product sales groups to include only products for which over 20 have been sold

SELECT p.Name
		, SUM(sod.OrderQty) AS TotalSales
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.Product AS p ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(sod.OrderQty) > 20
ORDER BY TotalSales DESC;



































































