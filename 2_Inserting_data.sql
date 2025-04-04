--************************************
--Inserting data 
--************************************



--Inserting Customers
/*
    CustID INT IDENTITY(1,1), 
    Customer VARCHAR(255),      
    Country VARCHAR(2) CHECK (Country IN('D', 'A', 'CH', NULL)), 
    City VARCHAR(255),
    CustAddress VARCHAR(255),
    Phone VARCHAR(15)
*/

INSERT INTO Customers 
    (Customer, Country, City, CustAddress, Phone)
    VALUES 
('Karl Neumann', 'D', 'Muenchen', 'PaulanerStr 16', '4901212329'),
('Mueller', 'A', NULL, NULL, NULL),
('Peter Heine', 'D', 'Degendorf', 'TeureStr 327', '492865456'),
('Thomas Kensche', 'A', 'Wien', 'LangeStr 56', '4803636987'),
('Monika Baumgartner', 'D', 'Berlin', 'EngeGasse', NULL),
('Heiko Freulich', 'D', 'Osnabrueck', 'NeuburgerStr 127', '4905566358'),
('Uwe Egermann', 'A', 'Graz', 'WiesenStr 268', NULL),
('Eberhard Bauer', 'CH', 'Basel', NULL, NULL),
('Anja Schneider', 'D', 'Dresden', 'KurzeStr 13', NULL),
('Adelheide Schmitt', 'A', 'Linz', 'BaerenStr 89', '4809796387'),
('Susanne Stuka', 'CH', 'Genf', 'FauleStr 2312', NULL),
('Martin Wiese', 'A', 'Insbruck', 'DingholferStr', NULL),
('Gerhard Karberger', 'D', NULL, NULL, NULL),
('Wanda Morgenstern', 'D', 'Chemnitz', 'SpielplatzStr 215', NULL),
('Joseph Rohne', 'A', 'Salzburg', 'EbeneGasse 3', '4808987526'),
('Oliver Peitsche', 'D', 'Berlin', 'NeueStr', NULL),
('Bertold Quehenberg', 'D', 'Nuernberg', 'BauhofStr 258', '491238587'),
('Wolfgang Lauter', 'D', 'Heidelberg', 'BauernStr 64', NULL),
('Hannelore Fischer', 'A', 'Wien', 'SchraegeGasse 91', '4879585988'),
('Lieselotte Gaertner', 'CH', 'Bern', 'NeulingerStr 37', '452398875');

GO


--Inserting Suppliers
/*
    SupID INT IDENTITY(1,1) PRIMARY KEY,
    Supplier VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(15),
    Conditions VARCHAR(255),
    Rating CHAR(1) CHECK (Rating IN('A', 'B', 'C', NULL))
*/
INSERT INTO Suppliers 
    (Supplier, ContactPerson, Phone, Conditions, Rating)
    VALUES 
('Holzfabrik_GmbH', 'Moelke', '4905657325', 'Incoterms', 'A'),
('ASZ', 'Maier', '4897636985', 'AGB', 'A'),
('Braunberger_GmbH', 'Tannenbaum', '496365743', NULL, 'C'),
('Kunststoffwaren_GmbH', 'Olsche', '490589637', 'Incoterms', 'B'),
('Moos_GmbH', NULL, '4907857859', NULL, 'C');

GO

--Inserting Carriers
/*
    CarrID INT IDENTITY(1,1) PRIMARY KEY,
    Carrier VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(15),
    Conditions VARCHAR(255),
    Rating CHAR(1) CHECK (Rating IN('A', 'B', 'C', NULL)) 
*/
INSERT INTO Carriers 
    (Carrier, ContactPerson, Phone, Conditions, Rating)
    VALUES 
('Dube Transportges. m.b.H.', 'Arglister', '490659866', NULL, 'A'),
('DLH', 'Wiege', '498866363', NULL, 'B'),
('Heisstransport', 'Burgmeister', '498787875', NULL, 'C');

GO

--Inserting products
/*
    ProductID INT IDENTITY(1001,1) PRIMARY KEY,
    Product VARCHAR(255) NOT NULL UNIQUE,
    Supplier INT NOT NULL FOREIGN KEY REFERENCES Suppliers(SupID),
    Decription VARCHAR(255)
*/
INSERT INTO Products 
    (Product, Supplier, Decription)
    VALUES 
('Stuhl_A45', '1', 'Stuhl Holz braun'),
('Tisch_T70', '1', 'Tisch Holz braun'),
('Schrank_B25', '1', 'Schrank Fichte '),
('Vorhang_Gr', '3', 'Vorhang textil blau'),
('Klebstoff_Uni', '4', 'universalklebstoff chemopren'),
('Tuerbeschlag_Chrom', '2', 'Tuerbeschlag Chrom Rosette Klinke oder Knauf'),
('Tuerbeschlag_Edelstahl', '2', 'Tuerbeschlag Edelstahl Rosette Klinke oder Knauf'),
('Stuhl_B65', '3', NULL),
('Tisch_T80', '1', 'Tisch Holz Edelstahl'),
('Tisch_E20', '1', 'Tisch Holz Edelstahl'),
('Fensterbeschlag_Chrom', '2', 'Fensterbeschlag Chrom Rosette Klinke oder Knauf'),
('Fensterbeschlag_Edelstahl', '2', 'Fensterbeschlag Edelstahl Rosette Klinke oder Knauf'),
('Schrank_A89', '1', 'Schrank Kiefer'),
('Schrank_B80', '1', 'Schrank Buche'),
('Tuerschloss', '2', 'Tuerschloss Edelstahl mit Schluessel'),
('Duebel_5', '4', 'Duebel Kunststoff Groesse 5 mm'),
('Duebel_4', '4', 'Duebel Kunststoff Groesse 4 mm'),
('Schraube_5', '2', 'Schraube verzinkt 5x45 mm'),
('Schraube_4', '2', 'Schraube verzinkt 4x45 mm');

GO

--Inserting orders
/*
    OrderID INT IDENTITY(1001,1) PRIMARY KEY,
    OrderDate DATE,
    CustID INT NOT NULL FOREIGN KEY REFERENCES Customers(CustID),
    Comment VARCHAR(255),
    Item1 INT,    Quantity1 INT,
    ...
    Item9 INT,    Quantity9 INT
*/
INSERT INTO Orders 
 /*   (OrderDate, CustID, Comment, Item1, Quantity1, ... Item9, Quantity9)
*/    
    VALUES 
('2025-01-12', '1', NULL, '1003', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-12', '2', NULL, '1004', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-15', '3', NULL, '1003', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-16', '4', NULL, '1002', '1', '1001', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-20', '5', NULL, '1011', '8', '1006', '5', '1015', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-27', '6', NULL, '1003', '1', '1001', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-28', '1', NULL, '1016', '4', '1017', '6', '1018', '4', '1019', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-03', '7', NULL, '1001', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-04', '8', NULL, '1014', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-04', '9', 'Firma - Rechnung', '1013', '4', '1014', '8', '1010', '7', '1009', '4', '1007', '12', '1012', '18', '1015', '7', '1008', '15', NULL, NULL),
('2025-02-08', '10', NULL, '1005', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-10', '11', NULL, '1013', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-11', '6', NULL, '1014', '2', '1019', '26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-14', '12', NULL, '1001', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-14', '13', NULL, '1015', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-14', '6', NULL, '1012', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-14', '14', NULL, '1020', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-16', '15', 'Firma - bezahlt', '1010', '2', '1008', '8', '1003', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-16', '16', NULL, '1004', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-17', '17', NULL, '1013', '2', '1014', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-17', '18', NULL, '1009', '1', '1008', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-18', '19', NULL, '1013', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-19', '20', NULL, '1012', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

GO




--Inserting deliveries
/*
    DeliveryID INT IDENTITY(1001,1) PRIMARY KEY,
    DeliveryDate DATE,
    OrderID INT NOT NULL,
    CarrID INT,
    Comment VARCHAR(255),
    Item1 INT,    Quantity1 INT,
    ...
    Item9 INT,    Quantity9 INT
*/
INSERT INTO Deliveries 
/*    (DeliveryDate, OrderID, CarrID, Comment, Item1, Quantity1, ... Item9, Quantity9)
*/
    VALUES 
('2025-01-12', '1001', '1', NULL, '1003', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-13', '1002', '1', NULL, '1004', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-16', '1003', '1', NULL, '1003', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-16', '1004', '2', NULL, '1002', '1', '1001', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-23', '1005', '1', NULL, '1011', '8', '1006', '5', '1015', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-01-27', '1006', '1', NULL, '1003', '1', '1001', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-02', '1007', '1', NULL, '1016', '4', '1017', '6', '1018', '4', '1019', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-03', '1008', '2', NULL, '1001', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-04', '1009', NULL, NULL, '1014', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-17', '1010', '2', 'Firma - Rechnug', '1013', '4', '1014', '8', '1010', '7', '1009', '4', '1007', '12', '1012', '18', '1015', '7', '1008', '15', NULL, NULL),
('2025-02-08', '1011', '3', NULL, '1005', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-11', '1012', '1', NULL, '1013', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-11', '1013', '3', NULL, '1014', '2', '1019', '26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-15', '1015', '1', NULL, '1015', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-14', '1016', '2', NULL, '1012', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-16', '1017', '1', NULL, '1020', '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-20', '1018', '1', 'Firma - bezahlt', '1010', '2', '1008', '8', '1003', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-17', '1019', NULL, NULL, '1004', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-19', '1020', '2', NULL, '1013', '2', '1014', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2025-02-18', '1021', '1', NULL, '1009', '1', '1008', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

GO



--Displaying tables with data

SELECT * FROM Customers;
SELECT * FROM Suppliers;
SELECT * FROM Carriers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Deliveries;

GO
