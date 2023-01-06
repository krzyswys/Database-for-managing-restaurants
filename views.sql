-- Current_Menu_View
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
WHERE OrderStatus like '%not_paid%'
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

SELECT 
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

(SELECT SUM(table2.calkowitaSuma) FROM (SELECT Orders.OrderID,SUM(OrderDetails.Quantity*ProductPrices.UnitPrice) as calkowitaSuma
FROM Orders INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID 
INNER JOIN ProductPrices ON Products.ProductID = ProductPrices.ProductID
WHERE MONTH(Orders.OrderDate) = MONTH(GETDATE()) 
AND YEAR(Orders.OrderDate) = YEAR(GETDATE())
AND Orders.OrderDate >= ProductPrices.FromTime AND (ProductPrices.ToTime is NULL OR ProductPrices.ToTime >= Orders.OrderDate)
GROUP BY Orders.OrderID) AS table2 ) AS [total order price for the last month],

(SELECT SUM(table2.calkowitaSuma) FROM (SELECT Orders.OrderID,SUM(OrderDetails.Quantity*ProductPrices.UnitPrice) as calkowitaSuma
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
