--************************************
--Adding column Price/Costs and data to the table Products/Carriers
--************************************

--Adding new column

ALTER TABLE Products
    DROP COLUMN IF EXISTS Price;
GO

ALTER TABLE Products
    ADD Price INT;

GO
--Inserting data

UPDATE Products    SET Price=2500	WHERE ProductID=1001;
UPDATE Products    SET Price=3000	WHERE ProductID=1002;
UPDATE Products    SET Price=4700	WHERE ProductID=1003;
UPDATE Products    SET Price=500 	WHERE ProductID=1004;
UPDATE Products    SET Price=120 	WHERE ProductID=1005;
UPDATE Products    SET Price=350 	WHERE ProductID=1006;
UPDATE Products    SET Price=390 	WHERE ProductID=1007;
UPDATE Products    SET Price=2750	WHERE ProductID=1008;
UPDATE Products    SET Price=3300	WHERE ProductID=1009;
UPDATE Products    SET Price=3550	WHERE ProductID=1010;
UPDATE Products    SET Price=290 	WHERE ProductID=1011;
UPDATE Products    SET Price=310 	WHERE ProductID=1012;
UPDATE Products    SET Price=4900	WHERE ProductID=1013;
UPDATE Products    SET Price=5600	WHERE ProductID=1014;
UPDATE Products    SET Price=240 	WHERE ProductID=1015;
UPDATE Products    SET Price=3   	WHERE ProductID=1016;
UPDATE Products    SET Price=2   	WHERE ProductID=1017;
UPDATE Products    SET Price=2   	WHERE ProductID=1018;
UPDATE Products    SET Price=2 	WHERE ProductID=1019;
UPDATE Products    SET Price=3 	WHERE ProductID=1020;

GO

--Change of Constraints to NOT NULL

ALTER TABLE Products
    ALTER COLUMN Price INT NOT NULL;
GO

--Adding new solumn

ALTER TABLE Carriers
    DROP COLUMN IF EXISTS Costs;
GO

ALTER TABLE Carriers
    ADD Costs INT;

GO

--Inserting data

UPDATE Carriers    SET Costs=100	WHERE CarrID=1;
UPDATE Carriers    SET Costs=120	WHERE CarrID=2;
UPDATE Carriers    SET Costs=110	WHERE CarrID=3;

GO
--Change Constraints to NOT NULL

ALTER TABLE Carriers
    ALTER COLUMN Costs INT NOT NULL;

GO

SELECT * FROM Products;
SELECT * FROM Carriers;

GO
