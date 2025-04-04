--**************************************************************
--Displaying all items of a specific delivery with Product, Price, Quantity, Total Price
--with Shipping Costs and Total Price per delivery
--**************************************************************

DECLARE @Dely AS INT SET @Dely = 1004

DECLARE @UP1 AS INT SET @UP1 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item1 WHERE DeliveryID=@Dely)
DECLARE @UP2 AS INT SET @UP2 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item2 WHERE DeliveryID=@Dely)
DECLARE @UP3 AS INT SET @UP3 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item3 WHERE DeliveryID=@Dely)
DECLARE @UP4 AS INT SET @UP4 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item4 WHERE DeliveryID=@Dely)
DECLARE @UP5 AS INT SET @UP5 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item5 WHERE DeliveryID=@Dely)
DECLARE @UP6 AS INT SET @UP6 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item6 WHERE DeliveryID=@Dely)
DECLARE @UP7 AS INT SET @UP7 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item7 WHERE DeliveryID=@Dely)
DECLARE @UP8 AS INT SET @UP8 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item8 WHERE DeliveryID=@Dely)
DECLARE @UP9 AS INT SET @UP9 = (SELECT Price FROM Products JOIN Deliveries 
    ON Products.ProductID=Deliveries.Item9 WHERE DeliveryID=@Dely)

DECLARE @TP1 AS INT SET @TP1 = (SELECT Quantity1 FROM Deliveries WHERE DeliveryID=@Dely)*@UP1
DECLARE @TP2 AS INT SET @TP2 = (SELECT Quantity2 FROM Deliveries WHERE DeliveryID=@Dely)*@UP2
DECLARE @TP3 AS INT SET @TP3 = (SELECT Quantity3 FROM Deliveries WHERE DeliveryID=@Dely)*@UP3
DECLARE @TP4 AS INT SET @TP4 = (SELECT Quantity4 FROM Deliveries WHERE DeliveryID=@Dely)*@UP4
DECLARE @TP5 AS INT SET @TP5 = (SELECT Quantity5 FROM Deliveries WHERE DeliveryID=@Dely)*@UP5
DECLARE @TP6 AS INT SET @TP6 = (SELECT Quantity6 FROM Deliveries WHERE DeliveryID=@Dely)*@UP6
DECLARE @TP7 AS INT SET @TP7 = (SELECT Quantity7 FROM Deliveries WHERE DeliveryID=@Dely)*@UP7
DECLARE @TP8 AS INT SET @TP8 = (SELECT Quantity8 FROM Deliveries WHERE DeliveryID=@Dely)*@UP8
DECLARE @TP9 AS INT SET @TP9 = (SELECT Quantity9 FROM Deliveries WHERE DeliveryID=@Dely)*@UP9

DECLARE @LFD AS INT SET @LFD = 100
DECLARE @GES AS VARCHAR(15) SET @GES = 'Delivery_Price'
DECLARE @KOS AS VARCHAR(15) SET @KOS = 'Shipping_Costs'

SELECT SeqNo, Product, UnitPrice, Quantity, Total
    FROM Deliveries
    CROSS APPLY (
        VALUES 
            (1, Item1, @UP1, Quantity1, @TP1), 
            (2, Item2, @UP2, Quantity2, @TP2), 
            (3, Item3, @UP3, Quantity3, @TP3),  
            (4, Item4, @UP4, Quantity4, @TP4), 
            (5, Item5, @UP5, Quantity5, @TP5), 
            (6, Item6, @UP6, Quantity6, @TP6), 
            (7, Item7, @UP7, Quantity7, @TP7), 
            (8, Item8, @UP8, Quantity8, @TP8), 
            (9, Item9, @UP9, Quantity9, @TP9) 
    ) AS UnpivotTable(SeqNo, Position, UnitPrice, Quantity, Total)
    
    JOIN Products ON Position=ProductID
    WHERE Position IS NOT NULL AND DeliveryID=@Dely
UNION
SELECT @LFD, @KOS, Costs, @LFD/100, Costs FROM Deliveries
    JOIN Carriers ON Deliveries.CarrID=Carriers.CarrID
    WHERE DeliveryID=@Dely
UNION
SELECT @LFD*10, @GES, @LFD-100, @LFD-100, 
    Costs+@TP1+COALESCE(@TP2, 0)+COALESCE(@TP3, 0)+COALESCE(@TP4, 0)+COALESCE(@TP5,
     0)+COALESCE(@TP6, 0)+COALESCE(@TP7, 0)+COALESCE(@TP8, 0)+COALESCE(@TP9, 0) 
    FROM Deliveries
    JOIN Carriers ON Deliveries.CarrID=Carriers.CarrID
    WHERE DeliveryID=@Dely;

GO


