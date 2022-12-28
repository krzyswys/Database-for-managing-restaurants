-- Wypisz zamówienie po id
CREATE FUNCTION GetValueOfOrder(@input int)
    RETURNS table AS
        RETURN
        SELECT OrderDetails.Quantity*ProductPrices.UnitPrice as cena, Orders.OrderID,Orders.OrderDate, Orders.OrderStatus, Orders.PayVia as rodzaj płatności, RestaurantEmployees.FirstName as imie obsługującego pracownika, Customers.Email as kontakt do klienta
        FROM Orders
        INNER JOIN OrderDetails.OrderID ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE Orders.OrderID = @input
go

-- sprawdzenie stanu zamówienia po id
CREATE FUNCTION GetStateOfOrder(@input int)
    RETURNS text AS
        RETURN
        SELECT Orders.OrderStatus
        FROM Orders
        WHERE Orders.OrderID = @input
go


-- wyposanie danych pracownika po id
CREATE FUNCTION GetDataOfEmployeee(@input int)
    RETURNS table AS
        RETURN
        SELECT Imie: RestaurantEmployees.FirstName, Nazwisko: RestaurantEmployees.LastName, Dane kontaktowe: RestaurantEmployees.AdressDetails,Stanowisko: RestaurantEmployees.Occupation,Zatrudniony od: EmployeesSalary.FromTime, do: EmployeesSalary.ToTime, EmployeesSalary.Value
        INNER JOIN EmployeesSalary ON EmployeesSalary.RestaurantEmployeeID = RestaurantEmployees.RestaurantEmployeeID
        FROM RestaurantEmployees
        WHERE RestaurantEmployees.RestaurantEmployeeID = @input
go

-- sprawdzenie stanu rezerwacji id
CREATE FUNCTION GetStateOfReservation(@input int)
    RETURNS text AS
        RETURN
        SELECT IF(Reservation.FromTime< GETDATE(), "Nie rozpoczęto", IF(Reservation.ToTime< GETDATE(), "Zakończono", "W trakcie"))
        FROM Reservation
        WHERE Reservation.ReservationID = @input
go

-- zamówienia powyżej jakiejś wartości
CREATE FUNCTION GetOrdersAboveValue(@input int)
    RETURNS table AS
        RETURN
        SELECT Orders.OrderID, Orders.OrderStatus, OrderDetails.Quantity*ProductPrices.UnitPrice as cena
        FROM Orders
        INNER JOIN OrderDetails.OrderID ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE cena > @input
go

-- suma zamówień danego dnia
CREATE FUNCTION udfgetValueOfOrdersOnDay(@date date)
    RETURNS int AS
        RETURN  
        SELECT SUM(OrderDetails.Quantity*ProductPrices.UnitPrice)
        FROM Orders
        INNER JOIN OrderDetails.OrderID ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE YEAR(@date) = YEAR(Orders.OrderDate)
        AND MONTH(@date) = MONTH(Orders.OrderDate)
        AND DAY(@date) = DAY(Orders.OrderDate)
go
-- suma zamówień danego miesiąca
CREATE FUNCTION udfgetValueOfOrdersOnDay(@date date)
    RETURNS int AS
        RETURN  
        SELECT SUM(OrderDetails.Quantity*ProductPrices.UnitPrice)
        FROM Orders
        INNER JOIN OrderDetails.OrderID ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE YEAR(@date) = YEAR(Orders.OrderDate)
        AND MONTH(@date) = MONTH(Orders.OrderDate)
go

-- wartosc X zamówienia
CREATE FUNCTION GetValueOfOrder(@input int)
    RETURNS int AS
        RETURN
        SELECT  OrderDetails.Quantity*ProductPrices.UnitPrice as cena
        FROM Orders
        INNER JOIN OrderDetails.OrderID ON OrderDetails.OrderID = Orders.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        WHERE Orders.OrderID = @input
go

-- wartosc najtańszy produkt o nazwie
CREATE FUNCTION GetCheapestProductInCategory(@input int)
    RETURNS int AS
        RETURN
        SELECT TOP ProductPrices.UnitPrice as cena, ProductName
        FROM Products
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
        WHERE Categories.CategoryID = @input
        ORDER BY cena DESC
go

-- wartosc najdroższy produkt o nazwie
CREATE FUNCTION GetCheapestProductInCategory(@input char)
    RETURNS int AS
        RETURN
        SELECT TOP ProductPrices.UnitPrice as cena, ProductName
        FROM Products
        INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
        WHERE Categories.CategoryID = @input
go