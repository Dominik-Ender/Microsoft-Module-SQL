
-- Challenge 1: Assignment of values to variables

-- 1. Create your variables:

DECLARE
	@salesOrderNumber NVARCHAR(30),
	@customerID INT;

-- 2. Assign a value to the integer variable:

SET @customerID = 29847;

-- 3. Assign a value from the database and display the result:

SET @salesOrderNumber = (SELECT salesOrderNumber
							FROM SalesLT.SalesOrderHeader
							WHERE customerID = @customerID);

SELECT @salesOrderNumber AS OrderNumber;

-- Challenge 2: Aggregate product sale

-- 1. Declare the variables:

DECLARE
	@customerID INT = 1,
	@fname NVARCHAR(20),
	@lname NVARCHAR(30);

-- 2. Construct a termintating loop & 3. Select the customer first name and last name and display:

WHILE @customerID <= 10
BEGIN 
	SELECT @fname = FirstName FROM SalesLT.Customer WHERE customerID = @customerID;
	SELECT @lname = LastName FROM SalesLT.Customer WHERE customerID = @customerID;
	PRINT @fname + N' ' + @lname;
	SET @customerID += 1;
END;
























































































