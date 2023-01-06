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
					PRINT ('Adding product to order failed. Orders containg Seafood can only be placed until the first Monday before the collect date.')
					DELETE FROM OrderDetails WHERE OrderID = @InsertedOrderID
					AND ProductID = @InsertedProductID
					AND Quantity = @InsertedProductQuantity
				END
			IF @CollectDateWeekday NOT IN (5, 6, 7)
				BEGIN
					PRINT ('Adding product to order failed. Orders containg Seafood can only be collected on Thursdays, Fridays and Saturdays')
					DELETE FROM OrderDetails WHERE OrderID = @InsertedOrderID
					AND ProductID = @InsertedProductID
					AND Quantity = @InsertedProductQuantity
				END
		END
END
GO
