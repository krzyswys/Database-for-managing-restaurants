
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
            DELETE FROM Categories WHERE WHERE @CategoryName = CategoryName
            
         end
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
@CategoryName varchar(64)
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
    INSERT INTO Products(ProductID, Name, CategoryID)
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
@CategoryName varchar(64)
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
        DELETE FROM Products WHERE  @CategoryName = CategoryName AND @Name=ProductName
        END
    IF NOT EXISTS(
        SELECT *
            FROM Categories
            WHERE CategoryName = @CategoryName
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
        SELECT @DinigTableID = ISNULL(MAX(DinigTableID), 0) + 1
        FROM DiningTables
        INSERT INTO DiningTables(DinigTableID, NumberOfSeats)
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
            WHERE DinigTableID = @tableID
        )
        BEGIN
        ;
        DELETE FROM DiningTables WHERE  @tableID = DinigTableID
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
@FirstName varchar(64) 
@LastName varchar(64) 
@Occupation varchar(64)
@Street varchar(64) 
@Country varchar(64) 
@City varchar(64) 
@PostCode varchar(16) 
@Phone char(9)   
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
    FROM RestaurantEmployeeID
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
        DELETE FROM Products WHERE  @RestaurantEmployeeID = RestaurantEmployeeID 
        END
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania produktu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go