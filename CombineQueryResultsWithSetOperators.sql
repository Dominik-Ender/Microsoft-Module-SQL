
-- Challenge

-- 1. Use the following code to create a table-valued function that retrieves address details for a given customer

CREATE OR ALTER FUNCTION SalesLT.fn_CustomerAddresses (@CustomerID INT)
RETURNS TABLE
RETURN 
	SELECT ca.AddressType
			, a.AddressLine1
			, a.AddressLine2
			, a.City
			, a.StateProvince
			, a.CountryRegion
			, a.PostalCode
	FROM SalesLT.CustomerAddress AS ca
	JOIN SalesLT.Address AS a
		ON a.AddressID = ca.AddressID
	WHERE ca.CustomerID = @CustomerID

SELECT c.CustomerID
		, c.CompanyName
		, ca.AddressType
		, ca.AddressLine1
		, ca.AddressLine2
		, ca.City
		, ca.StateProvince
		, ca.CountryRegion
		, ca.PostalCode
FROM SalesLT.Customer AS c
CROSS APPLY SalesLT.fn_CustomerAddresses(C.CustomerID) AS ca



















































































