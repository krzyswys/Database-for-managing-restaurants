INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
	(1, 'Beverages'),
	(2, 'Seafood'),
	(3, 'Pizza'),
	(4, 'Pasta'),
	(5, 'Desserts'),
	(6, 'Pizza');

--IngredientsWarehouse
INSERT INTO IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
VALUES 
	(1, 'Flour', 100),
	(2, 'Peperoni', 30),
	(3, 'Lemon', 0),
	(4, 'Water', 100),
	(5, 'Orange', 33),
	(6, 'Cheese', 20),
	(7, 'Tomato Sauce', 200),
	(8, 'Jalapeno Pepper', 10),
	(9, 'Beans', 15),
	(10, 'Pepperoni', 0),
	(11, 'Prawns', 18),
	(12, 'Fries', 200),
	(13, 'Lobster', 0),
	(14, 'Bread', 28),
	(15, 'Milk', 0),
	(16, 'Octopus', 11),
	(17, 'Chicken', 22),
	(18, 'Oyster', 16);

--Products
INSERT INTO Products (ProductID, ProductName, CategoryID)
VALUES 
	(1, 'Lemonade', 1),
	(2, 'Water', 1),
	(3, 'Orange Juice', 1),
	(4, 'Pizza Margherita', 3),
	(5, 'Pizza Diabolo', 3),
	(6, 'Pizza Mexicana', 3),
	(7, 'Pizza Pepperoni', 3),
	(8, 'Prawns and Fries', 2),
	(9, 'Lobster and Bread', 2),
	(10, 'Octopus and Fries', 2),
	(11, 'Pizza Chicken', 3),
	(12, 'Oyster and Bread', 2);

--ProductIngredients
INSERT INTO ProductIngredients (ProductID, IngredientID)
VALUES
	(1, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(3, 5),
	(4, 1),
	(4, 4),
	(4, 6),
	(4, 7),
	(5, 1),
	(5, 4),
	(5, 6),
	(5, 7),
	(5, 8),
	(6, 1),
	(6, 4),
	(6, 6),
	(6, 7),
	(6, 9),
	(7, 1),
	(7, 4),
	(7, 6),
	(7, 7),
	(7, 10),
	(8, 11),
	(8, 12),
	(9, 13),
	(9, 14),
	(10, 12),
	(10, 16),
	(11, 1),
	(11, 4),
	(11, 6),
	(11, 7),
	(11, 17),
	(12, 14),
	(12, 18);

--ProductPrices
INSERT INTO ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
VALUES 
	(1, '2022-01-02 11:36:14.840', NULL, 30),
	(2, '2022-01-02 11:36:14.840', NULL, 40),
	(3, '2022-01-02 11:36:14.840', NULL, 35),
	(4, '2022-01-02 11:36:14.840', NULL, 50),
	(5, '2022-01-02 11:36:14.840', NULL, 10),
	(6, '2022-01-02 11:36:14.840', NULL, 70),
	(7, '2022-01-02 11:36:14.840', NULL, 45),
	(8, '2022-01-02 11:36:14.840', NULL, 15),
	(9, '2022-01-02 11:36:14.840', NULL, 25),
	(10, '2022-01-02 11:36:14.840', NULL, 55),
	(11, '2022-01-02 11:36:14.840', NULL, 40),
	(12, '2022-01-02 11:36:14.840', NULL, 100);

--Menu
INSERT INTO Menu (MenuID, MenuName, FromTime, ToTime)
VALUES 
	(1, 'Current', '2023-02-25 11:36:14.840', NULL);
INSERT INTO Menu (MenuID, MenuName, FromTime, ToTime)
VALUES 
	(2, 'Previous1', '2023-03-02 11:36:14.840', '2023-12-04 11:36:14.840');
INSERT INTO Menu (MenuID, MenuName, FromTime, ToTime)
VALUES 
	(3, 'Previous2', '2023-05-11 11:36:14.840', '2023-09-11 11:36:14.840');


--MenuDetails
INSERT INTO MenuDetails (MenuID, ProductID)
VALUES 
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 5),
	(1, 11),
	(1, 12),
	(2, 2),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10),
	(3, 2),
	(3, 4),
	(3, 6),
	(3, 8),
	(3, 10),
	(3, 12);

--RestaurantEmployees
INSERT INTO RestaurantEmployees (RestaurantEmployeeID, FirstName, LastName, Occupation, Street, Country, City, PostCode, Phone, Email)
VALUES 
	(1, 'Jan', 'Nowak', 'waiter', 'Kawiory 18', 'Poland', 'Kraków', '30-072', '123123123', 'jan_nowak@mail.com'),
	(2, 'Julia', 'Kowalska', 'chef', 'Rostafińskiego 11', 'Poland', 'Kraków', '30-012', '111111111', 'julia_kowalska@mail.com'),
	(3, 'Anna', 'Madej', 'waiter', 'Wojska Polskiego 303', 'Poland', 'Kraków', '30-050', '222222222', 'anna_madej@mail.com'),
	(4, 'Michał', 'Król', 'cleaner', 'Kawiory 49', 'Poland', 'Kraków', '30-072', '212212212', 'michal_krol@mail.com');

--EmployeesSalary
INSERT INTO EmployeesSalary (RestaurantEmployeeID, FromTime, ToTime, Salary)
VALUES 
	(1, '2022-01-02 11:36:14.840', NULL, 4000),
	(2, '2022-05-05 11:36:14.840', NULL, 6000),
	(3, '2022-12-15 11:36:14.840', NULL, 4200),
	(4, '2022-08-08 11:36:14.840', NULL, 3500);

-- PaymentMethod
INSERT INTO PaymentMethod (PaymentID, PaymentName)
VALUES
	(1, 'cash'),
	(2, 'card'),
	(3, 'blik'),
	(4, 'bank transfer'),
	(5, 'PayPal');

-- Customers
INSERT INTO Customers (CustomerID, Street, Country, City, PostCode, Phone, Email)
VALUES
	-- Individual
	(1, 'Kawiory 15', 'Poland', 'Kraków', '30-070', '123123123', 'jan_magiera@mail.com'),
	(2, 'Czarnowiejska 119', 'Poland', 'Kraków', '30-072', '999999999', 'maja_kowal@mail.com'),
	(3, 'Reymonta 1', 'Poland', 'Kraków', '30-071', '333333333', 'adrian_nowak@mail.com'),
	(4, 'Złota 44', 'Poland', 'Kraków', '38-073', '112112112', 'julia_kowalska@mail.com'),
	(5, 'Czarna 9', 'Poland', 'Kraków', '38-072', '555555555', 'wiktor_bialy@mail.com'),
	
	-- Bussiness
	(6, 'Kawiory 15', 'Poland', 'Kraków', '30-070', '123123123', 'bussiness1@mail.com'),
	(7, 'Czarnowiejska 119', 'Poland', 'Kraków', '30-072', '999999999', 'bussiness2@mail.com'),
	(8, 'Reymonta 1', 'Poland', 'Kraków', '30-071', '333333333', 'bussiness3@mail.com'),
	(9, 'Złota 44', 'Poland', 'Kraków', '38-073', '112112112', 'bussiness4@mail.com'),
	(10, 'Czarna 9', 'Poland', 'Kraków', '38-072', '555555555', 'bussiness5@mail.com');

-- CustomersPersonalData
INSERT INTO CustomersPersonalData (PersonID, FirstName, LastName)
VALUES 
	(1, 'Jan', 'Magiera'),
	(2, 'Maja', 'Kowal'),
	(3, 'Adrian', 'Nowak'),
	(4, 'Julia', 'Kowalska'),
	(5, 'Wiktor', 'Bialy'),
	(6, 'Jan', 'Nowak'),
	(7, 'Kamil', 'Kowalski'),
	(8, 'Dominika', 'Zawisza'),
	(9, 'Kamila', 'Dąb'),
	(10, 'Michał', 'Baron'),
	(11, 'Magdalena', 'Konieczna'),
	(12, 'Bartosz', 'Kolanko'),
	(13, 'Julian', 'Adamski'),
	(14, 'Karolina', 'Klara'),
	(15, 'Stanisław', 'Seweryn')

-- CustomersPersonalData
INSERT INTO IndividualCustomers(CustomerID, PersonID)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

-- Companies
INSERT INTO Companies(CompanyID, CustomerID, CompanyName, NIP)
VALUES
	(1, 6, 'Bussiness1', '1111111111'),
	(2, 7, 'Bussiness2', '2222222222'),
	(3, 8, 'Bussiness3', '3333333333'),
	(4, 9, 'Bussiness4', '4444444444'),
	(5, 10, 'Bussiness5', '5555555555');

-- CompanyEmployees
INSERT INTO CompanyEmployees(CompanyEmployeeID, PersonID, CompanyID)
VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 2),
	(5, 5, 2),
	(6, 6, 2),
	(7, 7, 2),
	(8, 8, 3),
	(9, 9, 3),
	(10, 10, 4),
	(11, 11, 4),
	(12, 12, 4),
	(13, 13, 5),
	(14, 14, 5),
	(15, 15, 5);

-- Orders
INSERT INTO Orders(OrderID, CustomerID, OrderDate, CollectDate, PaymentDate, PayVia, OrderStatus, RestaurantEmployeeID, DiscountPercent)
VALUES
	(1, 1, '2023-01-08 11:36:14.840', NULL, NULL, 2, 'awaiting payment', 1, 3);
INSERT INTO Orders(OrderID, CustomerID, OrderDate, CollectDate, PaymentDate, PayVia, OrderStatus, RestaurantEmployeeID)
VALUES
	(2, 2, '2023-01-06 11:36:14.840', '2023-01-20 11:36:14.840', '2023-01-06 11:38:14.840', 1, 'completed', 3, 0);
INSERT INTO Orders(OrderID, CustomerID, OrderDate, CollectDate, PaymentDate, PayVia, OrderStatus, RestaurantEmployeeID)
VALUES
	(3, 7, '2023-01-07 11:36:14.840', NULL, '2023-01-07 11:38:14.840', 2, 'in preparation', 1, 5);
INSERT INTO Orders(OrderID, CustomerID, OrderDate, CollectDate, PaymentDate, PayVia, OrderStatus, RestaurantEmployeeID)
VALUES
	(4, 6, '2023-01-06 11:36:14.840', '2023-01-07 11:36:14.840', '2023-01-06 11:38:14.840', 3, 'completed', 1, 2);
INSERT INTO Orders(OrderID, CustomerID, OrderDate, CollectDate, PaymentDate, PayVia, OrderStatus, RestaurantEmployeeID)
VALUES
	(5, 1, '2023-01-06 11:36:14.840', NULL, '2023-01-06 11:38:14.840', 2, 'waiting for pickup', 1, 0);

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(1, 1, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(1, 4, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(2, 2, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(2, 5, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(2, 9, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(3, 1, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(3, 4, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(4, 2, 2);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(4, 3, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(5, 11, 1);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
	(5, 1, 3);

-- Invoices
INSERT INTO Invoices (InvoiceID, OrderID)
VALUES 
	(1, 3),
	(2, 4);

-- Takeaway
INSERT INTO Takeaway (OrderID, PickupDate)
VALUES 
	(1, '2023-01-06 12:38:14.840');

-- DiningTable
INSERT INTO DiningTables (DiningTableID, NumberOfSeats)
VALUES 
	(1, 5),
	(2, 5),
	(3, 15),
	(4, 10),
	(5, 10),
	(6, 8),
	(7, 10),
	(8, 8),
	(9, 2),
	(10, 2),
	(11, 3),
	(12, 3);

-- VariablesData
INSERT INTO VariablesData (FromTime, ToTime, VariableType, VariableValue)
VALUES ('2019-01-07 11:30:00.000', NULL, 'WZ', 50),
	   ('2019-01-07 11:30:00.000', NULL, 'WZ', 5),
	   ('2019-01-07 11:30:00.000', NULL, 'Z1', 10),
	   ('2019-01-07 11:30:00.000', NULL, 'K1', 30),
	   ('2019-01-07 11:30:00.000', NULL, 'R1%', 3),
	   ('2019-01-07 11:30:00.000', NULL, 'K2', 1000),
	   ('2019-01-07 11:30:00.000', NULL, 'R2%', 5),
	   ('2019-01-07 11:30:00.000', NULL, 'D1', 7);

-- Reservation
INSERT INTO Reservation (ReservationID, FromTime, ToTime, Seats, DiningTableID, OrderID)
VALUES (1, '2023-01-07 11:30:00.000', '2023-01-07 13:30:00.000', 4, 2, 3)

-- CompanyReservationParticipants
INSERT INTO CompanyReservationParticipants (ReservationID, CompanyEmployeeID)
VALUES (1, 4),
	   (1, 5),
	   (1, 6),
	   (1, 7);
