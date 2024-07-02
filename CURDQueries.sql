-- Add a new supplier;
INSERT INTO Suppliers
(`SupplierID`,
`CompanyName`,
`ContactName`,
`ContactTitle`,
`Address`,
`City`,
`Region`,
`PostalCode`,
`Country`,
`Phone`,
`Fax`,
`HomePage`)
VALUES
(30,'CookiesHere','karpagam','manager','aaaaa','banglore','banglore','642002','india','1234567898',null,null);

-- Add a new product provided by that supplier
INSERT INTO Products VALUES(78,'Biscuts',30,1,10,30,5,10,15,0);

-- List all products and their suppliers
SELECT P.ProductID ,P.ProductName ,S.CompanyName FROM Products P JOIN Suppliers S on P.SupplierID=S.SupplierID;


-- Raise the price of your new product by 15%
Update Products SET UnitPrice=(UnitPrice+((UnitPrice/100)*15)) where ProductID=78;

-- List the products and prices of all products from that supplier
SELECT * FROM Products WHERE SupplierID=30;
 
 -- Delete the new product.
 DELETE FROM Products WHERE ProductID=78;
 
 -- Delete the new supplier.
  DELETE FROM Suppliers WHERE SupplierID=30;
  
  -- List all products.
  SELECT * FROM Products;
  
  -- List all suppliers.
  SELECT * FROM Suppliers;