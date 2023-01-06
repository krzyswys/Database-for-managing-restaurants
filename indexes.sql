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
