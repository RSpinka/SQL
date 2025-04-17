--**************************************************************
--Selects with DISTINCT, GROUP BY, ORDER BY, AVG(), COUNT(),HAVING
--**************************************************************


--Displaing all countries from table Customers (including no country data)
SELECT DISTINCT Country FROM Customers;


--Displaying the number of customers from each country (including customers with no country data)
SELECT Country, COUNT(*) AS "Number of Customers" FROM Customers
GROUP BY Country
ORDER BY "Number of Customers" DESC;


--Displaying the number of customers from each country (only customers with country data)
--ordered by number, descending
SELECT Country, COUNT(*) AS "Number of Customers" FROM Customers
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY "Number of Customers" DESC;


--Displaying products with prices from table Products with price > 1000
SELECT Product, Price FROM Products
WHERE Price > 1000
ORDER BY Product;


--Displaying average price for products with price >1000
SELECT AVG(Price) AS AVG_Price FROM Products
WHERE Price > 1000;


--Displaying all customers with orders 
SELECT Customer, OrderID FROM Customers c
INNER JOIN Orders o ON c.CustID=o.CustID
ORDER BY Customer;


--Displaying the number of orders for each customer
SELECT Customer, COUNT(*) AS "Number of Orders" FROM Customers c
INNER JOIN Orders o ON c.CustID=o.CustID
GROUP BY Customer;


--Displaying the number of orders for each customer with more then 1 order
SELECT Customer, COUNT(*) AS "Number of Orders" FROM Customers c
INNER JOIN Orders o ON c.CustID=o.CustID
GROUP BY Customer
HAVING COUNT(*) > 1


GO