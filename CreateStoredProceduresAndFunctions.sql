
create procedure SalesLT.up_GetTopProducts
as 
select top(10) Name, ListPrice
from SalesLT.Product
group by Name, ListPrice
order by ListPrice desc;

execute SalesLT.up_GetTopProducts;

alter procedure SalesLT.up_GetTopProducts (@count int)
as
select top(@count) Name, ListPrice
from SalesLT.Product
group by Name, ListPrice
order by ListPrice desc;

execute SalesLT.up_GetTopProducts @count = 20;

create function SalesLT.fn_ApplyDiscount (@productID int, @percentage decimal)
returns money
as 
begin
	declare @discountedPrice money;
	select @discountedPrice = ListPrice - (ListPrice * (@percentage/100))
	from SalesLT.Product
	where ProductID = @productID;
	return @discountedPrice
end;

select ProductID
		, Name
		, ListPrice
		, StandardCost
		, SalesLT.fn_ApplyDiscount(ProductID, 10) as SalePrice
from SalesLT.Product;

create function SalesLT.fn_ProductProfit (@categoryID int)
returns table
as 
return
	select ProductID
			, Name as Product
			, ListPrice
			, StandardCost
			, ListPrice - StandardCost as Profit
	from SalesLT.Product
	where ProductCategoryID = @categoryID;

select * from SalesLT.fn_ProductProfit(18);

select c.Name as Category
		, pm.Product
		, pm.ListPrice
		, pm.Profit
from SalesLT.ProductCategory as c
cross apply SalesLT.fn_ProductProfit(c.ProductCategoryID) as pm
order by Category,Product;

-- Challenge 1: Create a stored procedure to retrieve products in a specific category:

create procedure SalesLT.sp_RetrieveProducts(@categoryID int)
as 
select ProductID
		, Name
		, ListPrice
from SalesLT.Product
where ProductCategoryID = @categoryID;

execute SalesLT.sp_RetrieveProducts 18

-- Challenge 2: Create a function to find the average price of a product in a specific category:

create function SalesLT.fn_AveragePrice (@categoryID int)
returns money
as 
begin
	declare @averagePrice money;
	select @averagePrice = avg(ListPrice)
	from SalesLT.Product
	where ProductCategoryID = @categoryID
	return @averagePrice
end;

select ProductCategoryID
		, Name
		, SalesLT.fn_AveragePrice(ProductCategoryID) as AveragePrice
from SalesLT.ProductCategory;

-- Challenge 3: Create a function to find subcategories of a specified category:









































































