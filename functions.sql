-- Wypisz zamówienie po id
CREATE FUNCTION GetDetailsOfOrder(@input int)
    RETURNS table AS
        RETURN
        SELECT OrderDetails.Quantity*ProductPrices.UnitPrice as Price, OrderDetails.Quantity*ProductPrices.UnitPrice*(1-Orders.DiscountPercent/100.0) as PriceAfterDiscount,
	Orders.OrderID,Orders.OrderDate, Orders.OrderStatus, Orders.PayVia
        FROM Orders
        INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE Orders.OrderID = @input
go

-- sprawdzenie stanu zamówienia po id
CREATE FUNCTION GetStateOfOrder(@input int)
    RETURNS table AS
        RETURN
        SELECT Orders.OrderStatus
        FROM Orders
        WHERE Orders.OrderID = @input
go


-- wyposanie danych pracownika po id
CREATE FUNCTION GetDataOfEmployeee(@input int)
    RETURNS table AS
        RETURN
        SELECT RestaurantEmployees.FirstName as Imie, RestaurantEmployees.LastName as Nazwisko,  RestaurantEmployees.Phone as DaneKontaktowe, RestaurantEmployees.Occupation as Stanowisko, EmployeesSalary.FromTime as ZatrudnionyOd,  EmployeesSalary.ToTime as ZatrudnionyDo, EmployeesSalary.Salary
        FROM RestaurantEmployees
		INNER JOIN EmployeesSalary ON EmployeesSalary.RestaurantEmployeeID = RestaurantEmployees.RestaurantEmployeeID
        WHERE RestaurantEmployees.RestaurantEmployeeID = @input
go


-- zamówienia powyżej jakiejś wartości
CREATE FUNCTION GetOrdersAboveValue(@input int)
    RETURNS table AS
        RETURN
        SELECT Orders.OrderID, Orders.OrderStatus, OrderDetails.Quantity*ProductPrices.UnitPrice*(1-Orders.DiscountPercent/100.0) AS PriceAfterDiscount
        FROM Orders
        INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE OrderDetails.Quantity*ProductPrices.UnitPrice > @input
go

-- suma zamówień danego dnia
CREATE FUNCTION GetValueOfOrdersOnDay(@date date)
    RETURNS table AS
        RETURN  
        SELECT SUM(OrderDetails.Quantity*ProductPrices.UnitPrice*(1-Orders.DiscountPercent/100.0)) as Suma
        FROM Orders
        INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE YEAR(@date) = YEAR(Orders.OrderDate)
        AND MONTH(@date) = MONTH(Orders.OrderDate)
        AND DAY(@date) = DAY(Orders.OrderDate)
go

-- suma zamówień danego miesiąca
CREATE FUNCTION GetValueOfOrdersOnMonth(@date date)
    RETURNS table AS
        RETURN
	SELECT SUM(OrderDetails.Quantity*ProductPrices.UnitPrice*(1-Orders.DiscountPercent/100.0)) as Suma
        FROM Orders
        INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE YEAR(@date) = YEAR(Orders.OrderDate)
        AND MONTH(@date) = MONTH(Orders.OrderDate)
go

-- wartosc X zamówienia
CREATE FUNCTION GetValueOfOrder(@input int)
    RETURNS int AS
	BEGIN
	DECLARE @value INT;
        SELECT   @value = OrderDetails.Quantity*ProductPrices.UnitPrice*(1-Orders.DiscountPercent/100.0)
        FROM Orders
        INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE (Orders.OrderID = @input) AND (Orders.OrderDate >= ProductPrices.FromTime AND ( ProductPrices.ToTime is NULL OR ProductPrices.ToTime>=Orders.OrderDate))
	RETURN IsNull(@value, 0);
	END
go

-- wartosc najtańszy produkt w kategorii
CREATE FUNCTION GetCheapestProductInCategory(@input int)
    RETURNS table AS
        RETURN
        SELECT TOP(1) ProductPrices.UnitPrice as cena, ProductName
        FROM Products
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
        WHERE Categories.CategoryID = @input
        ORDER BY cena DESC
go

-- wartosc najdroższy produkt w kategorii
CREATE FUNCTION GetMostExpensiveProductInCategory(@input char)
    RETURNS table AS
        RETURN
        SELECT TOP(1) ProductPrices.UnitPrice as cena, ProductName
        FROM Products
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
        WHERE Categories.CategoryID = @input
go


-- GetIngredientsForProduct
CREATE FUNCTION GetIngredientsForProduct(@ProductID int)
    RETURNS table
	AS
	RETURN
		SELECT IngredientName
		FROM ProductIngredients
		JOIN IngredientsWarehouse ON IngredientsWarehouse.IngredientID = ProductIngredients.IngredientID
		WHERE ProductIngredients.ProductID = @ProductID
GO

-- GetProductsFromCategory
CREATE FUNCTION GetProductsFromCategory(@CategoryID int)
    RETURNS table
	AS
	RETURN
		SELECT Products.ProductName
		FROM Products
		JOIN Categories ON Categories.CategoryID = Products.CategoryID
		WHERE Categories.CategoryID = @CategoryID
GO

-- GetProductsFromMenu
CREATE FUNCTION GetProductsFromMenu(@MenuID int)
    RETURNS table
	AS
	RETURN
		SELECT Products.ProductName
		FROM Menu
		JOIN MenuDetails ON MenuDetails.MenuID = Menu.MenuID
		JOIN Products ON Products.ProductID = MenuDetails.ProductID
		WHERE Menu.MenuID = @MenuID
GO

-- GetCurrentEmployeeSalary
CREATE FUNCTION GetCurrentEmployeeSalary(@EmployeeID int)
RETURNS table
AS
RETURN
   SELECT Salary
   FROM EmployeesSalary
   WHERE RestaurantEmployeeID = @EmployeeID
   AND ToTime IS NULL
GO

-- GetCurrentAverageSalaryForOccupation
CREATE FUNCTION GetCurrentAverageSalaryForOccupation(@Occupation varchar(64))
RETURNS table
AS
RETURN
   SELECT AVG(Salary) AS AveragePriceForOccupation
   FROM EmployeesSalary
   JOIN RestaurantEmployees ON EmployeesSalary.RestaurantEmployeeID = RestaurantEmployees.RestaurantEmployeeID
   WHERE Occupation = @Occupation
   AND ToTime IS NULL
GO

-- GetTotalProductsAndAveragePriceOfMenu
CREATE FUNCTION GetTotalProductsAndAveragePriceOfMenu(@MenuID int)
RETURNS table
AS
RETURN
   SELECT COUNT(UnitPrice) AS TotalProducts, AVG(UnitPrice) AS AverageUnitPrice
   FROM Menu
   JOIN MenuDetails ON Menu.MenuID = MenuDetails.MenuID
   JOIN ProductPrices ON MenuDetails.ProductID = ProductPrices.ProductID
   WHERE Menu.MenuID = @MenuID
   AND ProductPrices.ToTime IS NULL
GO

-- GetHighestSalaryForEmployee
CREATE FUNCTION GetHighestSalaryForEmployee(@EmployeeID int)
RETURNS table
AS
RETURN
   SELECT MAX(Salary) AS MaxEmployeeSalary
   FROM EmployeesSalary
   WHERE RestaurantEmployeeID = @EmployeeID
GO

--Sprawdzenie ile dni pozostało na dane menu - pracownik
CREATE FUNCTION RemainingDaysForMenu(@MenuID int)
RETURNS table
AS
RETURN 
	SELECT DATEDIFF(day, GETDATE(), (SELECT 
		ToTime 
		FROM Menu 
		WHERE MenuID = @MenuID )) as [remaining days]
GO


CREATE FUNCTION RemainingFreeSeats()
RETURNS table
AS 
RETURN 
	SELECT (
	(SELECT 
	SUM(NumberOfSeats) 
	FROM DiningTables) - 
	
	(SELECT 
	SUM(Seats)
	FROM Reservation 
	WHERE GETDATE() >= FromTime AND GETDATE() <= ToTime
	)) as [free seats]
GO

CREATE FUNCTION CanAccommodateCustomers(@customers int)
RETURNS table
AS
RETURN
	SELECT  (CASE WHEN free_seats.nrOfFreeSeats >= @customers THEN 'true' ELSE 'false' END) AS freeSpaces
	FROM (SELECT ((SELECT SUM(NumberOfSeats) FROM DiningTables) - (SELECT SUM(Seats) FROM Reservation WHERE GETDATE() >= FromTime AND GETDATE() <= ToTime)) as nrOfFreeSeats
	) as free_seats 
GO



	
