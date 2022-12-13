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
values ('0000000008', 'Prawns', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000009', 'Lobster', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000010', 'Octopus', '0000000002');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000011', 'Pizza Chicken', '0000000003');

insert into Products (ProductID, ProductName, CategoryID)
values ('0000000012', 'Oyster', '0000000002');

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
