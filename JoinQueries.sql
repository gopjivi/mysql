
-- List the product id, product name, unit price and category name of all products.
-- Order by category name and within that, by product name.

SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM Suppliers;

SELECT P.ProductID ,P.ProductName ,P.UnitPrice,C.CategoryName FROM Products P Join Categories C
ON P.CategoryID=C.CategoryID order by C.CategoryName,P.ProductName;

-- List the product id, product name, unit price and supplier name of all products
-- that cost more than $75. Order by product name.
SELECT P.ProductID ,P.ProductName ,P.UnitPrice,S.CompanyName FROM Products P Join Suppliers S
ON P.SupplierID=S.SupplierID WHERE P.UnitPrice >75 order by P.ProductName;

-- List the product id, product name, unit price, category name, and supplier name
-- of every product. Order by product name.
SELECT P.ProductID ,P.ProductName ,P.UnitPrice,C.CategoryName,S.CompanyName FROM Products P Join Categories C 
ON P.CategoryID=C.CategoryID join Suppliers S ON P.SupplierID=S.SupplierID order by P.ProductName;

-- What is the product name(s) and categories of the most expensive products?
-- HINT: Find the max price in a subquery and then use that in your more complex
-- query that joins products with categories.

SELECT MAX(UnitPrice) FROM Products;

SELECT P.ProductName ,C.CategoryName,P.UnitPrice FROM Products P Join Categories C 
ON P.CategoryID=C.CategoryID WHERE P.UnitPrice=(SELECT MAX(UnitPrice) FROM Products);

-- List the order id, ship name, ship address, and shipping company name of every
-- order that shipped to Germany.
SELECT O.OrderID,O.ShipName,O.ShipAddress,S.CompanyName ,O.ShipCountry FROM Orders O join Shippers S ON O.shipVia=S.ShipperID
WHERE O.ShipCountry="Germany";

-- List the order id, order date, ship name, ship address of all orders that ordered
-- "Sasquatch Ale"?

SELECT O.OrderID,O.OrderDate,O.ShipName,O.ShipAddress,P.ProductName FROM Orders O join `Order Details` OD ON O.OrderID=OD.OrderID
join Products P ON P.ProductID=OD.ProductID WHERE P.ProductName='Sasquatch Ale'

