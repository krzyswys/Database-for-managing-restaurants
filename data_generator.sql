--Categories
insert into Categories (CategoryID, CategoryName)
values (1, 'Beverages');

insert into Categories (CategoryID, CategoryName)
values (2, 'Seafood');

insert into Categories (CategoryID, CategoryName)
values (3, 'Pizza');

insert into Categories (CategoryID, CategoryName)
values (4, 'Pasta');

insert into Categories (CategoryID, CategoryName)
values (5, 'Desserts');

insert into Categories (CategoryID, CategoryName)
values (6, 'Pizza');

--IngredientsWarehouse
insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (1, 'Flour', 100);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (2, 'Peperoni', 30);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (3, 'Lemon', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (4, 'Water', 100);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (5, 'Orange', 33);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (6, 'Cheese', 20);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (7, 'Tomato Sauce', 200);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (8, 'Jalapeno Pepper', 10);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (9, 'Beans', 15);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (10, 'Pepperoni', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (11, 'Prawns', 18);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (12, 'Fries', 200);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (13, 'Lobster', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (14, 'Bread', 28);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (15, 'Milk', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (16, 'Octopus', 11);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (17, 'Chicken', 22);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values (18, 'Oyster', 16);

--Products
insert into Products (ProductID, ProductName, CategoryID)
values (1, 'Lemonade', 1);

insert into Products (ProductID, ProductName, CategoryID)
values (2, 'Water', 1);

insert into Products (ProductID, ProductName, CategoryID)
values (3, 'Orange Juice', 1);

insert into Products (ProductID, ProductName, CategoryID)
values (4, 'Pizza Margherita', '3);

insert into Products (ProductID, ProductName, CategoryID)
values (5, 'Pizza Diabolo', 3);

insert into Products (ProductID, ProductName, CategoryID)
values (6, 'Pizza Mexicana', 3);

insert into Products (ProductID, ProductName, CategoryID)
values (7, 'Pizza Pepperoni', 3);

insert into Products (ProductID, ProductName, CategoryID)
values (8, 'Prawns and Fries', 2);

insert into Products (ProductID, ProductName, CategoryID)
values (9, 'Lobster and Bread', 2);

insert into Products (ProductID, ProductName, CategoryID)
values (10, 'Octopus and Fries', 2);

insert into Products (ProductID, ProductName, CategoryID)
values (11, 'Pizza Chicken', 3);

insert into Products (ProductID, ProductName, CategoryID)
values (12, 'Oyster and Bread', 2);

--ProductIngredients
insert into ProductIngredients (ProductID, IngredientID)
values (1, 3);

insert into ProductIngredients (ProductID, IngredientID)
values (1, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (2, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (3, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (3, 5);

insert into ProductIngredients (ProductID, IngredientID)
values (4, 1);

insert into ProductIngredients (ProductID, IngredientID)
values (4, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (4, 6);

insert into ProductIngredients (ProductID, IngredientID)
values (4, 7);

insert into ProductIngredients (ProductID, IngredientID)
values (5, 1);

insert into ProductIngredients (ProductID, IngredientID)
values (5, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (5, 6);

insert into ProductIngredients (ProductID, IngredientID)
values (5, 7);

insert into ProductIngredients (ProductID, IngredientID)
values (5, 8);

insert into ProductIngredients (ProductID, IngredientID)
values (6, 1);

insert into ProductIngredients (ProductID, IngredientID)
values (6, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (6, 6);

insert into ProductIngredients (ProductID, IngredientID)
values (6, 7);

insert into ProductIngredients (ProductID, IngredientID)
values (6, 9);

insert into ProductIngredients (ProductID, IngredientID)
values (7, 1);

insert into ProductIngredients (ProductID, IngredientID)
values (7, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (7, 6);

insert into ProductIngredients (ProductID, IngredientID)
values (7, 7);

insert into ProductIngredients (ProductID, IngredientID)
values (7, 10);

insert into ProductIngredients (ProductID, IngredientID)
values (8, 11);

insert into ProductIngredients (ProductID, IngredientID)
values (8, 12);

insert into ProductIngredients (ProductID, IngredientID)
values (9, 13);

insert into ProductIngredients (ProductID, IngredientID)
values (9, 14);

insert into ProductIngredients (ProductID, IngredientID)
values (10, 12);

insert into ProductIngredients (ProductID, IngredientID)
values (10, 16);

insert into ProductIngredients (ProductID, IngredientID)
values (11, 1);

insert into ProductIngredients (ProductID, IngredientID)
values (11, 4);

insert into ProductIngredients (ProductID, IngredientID)
values (11, 6);

insert into ProductIngredients (ProductID, IngredientID)
values (11, 7);

insert into ProductIngredients (ProductID, IngredientID)
values (11, 17);

insert into ProductIngredients (ProductID, IngredientID)
values (12, 14);

insert into ProductIngredients (ProductID, IngredientID)
values (12, 18);

--ProductPrices
insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (1, '2022-01-02 11:36:14.840', NULL, 30);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (2, '2022-01-02 11:36:14.840', NULL, 40);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (3, '2022-01-02 11:36:14.840', NULL, 35);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (4, '2022-01-02 11:36:14.840', NULL, 50);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (5, '2022-01-02 11:36:14.840', NULL, 10);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (6, '2022-01-02 11:36:14.840', NULL, 70);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (7, '2022-01-02 11:36:14.840', NULL, 45);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (8, '2022-01-02 11:36:14.840', NULL, 15);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (9, '2022-01-02 11:36:14.840', NULL, 25);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (10, '2022-01-02 11:36:14.840', NULL, 55);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (11, '2022-01-02 11:36:14.840', NULL, 40);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values (12, '2022-01-02 11:36:14.840', NULL, 100);

--Menu
insert into Menu (MenuID, MenuName, FromTime, ToTime)
values (1, 'Current', '2022-12-05 11:36:14.840', NULL);

insert into Menu (MenuID, MenuName, FromTime, ToTime)
values (2, 'Previous1', '2022-01-02 11:36:14.840', '2022-12-04 11:36:14.840');

insert into Menu (MenuID, MenuName, FromTime, ToTime)
values (3, 'Previous2', '2021-02-05 11:36:14.840', '2022-01-01 11:36:14.840');


--MenuDetails
insert into MenuDetails (MenuID, ProductID)
values (1, 1);

insert into MenuDetails (MenuID, ProductID)
values (1, 2);

insert into MenuDetails (MenuID, ProductID)
values (1, 3);

insert into MenuDetails (MenuID, ProductID)
values (1, 5);

insert into MenuDetails (MenuID, ProductID)
values (1, 11);

insert into MenuDetails (MenuID, ProductID)
values (1, 12);

insert into MenuDetails (MenuID, ProductID)
values (2, 2);

insert into MenuDetails (MenuID, ProductID)
values (2, 6);

insert into MenuDetails (MenuID, ProductID)
values (2, 7);

insert into MenuDetails (MenuID, ProductID)
values (2, 8);

insert into MenuDetails (MenuID, ProductID)
values (2, 9);

insert into MenuDetails (MenuID, ProductID)
values (2, 10);

insert into MenuDetails (MenuID, ProductID)
values (3, 2);

insert into MenuDetails (MenuID, ProductID)
values (3, 4);

insert into MenuDetails (MenuID, ProductID)
values (3, 6);

insert into MenuDetails (MenuID, ProductID)
values (3, 8);

insert into MenuDetails (MenuID, ProductID)
values (3, 10);

insert into MenuDetails (MenuID, ProductID)
values (3, 12);
