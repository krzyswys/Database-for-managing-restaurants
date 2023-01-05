--Categories
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
	(1, 'Current', '2022-12-05 11:36:14.840', NULL),
	(2, 'Previous1', '2022-01-02 11:36:14.840', '2022-12-04 11:36:14.840'),
	(3, 'Previous2', '2021-02-05 11:36:14.840', '2022-01-01 11:36:14.840');


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
