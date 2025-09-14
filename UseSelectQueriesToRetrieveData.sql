
-- Challenge 1: Retrieve customer data
-- 1. Retrieve customer details

SELECT * 
FROM SalesLT.Customer;

-- 2. Retrieve customer name data

SELECT ISNULL(Title, '') + ' ' + FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName + ' ' + ISNULL(Suffix, '') AS Name
FROM SalesLT.Customer;

-- 3. Retrieve customer names and phone numbers

SELECT SalesPerson
		, ISNULL(Title, '') + ' ' + LastName AS CustomerName
		, Phone
FROM SalesLT.Customer;

-- Challenge 2: Retrieve customer order data

-- 1. Retrieve a list of customer order data

SELECT TRY_CAST(CustomerID AS varchar(6)) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

-- 2. Retrieve a list of sales order revisions

SELECT PurchaseOrderNumber + ' (' + TRY_CAST(RevisionNumber AS varchar(6)) + ')'
		, CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

SELECT PurchaseOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision
		, CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

-- Challenge 3. Retrieve customer contact details

-- 1. Retrieve customer contact names with middle names if known

SELECT FirstName + ' ' +
		CASE
			WHEN MiddleName IS NULL THEN ''
			ELSE MiddleName
		END
		+ ' ' + LastName AS CustomerName
FROM SalesLT.Customer;

SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS CustomerName
FROM SalesLT.Customer;

-- 2. Retrieve primary contact details

UPDATE SalesLT.Customer
SET EmailAddress = NULL
where CustomerID % 7 = 1;

SELECT CustomerId
		, CASE 
			WHEN EmailAddress IS NOT NULL THEN EmailAddress
			ELSE Phone
		END AS PrimaryContact
FROM SalesLT.Customer;

SELECT CustomerId
		, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

-- 3. Retrieve shipping status

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
where SalesOrderID > 71899

SELECT SalesOrderID
		, OrderDate
		, CASE
			WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
			ELSE 'Shipped' 
		END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;

































































