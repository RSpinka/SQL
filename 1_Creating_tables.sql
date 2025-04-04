--************************************
--Creating Tables in DB
--************************************

DROP TABLE IF EXISTS Deliveries, Orders, Products, Suppliers, Carriers, Customers;
GO

--Creating of Customers table with ID, name, addres and phone number
CREATE TABLE Customers
(   CustID INT IDENTITY(1,1), 
    Customer VARCHAR(255),      
    Country VARCHAR(2) CHECK (Country IN('D', 'A', 'CH', NULL)), 
    City VARCHAR(255),
    CustAddress VARCHAR(255),
    Phone VARCHAR(15)
);

--Change of Constraints (just to use the ALTER TABLE statement:)
ALTER TABLE Customers
    ALTER COLUMN Customer VARCHAR(255) NOT NULL;

ALTER TABLE Customers
    ADD PRIMARY KEY (CustID);
GO

--Creating of Suppliers table with ID, name, contact, phone, conditions and rating
CREATE TABLE Suppliers
(   SupID INT IDENTITY(1,1) PRIMARY KEY,
    Supplier VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(15),
    Conditions VARCHAR(255),
    Rating CHAR(1) CHECK (Rating IN('A', 'B', 'C', NULL))
);

--Creating of Carriers table with ID, name, cntact, phone, conditions and rating
CREATE TABLE Carriers
(   CarrID INT IDENTITY(1,1) PRIMARY KEY,
    Carrier VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(15),
    Conditions VARCHAR(255),
    Rating CHAR(1) CHECK (Rating IN('A', 'B', 'C', NULL)) 
);

--Creating of Products table with ID, product name, supplier and description
CREATE TABLE Products
(   ProductID INT IDENTITY(1001,1) PRIMARY KEY,
    Product VARCHAR(255) NOT NULL UNIQUE,
    Supplier INT NOT NULL FOREIGN KEY REFERENCES Suppliers(SupID),
    Decription VARCHAR(255)
);

--Creating of Orders table with ID, order date, customer ID, Comment and order content as 9x item and quantity
CREATE TABLE Orders
(   OrderID INT IDENTITY(1001,1) PRIMARY KEY,
    OrderDate DATE,
    CustID INT NOT NULL FOREIGN KEY REFERENCES Customers(CustID),
    Comment VARCHAR(255),
    Item1 INT,    Quantity1 INT,    Item2 INT,    Quantity2 INT,
    Item3 INT,    Quantity3 INT,    Item4 INT,    Quantity4 INT,
    Item5 INT,    Quantity5 INT,    Item6 INT,    Quantity6 INT,
    Item7 INT,    Quantity7 INT,    Item8 INT,    Quantity8 INT,
    Item9 INT,    Quantity9 INT
);

--Creating of Deliveries table with ID, delivery date, order ID, Carrier ID, Comment and delivery content as 9x item and quantity
CREATE TABLE Deliveries
(
    DeliveryID INT IDENTITY(1001,1) PRIMARY KEY,
    DeliveryDate DATE,
    OrderID INT NOT NULL,
    CarrID INT,
    Comment VARCHAR(255),
    Item1 INT,    Quantity1 INT,    Item2 INT,    Quantity2 INT,
    Item3 INT,    Quantity3 INT,    Item4 INT,    Quantity4 INT,
    Item5 INT,    Quantity5 INT,    Item6 INT,    Quantity6 INT,
    Item7 INT,    Quantity7 INT,    Item8 INT,    Quantity8 INT,
    Item9 INT,    Quantity9 INT
);
GO


--Displaying tables (no data)
SELECT * FROM Customers;
SELECT * FROM Suppliers;
SELECT * FROM Carriers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Deliveries;
GO

