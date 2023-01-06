-- dodawanie kategorii
CREATE PROCEDURE AddCategoryProcedure
@CategoryName varchar(64)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Categories
            WHERE @CategoryName = CategoryName
        )
            BEGIN
            ;
            THROW 52000, 'Kategoria jest już dodana', 1 -- nwm o co chodzi z tymi numerami
         end
        DECLARE @CategoryID INT
        SELECT @CategoryID = ISNULL(MAX(CategoryID), 0) + 1
        FROM Categories
        INSERT INTO Categories(CategoryID, CategoryName)
        VALUES(@CategoryID, @CategoryName);
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd dodawania kategorii: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- usuwanie kategorii
CREATE PROCEDURE RemoveCategoryProcedure
@CategoryName varchar(64)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Categories
            WHERE @CategoryName = CategoryName
        )
            BEGIN
            ;
            DELETE FROM Categories WHERE @CategoryName = CategoryName
            
         end
	ELSE
       THROW 52000, 'Kategoria jest już dodana', 1 -- nwm o co chodzi z tymi numerami
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania kategorii: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go



-- dodawanie produktu
CREATE PROCEDURE AddProductProcedure
@CategoryName varchar(64),
@Name varchar(64)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Products
            WHERE ProductName = @Name
        )
        BEGIN
            ;
            THROW 52000, 'Potrawa jest już w bazie', 1
        END
    IF NOT EXISTS(
        SELECT *
            FROM Categories
            WHERE CategoryName = @CategoryName
        )
        BEGIN
            ;
            THROW 52000, 'Brak kategorii', 1 --można by jakoś wtedy dodać kategorie razem z produktem jak rzuci taki błąd, ale wtedy np: 'ser', 'nabial' utworzy nową kategoria zamiast wpaść do 'nabiał'
        END
    DECLARE @CategoryID INT
    SELECT @CategoryID = CategoryID
    FROM Categories
    WHERE CategoryName = @CategoryName
    DECLARE @ProductID INT
    SELECT @ProductID = ISNULL(MAX(ProductID), 0) + 1
    FROM Products
    INSERT INTO Products(ProductID, ProductName, CategoryID)
    VALUES (@ProductID, @Name, @CategoryID);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd dodawania produktu kategorii: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- usunięcie produktu
CREATE PROCEDURE RemoveProductProcedure
@CategoryID int,
@Name varchar(64)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Products
            WHERE ProductName = @Name
        )
        BEGIN
        ;
        DELETE FROM Products WHERE  @CategoryID = Products.CategoryID AND @Name=ProductName
        END
    IF NOT EXISTS(
        SELECT *
            FROM Categories
            WHERE @CategoryID = CategoryID 
        )
        BEGIN
            ;
            THROW 52000, 'Brak kategorii', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania produktu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go


--dodawanie stolika do restauracji
CREATE PROCEDURE AddTableProcedure
@capacity int
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        DECLARE @DinigTableID INT
        SELECT @DinigTableID = ISNULL(MAX(DiningTables.DiningTableID), 0) + 1
        FROM DiningTables
        INSERT INTO DiningTables(DiningTables.DiningTableID, NumberOfSeats)
        VALUES(@DinigTableID, @capacity);
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd dodawania stolika: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

--usuwanie stolika z restauracji
CREATE PROCEDURE RemoveTableProcedure
@tableID int
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM DiningTables
            WHERE DiningTableID = @tableID
        )
        BEGIN
        ;
        DELETE FROM DiningTables WHERE  @tableID = DiningTableID
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania stolika: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go





-- dodawanie pracownika
CREATE PROCEDURE AddEmployeeProcedure
@FirstName varchar(64), 
@LastName varchar(64), 
@Occupation varchar(64),
@Street varchar(64), 
@Country varchar(64), 
@City varchar(64), 
@PostCode varchar(16), 
@Phone char(9),   
@Email varchar(64)

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM RestaurantEmployees
            WHERE FirstName = @FirstName AND LastName = @LastName AND Occupation = @Occupation AND Street=@Street AND Country = @Country AND City = @City AND PostCode=@PostCode AND Phone = @Phone AND Email=@Email
        )
        BEGIN
            ;
            THROW 52000, 'Pracownik jest już w bazie', 1
        END
    
    DECLARE @RestaurantEmployeeID INT
    SELECT @RestaurantEmployeeID = ISNULL(MAX(RestaurantEmployeeID), 0) + 1
    FROM RestaurantEmployees
    INSERT INTO RestaurantEmployees(RestaurantEmployeeID,FirstName, LastName, Occupation, Street, Country, City, PostCode,Phone,Email)
    VALUES (@RestaurantEmployeeID, @FirstName, @LastName, @Occupation, @Street, @Country, @City, @PostCode,@Phone,@Email);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd dodawania pracownika: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- usunięcie pracownika
CREATE PROCEDURE RemoveEmployeeProcedure
@RestaurantEmployeeID INT

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM RestaurantEmployees
            WHERE RestaurantEmployeeID = @RestaurantEmployeeID
        )
        BEGIN
        ;
        DELETE FROM RestaurantEmployees 
		WHERE  @RestaurantEmployeeID = RestaurantEmployeeID 
        END
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania pracownika: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go


-- AddMenuProcedure
CREATE PROCEDURE AddMenuProcedure
@MenuName varchar(64),
@FromTime datetime,
@ToTime   datetime
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Menu
            WHERE MenuName = @MenuName
        )
			BEGIN
				;
				THROW 52000, 'Menu with provided name is already in the database', 1
			END

    DECLARE @MenuID INT
		SELECT @MenuID = ISNULL(MAX(MenuID), 0) + 1
		FROM Menu

	INSERT INTO Menu(MenuID, MenuName, FromTime, ToTime)
	VALUES (@MenuID, @MenuName, @FromTime, @ToTime);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding menu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveMenuProcedure
CREATE PROCEDURE RemoveMenuProcedure
@MenuID int
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Menu
            WHERE @MenuID = @MenuID
        )
        BEGIN
        ;
        DELETE FROM Menu WHERE  @MenuID = MenuID
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Menu with provided ID does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing menu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- AddIngredientToWarehouse
CREATE PROCEDURE AddIngredientToWarehouse
@IngredientName varchar(64),
@QuantityLeft int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM IngredientsWarehouse
            WHERE IngredientName = @IngredientName
        )
			BEGIN
				;
				THROW 52000, 'Ingredient with provided name is already in the database', 1
			END

    DECLARE @IngredientID INT
		SELECT @IngredientID = ISNULL(MAX(IngredientID), 0) + 1
		FROM IngredientsWarehouse

	INSERT INTO IngredientsWarehouse(IngredientID, IngredientName, QuantityLeft)
	VALUES (@IngredientID, @IngredientName, @QuantityLeft);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding ingredient: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveIngredientFromWarehouse
CREATE PROCEDURE RemoveIngredientFromWarehouse
@IngredientID int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM IngredientsWarehouse
            WHERE IngredientID = @IngredientID
        )
        BEGIN
        ;
        DELETE FROM IngredientsWarehouse WHERE  IngredientID = @IngredientID
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Ingredient with provided ID does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing Ingredient: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- AddIngredientToProduct
CREATE PROCEDURE AddIngredientToProduct
@ProductID int,
@IngredientID int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM ProductIngredients
            WHERE IngredientID = @IngredientID
			AND ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'This productID-ingredientID pair already exists', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM Products
            WHERE ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'Product with provided ID does not exist', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM IngredientsWarehouse
            WHERE IngredientID = @IngredientID
        )
			BEGIN
				;
				THROW 52000, 'Ingredient with provided ID does not exist', 1
			END

	INSERT INTO ProductIngredients(ProductID, IngredientID)
	VALUES (@ProductID, @IngredientID);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding productID-ingredientID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveIngredientFromProduct
CREATE PROCEDURE RemoveIngredientFromProduct
@IngredientID int,
@ProductID int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM ProductIngredients
            WHERE IngredientID = @IngredientID
			AND ProductID = @ProductID
        )
        BEGIN
        ;
        DELETE FROM ProductIngredients WHERE  IngredientID = @IngredientID AND ProductID = @ProductID
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Provided productID-ingredientID pair does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing productID-ingredientID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- AddProductToMenuProcedure
CREATE PROCEDURE AddProductToMenuProcedure
@ProductID int,
@MenuID int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM MenuDetails
            WHERE MenuID = @MenuID
			AND ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'This productID-menuID pair already exists', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM Products
            WHERE ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'Product with provided ID does not exist', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM Menu
            WHERE MenuID = @MenuID
        )
			BEGIN
				;
				THROW 52000, 'Menu with provided ID does not exist', 1
			END

	INSERT INTO MenuDetails(MenuID, ProductID)
	VALUES (@MenuID, @ProductID);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding productID-menuID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveProductFromMenuProcedure
CREATE PROCEDURE RemoveProductFromMenuProcedure
@MenuID int,
@ProductID int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM MenuDetails
            WHERE MenuID = @MenuID
			AND ProductID = @ProductID
        )
        BEGIN
        ;
        DELETE FROM MenuDetails WHERE  MenuID = @MenuID AND ProductID = @ProductID
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Provided productID-menuID pair does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing productID-menuID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go



-- AddProductToOrderProcedure
CREATE PROCEDURE AddProductToOrder
@ProductID int,
@OrderID int,
@Quantity int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM OrderDetails
            WHERE OrderID = @OrderID
			AND ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'This productID-orderID pair already exists', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM Products
            WHERE ProductID = @ProductID
        )
			BEGIN
				;
				THROW 52000, 'Product with provided ID does not exist', 1
			END
		IF NOT EXISTS(
            SELECT *
            FROM Orders
            WHERE OrderID = @OrderID
        )
			BEGIN
				;
				THROW 52000, 'Order with provided ID does not exist', 1
			END

	INSERT INTO OrderDetails(OrderID, ProductID,Quantity)
	VALUES (@MenuID, @ProductID,@Quantity);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding productID-orderID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveProductFromOrderProcedure
CREATE PROCEDURE RemoveProductFromOrder
@OrderID int,
@ProductID int,
@Quantity int

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM MenuDetails
            WHERE OrderID = @OrderID
			AND ProductID = @ProductID
			AND Quantity = @Quantity
        )
        BEGIN
        ;
        DELETE FROM MenuDetails WHERE  MenuID = @MenuID AND ProductID = @ProductID AND Quantity = @Quantity
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Provided productID-orderID pair does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing productID-orderID pair: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

