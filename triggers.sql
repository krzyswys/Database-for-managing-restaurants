-- AddMenuOneDayInAdvanceTrigger
CREATE TRIGGER AddMenuOneDayInAdvanceTrigger
	ON Menu
	AFTER INSERT AS
BEGIN
	DECLARE @InsertedMenuID int
	SET @InsertedMenuID = (SELECT MenuID
			       FROM INSERTED)
	DECLARE @InsertedDate datetime
	SET @InsertedDate = (SELECT FromTime
			     FROM Menu
			     WHERE MenuID = @InsertedMenuID)
	IF DATEDIFF(hour, GETDATE(), @InsertedDate) < 24
		BEGIN
			PRINT ('Adding new menu failed. Menu must be inserted with at least one day in advance')
			DELETE FROM Menu WHERE MenuID = @InsertedMenuID
		END
END
GO

-- CorrectSeafoodOrderDateTrigger
CREATE TRIGGER CorrectSeafoodOrderDateTrigger
ON OrderDetails
AFTER INSERT AS
BEGIN
	DECLARE @InsertedOrderID int
	SET @InsertedOrderID = (SELECT OrderID
			        FROM INSERTED)

	DECLARE @InsertedProductID int
	SET @InsertedProductID = (SELECT ProductID
			          FROM INSERTED)

	DECLARE @InsertedProductQuantity int
	SET @InsertedProductQuantity = (SELECT Quantity
			                FROM INSERTED)

	DECLARE @InsertedProductCategoryID int
	SET @InsertedProductCategoryID = (SELECT CategoryID
			                  FROM INSERTED
				          JOIN Products ON INSERTED.ProductID = Products.ProductID)

	DECLARE @CollectDate datetime
	SET @CollectDate = (SELECT CollectDate
			    FROM Orders
			    WHERE OrderID = @InsertedOrderID)

	DECLARE @CollectDateWeekday datetime
	SET @CollectDateWeekday = DATEPART(weekday, @CollectDate)

	DECLARE @OrderDate datetime
	SET @OrderDate = (SELECT OrderDate
			  FROM Orders
		          WHERE OrderID = @InsertedOrderID)

	IF @InsertedProductCategoryID = (SELECT CategoryID
				         FROM Categories
					 WHERE CategoryName = 'Seafood')
		BEGIN
			IF DATEDIFF(day, @OrderDate, @CollectDate) < 3 + (@CollectDateWeekday - 5)
				BEGIN
					PRINT ('Adding product to order failed. Orders containing Seafood can only be placed until the first Monday before the collect date.')
					DELETE FROM OrderDetails WHERE OrderID = @InsertedOrderID
					AND ProductID = @InsertedProductID
					AND Quantity = @InsertedProductQuantity
				END
			IF @CollectDateWeekday NOT IN (5, 6, 7)
				BEGIN
					PRINT ('Adding product to order failed. Orders containing Seafood can only be collected on Thursdays, Fridays and Saturdays')
					DELETE FROM OrderDetails WHERE OrderID = @InsertedOrderID
					AND ProductID = @InsertedProductID
					AND Quantity = @InsertedProductQuantity
				END
		END
END
GO


-- CheckReservationSeatsTrigger
CREATE TRIGGER CheckReservationSeatsTrigger
	ON Reservation
	AFTER INSERT AS
BEGIN
	DECLARE @InsertedReservationID int
	SET @InsertedReservationID = (SELECT ReservationID
			       FROM INSERTED)
	DECLARE @InsertedSeats int
	SET @InsertedSeats = (SELECT Seats
			     FROM Reservation
			     WHERE ReservationID = @InsertedReservationID)
	IF  @InsertedSeats < 2
		BEGIN
			PRINT ('Adding new reservation failed. Reservation must be inserted with at least two seats')
			DELETE FROM Reservation WHERE ReservationID = @InsertedReservationID
		END
END
GO

-- CheckReservationCapacityTrigger
CREATE TRIGGER CheckReservationCapacityTrigger
	ON Reservation
	AFTER INSERT AS
BEGIN
	DECLARE @InsertedReservationID int
	SET @InsertedReservationID = (SELECT ReservationID
			       FROM INSERTED)
	DECLARE @InsertedSeats int
	SET @InsertedSeats = (SELECT Seats
			     FROM Reservation
			     WHERE ReservationID = @InsertedReservationID)
	IF  @InsertedSeats > (SELECT DiningTables.NumberOfSeats FROM Reservation INNER JOIN DiningTables ON DiningTables.DiningTableID = Reservation.DiningTableID WHERE @InsertedReservationID = ReservationID)
		BEGIN
			PRINT ('Adding new reservation failed. Reservation must be inserted with less or equal number of availabile seats')
			DELETE FROM Reservation WHERE ReservationID = @InsertedReservationID
		END
END
GO

-- CheckDiscountAvailabilityTrigger
CREATE TRIGGER CheckDiscountAvailabilityTrigger
ON Orders
AFTER INSERT AS
BEGIN
	DECLARE @InsertedOrderID int
	SET @InsertedOrderID = (SELECT OrderID
			        FROM INSERTED)

	DECLARE @InsertedCustomerID int
	SET @InsertedCustomerID = (SELECT Orders.CustomerID
			          FROM INSERTED
					  INNER JOIN Orders ON Orders.OrderID = INSERTED.OrderID)
                      ------------------------------------------------

    DECLARE @ThisOrderZ1 int
	SET @ThisOrderZ1 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='Z1' AND toTime = NULL)

    DECLARE @ThisOrderK1 int
	SET @ThisOrderK1 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='K1' AND toTime = NULL)
    DECLARE @ThisOrderR1 int
	SET @ThisOrderR1 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='R1' AND toTime = NULL)
                            ---------------------------------
    DECLARE @ThisOrderK2 int
	SET @ThisOrderK2 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='K2' AND toTime = NULL)   
    DECLARE @ThisOrderR2 int
	SET @ThisOrderR2 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='R2' AND toTime = NULL)
    DECLARE @ThisOrderD1 int
	SET @ThisOrderD1 = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='D1' AND toTime = NULL)
    -----------------------------------               --------------------------------------                                  

	DECLARE @ThisOrderCustomerNumberOfOrders int
	SET @ThisOrderCustomerNumberOfOrders =(SELECT COUNT(Orders.OrderID) --liczy wszystkie zamówienia danego klienta >K1
			                  FROM Customers
				          JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
                          JOIN Orders ON Orders.CustomerID = Customers.CustomerID
                          WHERE Orders.CustomerID = @InsertedCustomerID AND (SELECT * FROM [dbo].GetValueOfOrder(@InsertedOrderID))>@ThisOrderK1)

                          

	DECLARE @ThisOrderCustomerNumberValueOfOrders int
	SET @ThisOrderCustomerNumberValueOfOrders = (SELECT SUM(t.val) FROM (SELECT (  SELECT * FROM  [dbo].GetValueOfOrder(Orders.OrderID)    ) as val, Customers.CustomerID --       (@InsertedOrderID)) --sumuje wszystkie zamówienia danego klienta
			                  FROM Customers
				          INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
                          INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
                          WHERE Orders.CustomerID = @InsertedCustomerID) as t)


	IF @ThisOrderCustomerNumberOfOrders >= @ThisOrderZ1
		BEGIN
	    			PRINT ('Qualified for first discount')
					--przypisanie zniżki @ThisOrderR1
		END

    IF @ThisOrderCustomerNumberValueOfOrders >= @ThisOrderK2
        BEGIN
	    			PRINT ('Qualified for second discount')
					--przypisanie zniżki @ThisOrderR1 @ThisOrderD1
		END
END
GO


-- CheckIndividualReservationAvailabilityTrigger
CREATE TRIGGER CheckIndividualReservationAvailabilityTrigger
ON Reservation
AFTER INSERT AS
BEGIN
DECLARE @InsertedReservationID int
	SET @InsertedReservationID = (SELECT ReservationID
			       FROM INSERTED)
	DECLARE @InsertedOrderID int
	SET @InsertedOrderID = (SELECT OrderID
			        FROM INSERTED)

	DECLARE @InsertedCustomerID int
	SET @InsertedCustomerID = (SELECT Orders.CustomerID
			          FROM INSERTED
                        INNER JOIN Orders ON Orders.OrderID = INSERTED.OrderID
					  )

    DECLARE @ThisOrderWK int
	SET @ThisOrderWK = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='WK' AND toTime = NULL)

    DECLARE @ThisOrderWZ int
	SET @ThisOrderWZ = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='WZ' AND toTime = NULL)
                                

	DECLARE @ThisOrderCustomerNumberOfOrders int
	SET @ThisOrderCustomerNumberOfOrders =(SELECT COUNT(Orders.OrderID) --liczy wszystkie zamówienia danego klienta 
			                  FROM Customers
				          INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
                          INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
                          WHERE Orders.CustomerID = @InsertedCustomerID) 

	DECLARE @ThisOrderCustomerNumberValueOfOrders int
	SET @ThisOrderCustomerNumberValueOfOrders = (SELECT * FROM [dbo].GetValueOfOrder(@InsertedOrderID) --liczy wartosc danego zamowienia
			                  )

    DECLARE @flag int
    SET @flag =0
	IF @ThisOrderCustomerNumberOfOrders >= @ThisOrderWK
		BEGIN
	    			PRINT ('Qualified for reservation')
                    SET @flag =1
		END

    IF @ThisOrderCustomerNumberValueOfOrders >= @ThisOrderWZ AND @flag=0
        BEGIN
	    			PRINT ('Qualified for reservation')
                    SET @flag =1
		END
    IF  @flag=0
        BEGIN
	    			PRINT ('Not qualified for reservation')
                    DELETE FROM Reservation WHERE ReservationID = @InsertedReservationID
		END
END
GO
