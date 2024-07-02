-- How many suppliers are there? Use a query!
SELECT * FROM Suppliers;

SELECT COUNT(*) FROM Suppliers;

-- What is the sum of all the employee's salaries?
SELECT SUM(Salary) FROM Employees;

-- What is the price of the cheapest item that Northwind sells?
SELECT MIN(UnitPrice) FROM Products;

-- What is the average price of items that Northwind sells?
SELECT AVG(UnitPrice) FROM Products;

-- What is the price of the most expensive item that Northwind sells?
SELECT MAX(UnitPrice) FROM Products;

-- What is the supplier ID of each supplier and the number of items they supply?
-- You can answer this query by only looking at the Products table.
SELECT supplierID,Count(*) from Products group by SupplierID;

-- What is the category ID of each category and the average price of each item in the
-- category? You can answer this query by only looking at the Products table.
SELECT CategoryID,AVG(UnitPrice) from Products group by CategoryID;

-- For suppliers that provide at least 5 items to Northwind, what is the supplier ID of
-- each supplier and the number of items they supply? You can answer this query
-- by only looking at the Products table.
	SELECT supplierID,Count(*) from Products group by SupplierID HAVING COUNT(*) >= 5;
    
   -- List the product id, product name, and inventory value (calculated by multiplying
-- unit price by the number of units on hand). Sort the results in descending order
-- by value. If two or more have the same value, order by product name.
SELECT ProductID,ProductName ,(UnitPrice * UnitsInStock) AS InventoryValue FRom Products order by InventoryValue DESC ,ProductName ASC;

-- What is the product name(s) of the most expensive products? HINT: Find the
-- max price in a subquery and then use that value to find products whose price
-- equals that value.
SELECT ProductName FROM Products Where UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- What is the order id, shipping name and shipping address of all orders shipped via
-- "Federal Shipping"? HINT: Find the shipper id of "Federal Shipping" in a subquery
-- and then use that value to find the orders that used that shipper.
SELECT OrderID,ShipName,ShipAddress,ShipVia FROM Orders WHERE ShipVia=(SELECT ShipperID FROM Shippers WHERE CompanyName="Federal Shipping");

-- What are the order ids of the orders that ordered "Sasquatch Ale"? HINT: Find
-- the product id of "Sasquatch Ale" in a subquery and then use that value to find
-- the matching orders from the `order details` table. Because the `order details`
-- table has a space in its name, you will need to surround it with back ticks in the
-- FROM clause.

SELECT OrderID FROm `Order Details` WHERE ProductID=(SELECT ProductID FROM Products WHERE ProductName='Sasquatch Ale');

-- What is the name of the employee that sold order 10266?
SELECT CONCAT(FirstName,' ' ,LastName) AS Name FROM Employees WHERE EmployeeID=(SELECT EmployeeID FROM Orders WHERE OrderID=10266);

-- What is the name of the customer that bought order 10266?
SELECT CompanyName FROM Customers WHERE CustomerID=(SELECT CustomerID FROM Orders WHERE OrderID=10266)










