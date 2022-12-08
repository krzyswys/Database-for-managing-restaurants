CREATE TABLE Categories (
    CategoryID int  NOT NULL,
    CategoryName varchar(64)  NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY  (CategoryID)
);

CREATE TABLE Companies (
    CompanyID int  NOT NULL,
    CustomerID int  NOT NULL,
    CompanyName varchar(64)  NOT NULL,
    NIP smallint  NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY  (CompanyID)
);

CREATE TABLE CompanyEmployees (
    CompanyEmployeeID int  NOT NULL,
    PersonID int  NOT NULL,
    CompanyID int  NOT NULL,
    CONSTRAINT CompanyEmployees_pk PRIMARY KEY  (CompanyEmployeeID)
);

CREATE TABLE CompanyReservationParticipants (
    ReservationID int  NOT NULL,
    CompanyEmployeeID int  NOT NULL,
    CONSTRAINT CompanyReservationParticipants_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE CustomerPersonalData (
    PersonID int  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    CONSTRAINT CustomerPersonalData_pk PRIMARY KEY  (PersonID)
);

CREATE TABLE Customers (
    CustomerID int  NOT NULL,
    Street varchar(64)  NOT NULL,
    Country varchar(64)  NOT NULL,
    City varchar(64)  NOT NULL,
    PostCode varchar(16)  NOT NULL,
    Phone varchar(16)  NOT NULL,
    Email varchar(64)  NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE DiningTables (
    DiningTableID int  NOT NULL,
    NumberOfSeats int  NOT NULL,
    CONSTRAINT DiningTables_pk PRIMARY KEY  (DiningTableID)
);

CREATE TABLE IndividualCustomers (
    CustomerID int  NOT NULL,
    PersonID int  NOT NULL,
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE IngredienstWarehouse (
    IngredientID int  NOT NULL,
    IngredientName varchar(64)  NOT NULL,
    QuantityLeft int  NOT NULL,
    CONSTRAINT IngredienstWarehouse_pk PRIMARY KEY  (IngredientID)
);

CREATE TABLE Invoices (
    InvoiceID int  NOT NULL,
    OrderID int  NOT NULL,
    CONSTRAINT InvoiceId PRIMARY KEY  (InvoiceID)
);

CREATE TABLE Menu (
    MenuID int  NOT NULL,
    MenuName varchar(64)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    CONSTRAINT Menu_pk PRIMARY KEY  (MenuID)
);

CREATE TABLE MenuDetails (
    MenuID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT MenuDetails_pk PRIMARY KEY  (MenuID)
);

CREATE TABLE OrderDetails (
    OrderID int  NOT NULL,
    ProductID int  NOT NULL,
    Quantity int  NOT NULL,
    CONSTRAINT OrderID PRIMARY KEY  (OrderID)
);

CREATE TABLE Orders (
    OrderID int  NOT NULL,
    CustomerID int  NOT NULL,
    OrderDate datetime  NOT NULL,
    PaymentDate datetime  NULL,
    OrderStatus varchar(12)  NOT NULL,
    RestaurantEmployeeID int  NOT NULL,
    OrderDetails_OrderID int  NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE ProductIngriedients (
    ProductID int  NOT NULL,
    IngredientID int  NOT NULL,
    CONSTRAINT ProductIngriedients_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE Products (
    ProductID int  NOT NULL,
    ProductName varchar(64)  NOT NULL,
    CategoryID int  NOT NULL,
    UnitPrice int  NOT NULL,
    CONSTRAINT ProductID PRIMARY KEY  (ProductID)
);

CREATE TABLE Reservation (
    ReservationID int  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Seats int  NOT NULL,
    DiningTableID int  NOT NULL,
    OrderID int  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE RestauransEmployees (
    RestaurantEmployeeID int  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    Salary varchar(64)  NOT NULL,
    AdressDetails varchar(64)  NOT NULL,
    Occupation varchar(64)  NOT NULL,
    CONSTRAINT RestauransEmployees_pk PRIMARY KEY  (RestaurantEmployeeID)
);

CREATE TABLE TakeAway (
    OrderID int  NOT NULL,
    PickupDate datetime  NOT NULL,
    CONSTRAINT TakeAway_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE VariablesData (
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Type varchar(3)  NOT NULL,
    Value int  NOT NULL
);

ALTER TABLE Products ADD CONSTRAINT Categories_Products
    FOREIGN KEY (CategoryID)
    REFERENCES Categories (CategoryID);

ALTER TABLE Companies ADD CONSTRAINT Companies_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE CompanyEmployees ADD CONSTRAINT CompanyEmployees_Companies
    FOREIGN KEY (CompanyID)
    REFERENCES Companies (CompanyID);

ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyEmployees_CompanyReservationParticipants
    FOREIGN KEY (CompanyEmployeeID)
    REFERENCES CompanyEmployees (CompanyEmployeeID);

ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyReservationParticipants_Reservation
    FOREIGN KEY (ReservationID)
    REFERENCES Reservation (ReservationID);

ALTER TABLE CompanyEmployees ADD CONSTRAINT CustomerPersonalData_CompanyEmployees
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

ALTER TABLE IndividualCustomers ADD CONSTRAINT CustomerPersonalData_IndividualCustomers
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

ALTER TABLE Orders ADD CONSTRAINT Customers_Orders
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE IndividualCustomers ADD CONSTRAINT IndividualCustomers_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE ProductIngriedients ADD CONSTRAINT IngredienstWarehouse_ProductIngriedients
    FOREIGN KEY (IngredientID)
    REFERENCES IngredienstWarehouse (IngredientID);

ALTER TABLE MenuDetails ADD CONSTRAINT MenuDetails_Products
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE Menu ADD CONSTRAINT Menu_MenuDetails
    FOREIGN KEY (MenuID)
    REFERENCES MenuDetails (MenuID);

ALTER TABLE Invoices ADD CONSTRAINT Orders_Invoices
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT Orders_OrderDetails
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE Orders ADD CONSTRAINT Orders_Reservation
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES Reservation (ReservationID);

ALTER TABLE Orders ADD CONSTRAINT Orders_RestauransEmployees
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES RestauransEmployees (RestaurantEmployeeID);

ALTER TABLE TakeAway ADD CONSTRAINT Orders_TakeAway
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT Products_OrderDetails
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE Products ADD CONSTRAINT Products_ProductIngriedients
    FOREIGN KEY (ProductID)
    REFERENCES ProductIngriedients (ProductID);

ALTER TABLE Reservation ADD CONSTRAINT Reservation_DiningTables
    FOREIGN KEY (DiningTableID)
    REFERENCES DiningTables (DiningTableID);
