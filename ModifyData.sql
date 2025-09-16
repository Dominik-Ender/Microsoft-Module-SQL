
CREATE TABLE SalesLT.CallLog
(
	CallID INT IDENTITY PRIMARY KEY NOT NULL,
	CallTime DATETIME NOT NULL DEFAULT GETDATE(),
	SalesPerson NVARCHAR(256) NOT NULL,
	CustomerID INT NOT NULL REFERENCES SalesLT.Customer(CustomerID),
	PhoneNumber NVARCHAR(25) NOT NULL,
	Notes NVARCHAR(MAX) NULL
);

SELECT *
FROM SalesLT.CallLog;

INSERT INTO SalesLT.CallLog
VALUES
('2015-01-01T12:30:00', 'adventure-works\pamela0', 1, '245-555-0173', 'Returning call re: enquiry about delivery');

INSERT INTO SalesLT.CallLog
VALUES
(DEFAULT, 'adventure-works\david8', 2, '170-555-0127', NULL);

INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES
('adventure-works\jillian0', 3, '279-555-1030');

INSERT INTO SalesLT.CallLog
VALUES
(DATEADD(mi, -2, GETDATE()), 'adventure-works\jillian0', 4, '710-555-0173', NULL),
(DEFAULT, 'adventure-works\shu0', 5, '828-555-0186', 'Called to arrange deliver of order 10987');

INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber, Notes)
SELECT SalesPerson, CustomerID, Phone, 'Sales promotion call'
FROM SalesLT.Customer
WHERE CompanyName = 'Big-Time Bike Store';

INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, PhoneNumber)
VALUES
('adventure-works\josê1', 10, '150-555-0127');

SELECT SCOPE_IDENTITY() AS LatestIdentityInDB,
		IDENT_CURRENT('SalesLT.CallLog') AS LatestCallID;

SET IDENTITY_INSERT SalesLT.CallLog ON;

INSERT INTO SalesLT.CallLog (CallID, SalesPerson, CustomerID, PhoneNumber)
VALUES
(20, 'adventure-works\josê1', 11, '926-555-0159');

SET IDENTITY_INSERT SalesLT.CallLog OFF;

UPDATE SalesLT.CallLog
SET Notes = 'No notes'
WHERE Notes IS NULL;

SELECT *
FROM SalesLT.CallLog;

UPDATE SalesLT.CallLog
SET SalesPerson = '', PhoneNumber = '';

UPDATE SalesLT.CallLog
SET SalesPerson = c.SalesPerson, PhoneNumber = c.Phone
FROM SalesLT.Customer AS c
WHERE c.CustomerID = SalesLT.CallLog.CustomerID;

DELETE FROM SalesLT.CallLog
WHERE CallTime < DATEADD(dd, -7, GETDATE());

TRUNCATE TABLE SalesLT.CallLog;

-- Challenge 1: Insert products

-- 1. Insert a product

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

-- 2. Insert a new category with two products

INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name)
VALUES
(4, 'Bells and Horns');

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES
('Bicycle Bell', 'BB-RING', 2.47, 4.99, 43, GETDATE()),
('Bicycle Horn', 'BB-PARP', 1.29, 3.75, 43, GETDATE());

-- Challenge 2: Update products

-- 1. Update product prices

UPDATE SalesLT.Product
SET ListPrice = ListPrice * 1.10
WHERE ProductCategoryID = (SELECT ProductCategoryID
							FROM SalesLT.ProductCategory
							WHERE Name = 'Bells and Horns');

-- 2. Discontinue products

UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37
	AND ProductNumber <> 'LT-L123';

-- Challenge 3: Delete products

-- 1. Delete a product category and its products

DELETE FROM SalesLT.Product
WHERE ProductID = (SELECT ProductCategoryID
					FROM SalesLT.ProductCategory
					WHERE Name = 'Bells and Horns');

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID = (SELECT ProductCategoryID
							FROM SalesLT.ProductCategory
							WHERE Name = 'Bells and Horns');











































































