
-- Query Multiple Tables with Joins

-- Challenge 1: Generate invoice reports

-- 1. Retrieve customer orders

SELECT c.CompanyName
		, oh.PurchaseOrderNumber
		, oh.SubTotal + oh.TaxAmt + oh.Freight AS TotalDue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh ON oh.CustomerID = c.CustomerID;

-- 2. Retrieve customer orders with address

SELECT c.CompanyName
		, a.AddressLine1
		, isnull(a.AddressLine2, '') AS AddressLine2
		, a.City
		, a.StateProvince
		, a.PostalCode
		, a.CountryRegion
		, oh.PurchaseOrderNumber
		, oh.SubTotal + oh.TaxAmt + oh.Freight AS TotalDue
		, ca.AddressType
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh ON oh.CustomerID = c.CustomerID
JOIN SalesLT.Address AS a ON a.AddressID = oh.BillToAddressID
JOIN SalesLT.CustomerAddress AS ca ON ca.AddressID = a.AddressID;

SELECT c.CompanyName
		, a.AddressLine1
		, isnull(a.AddressLine2, '') AS AddressLine2
		, a.City
		, a.StateProvince
		, a.PostalCode
		, a.CountryRegion
		, oh.PurchaseOrderNumber
		, oh.SubTotal + oh.TaxAmt + oh.Freight AS TotalDue
		, ca.AddressType
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh ON oh.CustomerID = c.CustomerID
JOIN SalesLT.CustomerAddress AS ca ON ca.CustomerID = oh.CustomerID
JOIN SalesLT.Address AS a ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office';

-- Challenge 2: Retrieve customer data

-- 1. Retrieve a list of all customers and their orders

SELECT c.CompanyName
		, c.FirstName
		, c.LastName
		, oh.PurchaseOrderNumber
		, oh.TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh ON oh.CustomerID = c.CustomerID
order by oh.PurchaseOrderNumber DESC;

-- 2. Retrieve a list of customers and their orders

SELECT c.CompanyName
		, c.FirstName
		, c.LastName 
		, c.Phone
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca ON ca.CustomerID = c.CustomerID
WHERE ca.AddressId IS NULL;

-- Challenge 3: Create a product catalog

SELECT pcat.Name AS ParentCategory
		, scat.Name AS SubCategory
		, prd.Name AS ProductName
FROM SalesLT.ProductCategory AS pcat
JOIN SalesLT.ProductCategory AS scat ON scat.ParentProductCategoryID = pcat.ProductCategoryID
JOIN SalesLT.ProductCategory AS prd ON prd.ProductCategoryID = scat.ProductCategoryID
ORDER BY ParentCategory, SubCategory, ProductName;





































































































