
-- Challenge 1: Retrieve data for transportation reports

-- 1. Retrieve a list of cities

SELECT DISTINCT City, StateProvince
FROM SalesLT.Address
ORDER BY City ASC;

-- 2. Retrieve the heavies products

SELECT TOP(10) PERCENT WITH TIES Name
FROM SalesLT.Product
ORDER BY Weight DESC;

-- Challenge 2: Retrieve product data

-- 1. Retrieve product details for product model 1

SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

-- 2. Filter products by color and size

SELECT ProductNumber, Name, Color, Size
FROM SalesLT.Product
WHERE Color in ('Black', 'Red', 'White')
		and Size in ('S', 'M');

-- 3. Filter products by product number

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

-- 4. Retrieve specific products by product number

SELECT ProductNumber, NAME, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';







































































































