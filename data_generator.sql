--Categories
insert into Categories (CategoryID, CategoryName)
values ('0000000001', 'Beverages');

insert into Categories (CategoryID, CategoryName)
values ('0000000002', 'Seafood');

insert into Categories (CategoryID, CategoryName)
values ('0000000003', 'Pizza');

insert into Categories (CategoryID, CategoryName)
values ('0000000004', 'Pasta');

insert into Categories (CategoryID, CategoryName)
values ('0000000005', 'Desserts');

insert into Categories (CategoryID, CategoryName)
values ('0000000006', 'Pizza');

--IngredientsWarehouse
insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000001', 'Flour', 100);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000002', 'Peperoni', 30);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000003', 'Lemon', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000004', 'Water', 100);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000005', 'Orange', 33);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000006', 'Cheese', 20);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000007', 'Tomato Sauce', 200);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000008', 'Jalapeno Pepper', 10);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000009', 'Beans', 15);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000010', 'Pepperoni', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000011', 'Prawns', 18);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000012', 'Fries', 200);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000013', 'Lobster', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000014', 'Bread', 28);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000015', 'Pepperoni', 0);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000016', 'Octopus', 11);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000017', 'Chicken', 22);

insert into IngredientsWarehouse (IngredientID, IngredientName, QuantityLeft)
values ('0000000018', 'Oyster', 16);

--Products
insert into Products (ProductID, ProductName, CategoryID)
values ('0000000001', 'Lemonade', '0000000001');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000002', 'Water', '0000000001');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000003', 'Orange Juice', '0000000001');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000004', 'Pizza Margherita', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000005', 'Pizza Diabolo', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000006', 'Pizza Mexicana', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000007', 'Pizza Pepperoni', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000008', 'Prawns and Fries', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000009', 'Lobster and Bread', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000010', 'Octopus and Fries', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000011', 'Pizza Chicken', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000012', 'Oyster and Bread', '0000000002');

--ProductIngredients
insert into ProductIngredients (ProductID, IngredientID)
values ('0000000001', '0000000003');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000001', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000002', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000003', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000003', '0000000005');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000004', '0000000001');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000004', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000004', '0000000006');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000004', '0000000007');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000005', '0000000001');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000005', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000005', '0000000006');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000005', '0000000007');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000005', '0000000008');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000006', '0000000001');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000006', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000006', '0000000006');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000006', '0000000007');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000006', '0000000009');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000007', '0000000001');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000007', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000007', '0000000006');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000007', '0000000007');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000007', '0000000010');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000008', '0000000011');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000008', '0000000012');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000009', '0000000013');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000009', '0000000014');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000010', '0000000012');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000010', '0000000016');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000011', '0000000001');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000011', '0000000004');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000011', '0000000006');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000011', '0000000007');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000011', '0000000017');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000012', '0000000014');

insert into ProductIngredients (ProductID, IngredientID)
values ('0000000012', '0000000018');

--ProductPrices
insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000001', '2022-01-02 11:36:14.840', NULL, 30);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000002', '2022-01-02 11:36:14.840', NULL, 40);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000003', '2022-01-02 11:36:14.840', NULL, 35);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000004', '2022-01-02 11:36:14.840', NULL, 50);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000005', '2022-01-02 11:36:14.840', NULL, 10);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000006', '2022-01-02 11:36:14.840', NULL, 70);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000007', '2022-01-02 11:36:14.840', NULL, 45);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000008', '2022-01-02 11:36:14.840', NULL, 15);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000009', '2022-01-02 11:36:14.840', NULL, 25);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000010', '2022-01-02 11:36:14.840', NULL, 55);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000011', '2022-01-02 11:36:14.840', NULL, 40);

insert into ProductPrices (ProductID, FromTime, ToTime, UnitPrice)
values ('0000000012', '2022-01-02 11:36:14.840', NULL, 100);

--Menu
insert into Menu (MenuID, MenuName, FromTime, ToTime)
values ('0000000001', 'Current', '2022-12-05 11:36:14.840', NULL);

insert into Menu (MenuID, MenuName, FromTime, ToTime)
values ('0000000002', 'Previous1', '2022-01-02 11:36:14.840', '2022-12-04 11:36:14.840');

insert into Menu (MenuID, MenuName, FromTime, ToTime)
values ('0000000003', 'Previous2', '2021-02-05 11:36:14.840', '2022-01-01 11:36:14.840');


--MenuDetails
insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000001');

insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000002');

insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000003');

insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000005');

insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000011');

insert into MenuDetails (MenuID, ProductID)
values ('0000000001', '0000000012');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000002');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000006');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000007');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000008');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000009');

insert into MenuDetails (MenuID, ProductID)
values ('0000000002', '0000000010');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000002');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000004');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000006');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000008');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000010');

insert into MenuDetails (MenuID, ProductID)
values ('0000000003', '0000000012');
