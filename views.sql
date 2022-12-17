-- Views

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

-- Available_Products_View
CREATE VIEW Available_Products_View AS
SELECT Products.ProductID, ProductName
from ProductIngredients
         JOIN IngredientsWarehouse ON ProductIngredients.IngredientID = IngredientsWarehouse.IngredientID
         JOIN Products ON ProductIngredients.ProductID = Products.ProductID
GROUP BY Products.ProductID, ProductName
HAVING MIN(QuantityLeft) > 0

-- Not_Available_Products_View
CREATE VIEW Not_Available_Products_View AS
SELECT Products.ProductID, ProductName
from ProductIngredients
         JOIN IngredientsWarehouse ON ProductIngredients.IngredientID = IngredientsWarehouse.IngredientID
         JOIN Products ON ProductIngredients.ProductID = Products.ProductID
GROUP BY Products.ProductID, ProductName
HAVING MIN(QuantityLeft) = 0

-- Not_Available_Ingredients_View
CREATE VIEW Not_Available_Ingredients_View AS
SELECT IngredientID, IngredientName
from IngredientsWarehouse
WHERE QuantityLeft = 0


--Not_Paid_Orders_View
CREATE VIEW Not_Paid_Orders_View AS
SELECT CustomerID, RestaurantEmployeeID, OrderID
FROM Orders
WHERE OrderStatus like '%not_paid%'

--Today_Reservations_View
CREATE VIEW Today_Reservations_View AS
SELECT FromTime, ToTime, Seats, Orders.PaymentDate, CustomerPersonalData.FirstName, CustomerPersonalData.LastName
FROM Reservation
        JOIN Orders ON Orders.OrderID = Reservation.OrderID
        JOIN Customers ON Customers.CustomerID = Orders.CustomerID
        JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
        JOIN CustomerPersonalData ON CustomerPersonalData.PersonID = IndividualCustomers.PersonID 
WHERE FromTime = SELECT CAST( GETDATE() AS Date ) 

--Orders_Pending_For_Confirmation_View
CREATE VIEW Orders_Pending_For_Confirmation_View AS
SELECT CustomerID, RestaurantEmployeeID, OrderID
FROM Orders
WHERE OrderStatus like '%not_confirmed%'

--Takaway_Orders_Pending_For_Pickup_View
CREATE VIEW Takaway_Orders_Pending_For_Pickup_View AS
SELECT CustomerID, RestaurantEmployeeID, OrderID
FROM Orders
WHERE Takeaway.PickupDate is NULL --?TODO: create a takeaway_status?

--Order_Details_View
CREATE VIEW Order_Details_View AS --?TODO: create information what kind of order is this? regular or takeaway?
SELECT  CustomerID,CustomerPersonalData.FirstName, CustomerPersonalData.LastName,OrderID, OrderDetails.Quantity, ProductPrices.UnitPrice, OrderDate, PaymentDate, PaymentMethod.PaymentName, OrderStatus, RestaurantEmployeeID, RestaurantEmployees.FirstName,RestaurantEmployees.LastName, 
FROM Orders
        JOIN OrderDetails ON  OrderDetails.OrderID = Orders.OrderID
        JOIN Products ON Products.ProductID = OrderDetails.ProductID
        JOIN ProductPrices ON ProductPrices.ProductID = Products.ProductID
        JOIN PaymentMethod ON PaymentMethod.PaymentId = Orders.PayVia
        JOIN RestaurantEmployees ON RestaurantEmployees.RestaurantEmployeeID = Orders.RestaurantEmployeeID
        JOIN Customers ON Customers.CustomerID = Orders.CustomerID
        JOIN IndividualCustomers ON IndividualCustomers.CustomerID = Customers.CustomerID
        JOIN CustomerPersonalData ON CustomerPersonalData.PersonID = IndividualCustomers.PersonID 
		
		
--report_of_total_orders_products_price
CREATE VIEW report_of_total_orders_products_price_view AS

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
AS [total number of sold products from the last week],

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

--average_salary_of_a_restaurant_employee_view
CREATE VIEW average_salary_of_a_restaurant_employee_view AS
SELECT RestaurantEmployees.RestaurantEmployeeID ,FirstName,LastName, ROUND(AVG(Salary),2) as [srednie zarobki]
FROM RestaurantEmployees INNER JOIN EmployeesSalary ON RestaurantEmployees.RestaurantEmployeeID = EmployeesSalary.RestaurantEmployeeID
GROUP BY RestaurantEmployees.RestaurantEmployeeID ,FirstName,LastName

