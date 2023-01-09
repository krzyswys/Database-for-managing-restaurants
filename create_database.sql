-- TABLES --
CREATE TABLE Companies
(
    CompanyID   int    NOT NULL,
    CustomerID  int    NOT NULL,
    CompanyName varchar(64) NOT NULL,
    NIP         char(10)    NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY (CompanyID)
);

CREATE TABLE CompanyEmployees
(
    CompanyEmployeeID int NOT NULL,
    PersonID          int NOT NULL,
    CompanyID         int NOT NULL,
    CONSTRAINT CompanyEmployees_pk PRIMARY KEY (CompanyEmployeeID)
);

CREATE TABLE CompanyReservationParticipants
(
    ReservationID     int NOT NULL,
    CompanyEmployeeID int NOT NULL,
);

CREATE TABLE CustomersPersonalData
(
    PersonID  int    NOT NULL,
    FirstName varchar(64) NOT NULL,
    LastName  varchar(64) NOT NULL,
    CONSTRAINT FirstName_CustomersPersonalData_c CHECK (FirstName LIKE '[A-Z]%'),
    CONSTRAINT LastName_CustomersPersonalData_c CHECK (LastName LIKE '[A-Z]%'),
    CONSTRAINT CustomersPersonalData_pk PRIMARY KEY (PersonID)
);

CREATE TABLE Customers
(
    CustomerID int    NOT NULL,
    Street     varchar(64) NOT NULL,
    Country    varchar(64) NOT NULL,
    City       varchar(64) NOT NULL,
    PostCode   varchar(16) NOT NULL,
    Phone      varchar(16) NOT NULL,
    Email      varchar(64) NOT NULL,
    CONSTRAINT Country_Customers_c CHECK (Country LIKE '[A-Z]%'),
    CONSTRAINT City_Customers_c CHECK (City LIKE '[A-Z]%'),
    CONSTRAINT Street_Customers_c CHECK (Street LIKE '[A-Z]%'),
    CONSTRAINT Customers_pk PRIMARY KEY (CustomerID)
);

CREATE TABLE IndividualCustomers
(
    CustomerID int NOT NULL,
    PersonID   int NOT NULL,
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY (CustomerID)
);

CREATE TABLE DiningTables
(
    DiningTableID int NOT NULL,
    NumberOfSeats int      NOT NULL,
    CONSTRAINT NumberOfSeats_DiningTables_c CHECK (NumberOfSeats > 0),
    CONSTRAINT DiningTables_pk PRIMARY KEY (DiningTableID)
);

CREATE TABLE Invoices
(
    InvoiceID int NOT NULL,
    OrderID   int NOT NULL,
    CONSTRAINT Invoices_pk PRIMARY KEY (InvoiceID)
);

CREATE TABLE Menu
(
    MenuID   int    NOT NULL,
    MenuName varchar(64) NOT NULL,
    FromTime datetime    NOT NULL,
    ToTime   datetime    NULL DEFAULT NULL,
    CONSTRAINT Proper_Dates_Menu_c CHECK (FromTime <= ToTime OR ToTime IS NULL),
    CONSTRAINT Menu_pk PRIMARY KEY (MenuID)
);

CREATE TABLE MenuDetails
(
    MenuID    int NOT NULL,
    ProductID int NOT NULL,
);

CREATE TABLE OrderDetails
(
    OrderID   int NOT NULL,
    ProductID int NOT NULL,
    Quantity  int      NOT NULL,
    CONSTRAINT Quantity_OrderDetails_c CHECK (Quantity >= 0),
);

CREATE TABLE Orders
(
    OrderID              int    NOT NULL,
    CustomerID           int    NOT NULL,
    OrderDate            datetime    NOT NULL,
    CollectDate          datetime   NULL,
    PaymentDate          datetime    NULL DEFAULT NULL,
    PayVia               int    NULL,
    OrderStatus          varchar(64) NOT NULL,
    RestaurantEmployeeID int    NOT NULL,
    DiscountPercent      int    NOT NULL DEFAULT 0,
    CONSTRAINT Orders_pk PRIMARY KEY (OrderID)
);

CREATE TABLE PaymentMethod
(
    PaymentID   int    NOT NULL,
    PaymentName varchar(64) NOT NULL,
    CONSTRAINT PaymentMethod_pk PRIMARY KEY (PaymentID)
)

CREATE TABLE ProductIngredients
(
    ProductID    int NOT NULL,
    IngredientID int NOT NULL,
);

CREATE TABLE IngredientsWarehouse
(
    IngredientID   int    NOT NULL,
    IngredientName varchar(64) NOT NULL,
    QuantityLeft   int         NOT NULL,
    CONSTRAINT QuantityLeft_IngredientsWarehouse_c CHECK (QuantityLeft >= 0),
    CONSTRAINT IngredientsWarehouse_pk PRIMARY KEY (IngredientID)
);


CREATE TABLE Products
(
    ProductID   int    NOT NULL,
    ProductName varchar(64) NOT NULL,
    CategoryID  int    NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY (ProductID)
);

CREATE TABLE ProductPrices
(
    ProductID int NOT NULL,
    FromTime  datetime NOT NULL,
    ToTime    datetime NULL DEFAULT NULL,
    UnitPrice int      NOT NULL,
    CONSTRAINT Proper_Dates_ProductPrices_c CHECK (FromTime <= ToTime OR ToTime IS NULL),
    CONSTRAINT UnitPrice_ProductPrices_c CHECK (UnitPrice >= 0),
);

CREATE TABLE Categories
(
    CategoryID   int    NOT NULL,
    CategoryName varchar(64) NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY (CategoryID)
);

CREATE TABLE Reservation
(
    ReservationID int NOT NULL,
    FromTime      datetime NOT NULL,
    ToTime        datetime NOT NULL,
    Seats         int      NOT NULL,
    DiningTableID int NOT NULL,
    OrderID       int NOT NULL,
    CONSTRAINT Seats_Reservation_c CHECK (Seats <= 40 AND Seats > 0),
    CONSTRAINT Proper_Dates_Reservation_c CHECK (FromTime < ToTime),
    CONSTRAINT Reservation_pk PRIMARY KEY (ReservationID)
);

CREATE TABLE RestaurantEmployees
(
    RestaurantEmployeeID int    NOT NULL,
    FirstName            varchar(64) NOT NULL,
    LastName             varchar(64) NOT NULL,
    Occupation           varchar(64) NOT NULL,
    Street               varchar(64) NOT NULL,
    Country              varchar(64) NOT NULL,
    City                 varchar(64) NOT NULL,
    PostCode             varchar(16) NOT NULL,
    Phone                char(9)     NOT NULL,
    Email                varchar(64) NOT NULL,
    CONSTRAINT City_RestaurantEmployees_c CHECK ((City LIKE '[A-Z]%')),
    CONSTRAINT Country_RestaurantEmployees_c CHECK ((Country LIKE '[A-Z]%')),
    CONSTRAINT Street_RestaurantEmployees_c CHECK ((Street LIKE '[A-Z]%')),
    CONSTRAINT Name_Validation_RestaurantEmployees_c CHECK ((FirstName LIKE '[A-Z]%') AND (LastName LIKE '[A-Z]%')),
    CONSTRAINT RestaurantEmployees_pk PRIMARY KEY (RestaurantEmployeeID)
);

CREATE TABLE EmployeesSalary
(
    RestaurantEmployeeID int NOT NULL,
    FromTime             datetime NOT NULL,
    ToTime               datetime NULL DEFAULT NULL,
    Salary               int      NOT NULL,
    CONSTRAINT Salary_EmployeesSalary_c CHECK (Salary >= 0),
    CONSTRAINT Proper_Dates_EmployeesSalary_c CHECK (FromTime <= ToTime OR ToTime IS NULL),
);

CREATE TABLE Takeaway
(
    OrderID    int NOT NULL,
    PickupDate datetime NULL DEFAULT NULL,
    CONSTRAINT Takeaway_pk PRIMARY KEY (OrderID)
);

CREATE TABLE VariablesData
(
    FromTime      datetime   NOT NULL,
    ToTime        datetime   NULL DEFAULT NULL,
    VariableType  varchar(3) NOT NULL,
    VariableValue int        NOT NULL,
    CONSTRAINT Proper_Dates_VariablesData_c CHECK (FromTime <= ToTime OR ToTime IS NULL),
    CONSTRAINT VariableValue_VariablesData_c CHECK (VariablesData.VariableValue >= 0)
);

CREATE TABLE TempDiscount
(
    CustomerID       int        NOT NULL,
    FromTime         datetime   NOT NULL,
    ToTime           datetime   NULL DEFAULT NULL,
    DiscountPercent  int        NOT NULL DEFAULT 0,
    CONSTRAINT Proper_Dates_TempDiscount_c CHECK (FromTime <= ToTime OR ToTime IS NULL),
    CONSTRAINT TempDiscount_DiscountPercent_c CHECK (TempDiscount.DiscountPercent >= 0)
);

-- Foreign Keys
ALTER TABLE Products
    ADD CONSTRAINT Categories_Products
        FOREIGN KEY (CategoryID)
            REFERENCES Categories (CategoryID);

ALTER TABLE Companies
    ADD CONSTRAINT Companies_Customers
        FOREIGN KEY (CustomerID)
            REFERENCES Customers (CustomerID);

ALTER TABLE CompanyEmployees
    ADD CONSTRAINT CompanyEmployees_Companies
        FOREIGN KEY (CompanyID)
            REFERENCES Companies (CompanyID);

ALTER TABLE EmployeesSalary
    ADD CONSTRAINT EmployeesSalary_RestaurantEmployee
        FOREIGN KEY (RestaurantEmployeeID)
            REFERENCES RestaurantEmployees (RestaurantEmployeeID);

ALTER TABLE CompanyReservationParticipants
    ADD CONSTRAINT CompanyEmployees_CompanyReservationParticipants
        FOREIGN KEY (CompanyEmployeeID)
            REFERENCES CompanyEmployees (CompanyEmployeeID);

ALTER TABLE CompanyReservationParticipants
    ADD CONSTRAINT CompanyReservationParticipants_Reservation
        FOREIGN KEY (ReservationID)
            REFERENCES Reservation (ReservationID);

ALTER TABLE CompanyEmployees
    ADD CONSTRAINT CustomerPersonalData_CompanyEmployees
        FOREIGN KEY (PersonID)
            REFERENCES CustomersPersonalData (PersonID);

ALTER TABLE IndividualCustomers
    ADD CONSTRAINT CustomerPersonalData_IndividualCustomers
        FOREIGN KEY (PersonID)
            REFERENCES CustomersPersonalData (PersonID);

ALTER TABLE Orders
    ADD CONSTRAINT Customers_Orders
        FOREIGN KEY (CustomerID)
            REFERENCES Customers (CustomerID);

ALTER TABLE IndividualCustomers
    ADD CONSTRAINT IndividualCustomers_Customers
        FOREIGN KEY (CustomerID)
            REFERENCES Customers (CustomerID);

ALTER TABLE ProductIngredients
    ADD CONSTRAINT IngredientsWarehouse_ProductIngredients
        FOREIGN KEY (IngredientID)
            REFERENCES IngredientsWarehouse (IngredientID);

ALTER TABLE MenuDetails
    ADD CONSTRAINT MenuDetails_Products
        FOREIGN KEY (ProductID)
            REFERENCES Products (ProductID);

ALTER TABLE MenuDetails
    ADD CONSTRAINT Menu_MenuDetails
        FOREIGN KEY (MenuID)
            REFERENCES Menu (MenuID);

ALTER TABLE Invoices
    ADD CONSTRAINT Orders_Invoices
        FOREIGN KEY (OrderID)
            REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails
    ADD CONSTRAINT Orders_OrderDetails
        FOREIGN KEY (OrderID)
            REFERENCES Orders (OrderID);

ALTER TABLE Reservation
    ADD CONSTRAINT Orders_Reservation
        FOREIGN KEY (OrderID)
            REFERENCES Orders (OrderID);

ALTER TABLE Orders
    ADD CONSTRAINT Orders_RestaurantEmployees
        FOREIGN KEY (RestaurantEmployeeID)
            REFERENCES RestaurantEmployees (RestaurantEmployeeID);

ALTER TABLE Takeaway
    ADD CONSTRAINT Orders_Takeaway
        FOREIGN KEY (OrderID)
            REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails
    ADD CONSTRAINT Products_OrderDetails
        FOREIGN KEY (ProductID)
            REFERENCES Products (ProductID);

ALTER TABLE ProductIngredients
    ADD CONSTRAINT Products_ProductIngredients
        FOREIGN KEY (ProductID)
            REFERENCES Products (ProductID);

ALTER TABLE Reservation
    ADD CONSTRAINT Reservation_DiningTables
        FOREIGN KEY (DiningTableID)
            REFERENCES DiningTables (DiningTableID);

ALTER TABLE ProductPrices
    ADD CONSTRAINT ProductPrices_Products
        FOREIGN KEY (ProductID)
            REFERENCES Products (ProductID);

ALTER TABLE Orders
    ADD CONSTRAINT Orders_PaymentMethod
        FOREIGN KEY (PayVia)
            REFERENCES PaymentMethod (PaymentID);
            
 ALTER TABLE TempDiscount
    ADD CONSTRAINT TempDiscount_Customers
        FOREIGN KEY (CustomerID)
            REFERENCES Customers (CustomerID);
GO


-- VIEWS --
CREATE VIEW Current_Menu_View AS
SELECT Products.ProductID ,Products.ProductName, ProductPrices.UnitPrice
FROM MenuDetails
         JOIN Products ON Products.ProductID = MenuDetails.ProductID
         JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
WHERE MenuID = (SELECT MenuID
                FROM Menu
                WHERE ToTime IS NULL)
AND ProductPrices.ToTime IS NULL
GO

-- Available_Products_View
CREATE VIEW Available_Products_View AS
SELECT Products.ProductID, ProductName
from ProductIngredients
         JOIN IngredientsWarehouse ON ProductIngredients.IngredientID = IngredientsWarehouse.IngredientID
         JOIN Products ON ProductIngredients.ProductID = Products.ProductID
GROUP BY Products.ProductID, ProductName
HAVING MIN(QuantityLeft) > 0
GO

-- Not_Available_Products_View
CREATE VIEW Not_Available_Products_View AS
SELECT Products.ProductID, ProductName
from ProductIngredients
         JOIN IngredientsWarehouse ON ProductIngredients.IngredientID = IngredientsWarehouse.IngredientID
         JOIN Products ON ProductIngredients.ProductID = Products.ProductID
GROUP BY Products.ProductID, ProductName
HAVING MIN(QuantityLeft) = 0
GO

-- Not_Available_Ingredients_View
CREATE VIEW Not_Available_Ingredients_View AS
SELECT IngredientID, IngredientName
from IngredientsWarehouse
WHERE QuantityLeft = 0
GO

--Not_Paid_Orders_View
CREATE VIEW Not_Paid_Orders_View AS
SELECT CustomerID, RestaurantEmployeeID, OrderID
FROM Orders
WHERE OrderStatus like 'awaiting payment'
GO

--Today_Reservations_View
CREATE VIEW Today_Reservations_View AS
SELECT FromTime, ToTime, Seats, Orders.PaymentDate, CustomersPersonalData.FirstName, CustomersPersonalData.LastName
FROM Reservation
        JOIN Orders ON Orders.OrderID = Reservation.OrderID
        JOIN Customers ON Customers.CustomerID = Orders.CustomerID
        JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
        JOIN CustomersPersonalData ON CustomersPersonalData.PersonID = IndividualCustomers.PersonID 
WHERE FromTime = (SELECT CAST( GETDATE() AS Date )) 
GO

--Orders_Pending_For_Confirmation_View
CREATE VIEW Orders_Pending_For_Confirmation_View AS
SELECT CustomerID, RestaurantEmployeeID, OrderID
FROM Orders
WHERE OrderStatus like '%not_confirmed%'
GO

--Takaway_Orders_Pending_For_Pickup_View
--CREATE VIEW Takaway_Orders_Pending_For_Pickup_View AS
--SELECT CustomerID, RestaurantEmployeeID, OrderID
--FROM Orders
--WHERE Takeaway. is NULL --?TODO: create a takeaway_status?
--GO

--Order_Details_View
CREATE VIEW Order_Details_View
AS
SELECT  Customers.CustomerID,CustomersPersonalData.FirstName, CustomersPersonalData.LastName,Orders.OrderID, OrderDetails.Quantity,
ProductPrices.UnitPrice, OrderDate, PaymentDate, PaymentMethod.PaymentName, OrderStatus, RestaurantEmployees.RestaurantEmployeeID
FROM Orders
        JOIN OrderDetails ON  OrderDetails.OrderID = Orders.OrderID
        JOIN Products ON Products.ProductID = OrderDetails.ProductID
        JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        JOIN PaymentMethod ON PaymentMethod.PaymentId = Orders.PayVia
        JOIN RestaurantEmployees ON RestaurantEmployees.RestaurantEmployeeID = Orders.RestaurantEmployeeID
        JOIN Customers ON Customers.CustomerID = Orders.CustomerID
        JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
        JOIN CustomersPersonalData ON CustomersPersonalData.PersonID = IndividualCustomers.PersonID 
GO
		
--Report_Of_Total_Orders_Products_Price_View
CREATE VIEW Total_Orders_Products_Prices_Report_View AS

SELECT TOP 1
(SELECT COUNT(OrderID) FROM Orders
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())) AS [total number of orders for the last month],
(SELECT COUNT(OrderID) FROM Orders 
WHERE DATEPART(WEEK,Orders.OrderDate) = DATEPART(WEEK,GETDATE()) AND YEAR(Orders.OrderDate) = YEAR(GETDATE()))
AS [total number of orders for the last week],


(SELECT SUM(Quantity) FROM OrderDetails INNER JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())) AS [total number of sold products for the last month],

(SELECT SUM(Quantity) FROM OrderDetails INNER JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
WHERE DATEPART(WEEK,Orders.OrderDate) = DATEPART(WEEK,GETDATE()) AND YEAR(Orders.OrderDate) = YEAR(GETDATE()))
AS [total number of sold products for the last week],

(SELECT SUM(table2.calkowitaSuma) FROM (SELECT Orders.OrderID,SUM(OrderDetails.Quantity*ProductPrices.UnitPrice*(1-(Orders.DiscountPercent/100.0))) as calkowitaSuma
FROM Orders INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID 
INNER JOIN ProductPrices ON Products.ProductID = ProductPrices.ProductID
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
AND Orders.OrderDate >= ProductPrices.FromTime AND (ProductPrices.ToTime is NULL OR ProductPrices.ToTime >= Orders.OrderDate)
GROUP BY Orders.OrderID) AS table2 ) AS [total order price for the last month],

(SELECT SUM(table2.calkowitaSuma) FROM (SELECT Orders.OrderID,SUM(OrderDetails.Quantity*ProductPrices.UnitPrice*(1-(Orders.DiscountPercent/100.0))) as calkowitaSuma
FROM Orders INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID 
INNER JOIN ProductPrices ON Products.ProductID = ProductPrices.ProductID
WHERE DATEPART(WEEK,Orders.OrderDate) = DATEPART(WEEK,GETDATE()) AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
AND Orders.OrderDate >= ProductPrices.FromTime AND (ProductPrices.ToTime is NULL OR ProductPrices.ToTime >= Orders.OrderDate)
GROUP BY Orders.OrderID) AS table2 ) AS [total order price for the last week]

FROM Orders 
GO

--Average_Salary_Of_Restaurant_Employee_View
CREATE VIEW Average_Salary_Of_Restaurant_Employee_View AS
SELECT RestaurantEmployees.RestaurantEmployeeID ,FirstName,LastName, ROUND(AVG(Salary),2) as [srednie zarobki]
FROM RestaurantEmployees INNER JOIN EmployeesSalary ON RestaurantEmployees.RestaurantEmployeeID = EmployeesSalary.RestaurantEmployeeID
GROUP BY RestaurantEmployees.RestaurantEmployeeID ,FirstName,LastName
GO

--Five_Best_Employees_View
CREATE VIEW Five_Best_Employees_View AS
SELECT TOP 5 RestaurantEmployees.RestaurantEmployeeID, FirstName,LastName FROM RestaurantEmployees
INNER JOIN Orders ON Orders.RestaurantEmployeeID = RestaurantEmployees.RestaurantEmployeeID
GROUP BY RestaurantEmployees.RestaurantEmployeeID, FirstName,LastName
ORDER BY COUNT(OrderID) DESC
GO

--Total_Products_Sales_View
CREATE VIEW Total_Products_Sales_View AS
SELECT ProductName, SUM(Quantity) AS TotalOrders
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY ProductName
GO

--Total_Categories_Sales_View
CREATE VIEW Total_Categories_Sales_View AS
SELECT Categories.CategoryName, SUM(Quantity) AS TotalOrders
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName
GO

--Available_Tables_View
CREATE VIEW Available_Tables_View AS
SELECT DISTINCT DiningTables.DiningTableID, DiningTables.NumberOfSeats
FROM Reservation
JOIN DiningTables ON DiningTables.DiningTableID = Reservation.DiningTableID
WHERE ToTime < GETDATE()
GO


--Total_Reservation_Report_for_Customers_View
CREATE VIEW Total_Reservation_Report_for_Customers_View AS
SELECT 
(SELECT COUNT(*)  FROM Reservation 
INNER JOIN Orders ON Reservation.OrderID = Orders.OrderID 
INNER JOIN Customers ON Customers.CustomerID = Reservation.ReservationID 
INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
) as [ilość dokonanych rezerwacji prywatnie w tym miesiącu],
(SELECT COUNT(*)  FROM Reservation 
INNER JOIN Orders ON Reservation.OrderID = Orders.OrderID 
INNER JOIN Customers ON Customers.CustomerID = Reservation.ReservationID 
INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
WHERE DATEPART(WEEK,Orders.OrderDate) = DATEPART(WEEK,GETDATE()) AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
) as [ilosc dokonanych rezerwacji prywatnie w tym tygodniu],
(SELECT COUNT(*)  FROM Reservation 
INNER JOIN Orders ON Reservation.OrderID = Orders.OrderID 
INNER JOIN Customers ON Customers.CustomerID = Reservation.ReservationID 
INNER JOIN Companies ON Companies.CustomerID = Customers.CustomerID
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
) as [ilosc dokonanych rezerwacji na firmę w tym miesiacu],
(SELECT COUNT(*)  FROM Reservation 
INNER JOIN Orders ON Reservation.OrderID = Orders.OrderID 
INNER JOIN Customers ON Customers.CustomerID = Reservation.ReservationID 
INNER JOIN Companies ON Companies.CustomerID = Customers.CustomerID
WHERE DATEPART(WEEK,Orders.OrderDate) = DATEPART(WEEK,GETDATE()) AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
) as [ilosc dokonanych rezerwacji na firmę w tym tygodniu]
GO

-- CurrentMenuSalesStatsView
CREATE VIEW CurrentMenuSalesStatsView
AS
SELECT Products.ProductName, COUNT(Products.ProductName) AS Total
FROM Products
LEFT JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
LEFT JOIN  Orders ON Orders.OrderID = OrderDetails.ProductID
WHERE (OrderDate > (SELECT FromTime
		    FROM Menu
		    WHERE ToTime IS NULL)
OR OrderDate IS NULL)
AND Products.ProductID IN (SELECT ProductID
			   FROM MenuDetails
			   WHERE MenuID = (SELECT MenuID
					   FROM Menu
					   WHERE ToTime IS NULL))
GROUP BY Products.ProductName 
GO

-- TotalCustomersDiscountsView
CREATE VIEW TotalCustomersDiscountsView
AS
SELECT Customers.CustomerID, SUM(ISNULL((DiscountPercent / 100.0) * (UnitPrice * Quantity), 0)) AS TotalDisocunt
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
LEFT JOIN ProductPrices ON OrderDetails.ProductID = ProductPrices.ProductID
WHERE ProductPrices.ToTime IS NULL
GROUP BY Customers.CustomerID
GO


-- OrderStatisticsView
CREATE VIEW OrderStatisticsView
AS
SELECT 
(SELECT COUNT(*) FROM Orders) as [całkowita liczba zamówień],
(SELECT SUM(ProductPrices.UnitPrice*Quantity*(1- (DiscountPercent/100.0))) FROM Orders 
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID =  Products.ProductID
INNER JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
WHERE ProductPrices.FromTime < Orders.OrderDate AND (ProductPrices.ToTime = NULL OR ProductPrices.ToTime > Orders.OrderDate)
) as [całkowita cena zrealizowanych zamówień],
(SELECT COUNT(*) FROM Orders 
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
) as [ilość zamowien dla klientow indywidualnych],
(SELECT COUNT(*) FROM Orders 
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN Companies ON Companies.CustomerID = Customers.CustomerID
) as [ilość zamowien dla klientów firmowych],
(SELECT COUNT(*) FROM Orders WHERE PaymentDate = NULL) as [ilość zamówień nieopłaconych],
(SELECT COUNT(*) FROM Orders WHERE CollectDate = NULL) as [ilość zamówień nieodebranych],
(SELECT TOP 1 OrderDate FROM Orders ORDER BY OrderDate DESC) as [data ostatnio zrealizowanego zamówienia]
GO



-- FUNCTIONS --
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


CREATE FUNCTION invoice(@ordersID int)
RETURNS table
AS
RETURN
       SELECT Products.ProductName as[nazwa produktu], 
        OrderDetails.Quantity as [ilosc], 
        ProductPrices.UnitPrice as [cena produktu], 
        Orders.DiscountPercent as [zniżka], 
        ProductPrices.UnitPrice*(1- (Orders.DiscountPercent/100.0)) as [cena produktu z uwzględnieniem zniżki],
		Orders.OrderDate as [data zamowienia] FROM Orders 
        INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON Products.ProductID = ProductPrices.ProductID
        WHERE ProductPrices.FromTime >= Orders.OrderDate AND (ProductPrices.ToTime = NULL OR ProductPrices.ToTime  >= Orders.OrderDate)
        AND Orders.OrderID = @ordersID
GO

CREATE FUNCTION collectiveInvoice(@companyID int)
RETURNS table
AS 
RETURN 
        SELECT 
        SUM(OrderDetails.Quantity*ProductPrices.UnitPrice*(1-(Orders.DiscountPercent/100.0))) as [calkowita cena produktow],
        ROUND(AVG(Orders.DiscountPercent),2) as [srednia znizek],
        Orders.OrderDate as [data zamowienia],
        Companies.NIP as [NIP firmy]
        FROM Companies 
        INNER JOIN  Customers ON Companies.CustomerID = Customers.CustomerID
        INNER JOIN ORDERS ON Customers.CustomerID = Orders.CustomerID
        INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
        INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
        INNER JOIN ProductPrices ON Products.ProductID = ProductPrices.ProductID
        WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
        AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
        AND Companies.CompanyID = @companyID 
        AND ProductPrices.FromTime >= Orders.OrderDate AND (ProductPrices.ToTime = NULL OR ProductPrices.ToTime  >= Orders.OrderDate)
        GROUP BY Orders.OrderDate,Companies.NIP
GO



-- PROCEDURES --
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
        INSERT INTO DiningTables(DiningTableID, NumberOfSeats)
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
            WHERE MenuID = @MenuID
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
	VALUES (@OrderID, @ProductID,@Quantity);

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
            FROM OrderDetails
            WHERE OrderID = @OrderID
			AND ProductID = @ProductID
			AND Quantity = @Quantity
        )
        BEGIN
        ;
        DELETE FROM OrderDetails WHERE  OrderID = @OrderID AND ProductID = @ProductID AND Quantity = @Quantity
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



-- dodawanie klienta
CREATE PROCEDURE AddCustomerProcedure 
@Street varchar(64), 
@Country varchar(64), 
@City varchar(64), 
@PostCode varchar(16), 
@Phone varchar(16),
@Email varchar(64)

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Customers
            WHERE Street = @Street AND Country = @Country AND City=@City AND PostCode = @PostCode AND Phone = @Phone AND Email=@Email
        )
        BEGIN
            ;
            THROW 52000, 'Klient jest już w bazie', 1
        END
    
    DECLARE @CustomerID INT
    SELECT @CustomerID = ISNULL(MAX(CustomerID), 0) + 1
    FROM Customers
    INSERT INTO Customers(CustomerID,Street, Country, City, PostCode, Phone, Email)
    VALUES (@CustomerID, @Street, @Country, @City, @PostCode, @Phone, @Email);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd dodawania klienta: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- usunięcie pracownika
CREATE PROCEDURE RemoveCustomerProcedure 
@CustomerID INT

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Customers
            WHERE CustomerID = @CustomerID
        )
        BEGIN
        ;
        DELETE FROM Customers 
		WHERE  CustomerID = @CustomerID 
        END
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd usuwania klienta: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

--dodanie dla danej zmiennej nowego czasu, aktualizacja dotychczasowej komorki z NULL'em w toTime

CREATE PROCEDURE updateDiscountProcedure
@VariableType varchar(3),
@VariableValue int

AS
BEGIN 
	SET NOCOUNT ON
	BEGIN TRY
		IF NOT EXISTS(
            SELECT *
            FROM VariablesData
            WHERE VariableType = @VariableType
        )
			BEGIN
				;
				THROW 52000, 'this type of discount does not exist', 1
			END
		
		
		IF EXISTS(
			SELECT * FROM VariablesData WHERE VariableType = @VariableType AND ToTime IS NULL
		)
		BEGIN 
			;
			UPDATE VariablesData SET ToTime = GETDATE() WHERE ToTime IS NULL  AND VariableType = @VariableType
		END

	    INSERT INTO VariablesData(FromTime,ToTime,VariableType,VariableValue)
			VALUES (GETDATE(),NULL,@VariableType,@VariableValue);
			
			
	END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Błąd aktualizacji rabatu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go


-- AddReservationProcedure
CREATE PROCEDURE AddReservationProcedure
@FromTime      datetime ,
@ToTime        datetime ,
@Seats         int,
@DiningTableID int,
@OrderID       int
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF NOT EXISTS(
		SELECT OrderID FROM Orders WHERE OrderID = @OrderID
		)
			BEGIN
				;
				THROW 52000, 'Provided OrderID is not in the database', 1
			END
		
		IF NOT EXISTS(
		SELECT DiningTableID FROM DiningTables WHERE DiningTableID = @DiningTableID
		)
			BEGIN
				;
				THROW 52000, 'Provided DiningTableID is not in the database', 1
			END
		
		IF EXISTS(
            SELECT *
            FROM Reservation
            WHERE OrderID = @OrderID AND DiningTableID = @DiningTableID
        )
			BEGIN
				;
				THROW 52000, 'Reservation with provided OrderID and DiningTableID is already in the database', 1
			END

    DECLARE @ReservationID INT
		SELECT @ReservationID = ISNULL(MAX(ReservationID), 0) + 1
		FROM Reservation

	INSERT INTO Reservation(ReservationID, FromTime, ToTime, Seats,DiningTableID,OrderID)
	VALUES (@ReservationID, @FromTime, @ToTime, @Seats,@DiningTableID,@OrderID);

    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error adding menu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go

-- RemoveReservationProcedure
CREATE PROCEDURE RemoveReservationProcedure
@ReservationID int
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        IF EXISTS(
            SELECT *
            FROM Reservation
            WHERE ReservationID = @ReservationID
        )
        BEGIN
        ;
        DELETE FROM Reservation WHERE  @ReservationID = ReservationID
        END
    ELSE
        BEGIN
            ;
            THROW 52000, 'Reservation with provided ID does not exist', 1 
        END
      
    END TRY
    BEGIN CATCH
        DECLARE @errormsg nvarchar(2048) =
                    'Error removing menu: ' + ERROR_MESSAGE();
        THROW 52000, @errormsg, 1;
    END CATCH
END
go



-- TRIGGERS --
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
                          WHERE Orders.CustomerID = @InsertedCustomerID AND ( [dbo].GetValueOfOrder(@InsertedOrderID))>@ThisOrderK1)

                          

	DECLARE @ThisOrderCustomerNumberValueOfOrders int
	SET @ThisOrderCustomerNumberValueOfOrders = (SELECT SUM(   [dbo].GetValueOfOrder(Orders.OrderID))  --sumuje wszystkie zamówienia danego klienta
			                  FROM Customers
				          INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
                          INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
                          WHERE Orders.CustomerID = @InsertedCustomerID) 


	IF @ThisOrderCustomerNumberOfOrders >= @ThisOrderZ1
		BEGIN
	    			PRINT ('Qualified for first discount')
					UPDATE TempDiscount 
					SET DiscountPercent = @ThisOrderR1, ToTime = NULL, FromTime = GETDATE()
					WHERE CustomerID = @InsertedOrderID
		END

    IF @ThisOrderCustomerNumberValueOfOrders >= @ThisOrderK2
        BEGIN
	    			PRINT ('Qualified for second discount')
					UPDATE TempDiscount 
					SET DiscountPercent = @ThisOrderR1, ToTime = DATEADD(day,@ThisOrderD1, GETDATE()), FromTime = GETDATE()
					WHERE CustomerID = @InsertedOrderID
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
			                FROM VariablesData WHERE VariableType='WK' AND toTime IS NULL)

    DECLARE @ThisOrderWZ int
	SET @ThisOrderWZ = (SELECT VariableValue
			                FROM VariablesData WHERE VariableType='WZ' AND toTime IS NULL)
                                

	DECLARE @ThisOrderCustomerNumberOfOrders int
	SET @ThisOrderCustomerNumberOfOrders =(SELECT COUNT(Orders.OrderID) --liczy wszystkie zamówienia danego klienta 
			                  FROM Customers
				          INNER JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
                          INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
                          WHERE Orders.CustomerID = @InsertedCustomerID) 

	DECLARE @ThisOrderCustomerNumberValueOfOrders int
	SET @ThisOrderCustomerNumberValueOfOrders = (dbo.GetValueOfOrder(@InsertedOrderID) --liczy wartosc danego zamowienia
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



-- INDEXES --
-- RestaurantEmployees_RestaurantEmployeeID_Index
CREATE UNIQUE NONCLUSTERED INDEX RestaurantEmployees_RestaurantEmployeeID_Index ON RestaurantEmployees (RestaurantEmployeeID);

-- Products_ProductID_Index
CREATE UNIQUE NONCLUSTERED INDEX Products_ProductID_Index ON Products (ProductID);

-- Menu_MenuID_Index
CREATE UNIQUE NONCLUSTERED INDEX Menu_MenuID_Index ON Menu (MenuID);

-- MenuDetails_MenuID_Index
CREATE NONCLUSTERED INDEX MenuDetails_MenuID_Index ON MenuDetails (MenuID);

-- Orders_OrderID_Index
CREATE UNIQUE NONCLUSTERED INDEX Orders_OrderID_Index ON Orders (OrderID);

-- OrderDetails_OrderID_Index
CREATE NONCLUSTERED INDEX OrderDetails_OrderID_Index ON OrderDetails (OrderID);

-- Customers_CustomerID_Index
CREATE UNIQUE NONCLUSTERED INDEX Customers_CustomerID_Index ON Customers (CustomerID);
