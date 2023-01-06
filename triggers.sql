-- MenuCorrectDateTrigger
CREATE TRIGGER MenuCorrectDateTrigger
	ON Menu
	AFTER INSERT AS
BEGIN
	DECLARE @InsertedMenuID int
	SET @InsertedMenuID = (SELECT MAX(MenuID)
						   FROM Menu)
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
