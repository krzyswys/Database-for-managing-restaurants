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
