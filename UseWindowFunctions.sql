-- Challenge 1: Rank salespeople based on orders

SELECT c.SalesPerson
		, COUNT(soh.SalesOrderID) AS 'SalesOrders'
		, RANK() OVER (ORDER BY COUNT(soh.SalesOrderID) DESC) AS 'Rank'
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh ON soh.CustomerID = c.CustomerID
GROUP BY c.SalesPerson

-- Challenge 2: Retrieve each customer with the total number of customers in the same region

SELECT c.CompanyName
		, a.City
		, COUNT(c.CustomerID) OVER (PARTITION BY a.CountryRegion) AS CustomersInRegion
FROM SalesLT.Customer AS c
JOIN SalesLT.CustomerAddress AS ca ON ca.CustomerID = c.CustomerID
JOIN SalesLT.Address AS a ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office'































*




































