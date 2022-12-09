-- Tables
CREATE TABLE Companies (
    CompanyID char(10) NOT NULL,
    CustomerID char(10)  NOT NULL,
    CompanyName varchar(64)  NOT NULL,
    NIP char(10)  NOT NULL,
    CONSTRAINT CompanyID_Companies_c CHECK (CompanyID LIKE '^\d*$'),
    CONSTRAINT CustomerID_Companies_c CHECK (CustomerID LIKE '^\d*$'),
    CONSTRAINT NIP_Companies_c CHECK (NIP LIKE '^\d*$'),
    CONSTRAINT Companies_pk PRIMARY KEY  (CompanyID)
);

CREATE TABLE CompanyEmployees (
    CompanyEmployeeID char(10)  NOT NULL,
    PersonID char(10)  NOT NULL,
    CompanyID char(10)  NOT NULL,
    CONSTRAINT CompanyEmployeeID_CompanyEmployees_c CHECK (CompanyEmployeeID LIKE '^\d*$'),
    CONSTRAINT PersonID_CompanyEmployees_c CHECK (PersonID LIKE '^\d*$'),
    CONSTRAINT CompanyID_CompanyEmployees_c CHECK (CompanyID LIKE '^\d*$'),
    CONSTRAINT CompanyEmployees_pk PRIMARY KEY  (CompanyEmployeeID)
);

CREATE TABLE CompanyReservationParticipants (
    ReservationID char(10)  NOT NULL,
    CompanyEmployeeID char(10)  NOT NULL,
    CONSTRAINT ReservationID_CompanyReservationParticipants_c CHECK (ReservationID LIKE '^\d*$'),
    CONSTRAINT CompanyEmployeeID_CompanyReservationParticipants_c CHECK (CompanyEmployeeID LIKE '^\d*$'),
    CONSTRAINT CompanyReservationParticipants_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE CustomersPersonalData (
    PersonID char(10)  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    CONSTRAINT PersonID_CustomersPersonalData_c CHECK (PersonID LIKE '^\d*$'),
    CONSTRAINT FirstName_CustomersPersonalData_c CHECK (FirstName LIKE '^[A-Z][a-z]*$'),
    CONSTRAINT LastName_CustomersPersonalData_c CHECK (LastName LIKE '^[A-Z][a-z]*$'),
    CONSTRAINT CustomersPersonalData_pk PRIMARY KEY  (PersonID)
);

CREATE TABLE Customers (
    CustomerID char(10)  NOT NULL,
    Street varchar(64)  NOT NULL,
    Country varchar(64)  NOT NULL,
    City varchar(64)  NOT NULL,
    PostCode varchar(16)  NOT NULL,
    Phone varchar(16)  NOT NULL,
    Email varchar(64)  NOT NULL,
    CONSTRAINT CustomerID_Customers_c CHECK (CustomerID LIKE '^\d*$'),
    CONSTRAINT Country_Customers_c CHECK (Country LIKE '^[A-Z]'),
    CONSTRAINT City_Customers_c CHECK (City LIKE '^[A-Z]'),
    CONSTRAINT Phone_Customers_c CHECK (Phone LIKE '^[0-9]*'),
    CONSTRAINT Email_Customers_c CHECK (Email LIKE '%@%.%'),
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE IndividualCustomers (
    CustomerID char(10)  NOT NULL,
    PersonID char(10)  NOT NULL,
    CONSTRAINT CustomerID_IndividualCustomers_c CHECK (CustomerID LIKE '^\d*$'),
    CONSTRAINT PersonID_IndividualCustomers_c CHECK (PersonID LIKE '^\d*$'),
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE DiningTables (
    DiningTableID char(10)  NOT NULL,
    NumberOfSeats int  NOT NULL,
    CONSTRAINT DiningTableID_DiningTables_c CHECK (DiningTableID LIKE '^\d*$'),
    CONSTRAINT NumberOfSeats_DiningTables_c CHECK (NumberOfSeats > 0),
    CONSTRAINT DiningTables_pk PRIMARY KEY  (DiningTableID)
);

CREATE TABLE Invoices (
    InvoiceID varchar(10)  NOT NULL,
    OrderID varchar(10)  NOT NULL,
    CONSTRAINT Invoices_pk PRIMARY KEY  (InvoiceID)
);

CREATE TABLE Menu (
    MenuID varchar(10)  NOT NULL,
    MenuName varchar(64)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL,
    CONSTRAINT Menu_pk PRIMARY KEY  (MenuID)
);

CREATE TABLE MenuDetails (
    MenuID varchar(10)  NOT NULL,
    ProductID varchar(10)  NOT NULL,
    CONSTRAINT MenuDetails_pk PRIMARY KEY  (MenuID)
);

CREATE TABLE OrderDetails (
    OrderID varchar(10)  NOT NULL,
    ProductID varchar(10)  NOT NULL,
    Quantity int  NOT NULL,
    CONSTRAINT OrderDetails_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE Orders (
    OrderID varchar(10)  NOT NULL,
    CustomerID varchar(10)  NOT NULL,
    OrderDate datetime  NOT NULL,
    PaymentDate datetime  NULL,
    PayVia varchar(1) NULL,
    OrderStatus varchar(32)  NOT NULL,
    RestaurantEmployeeID varchar(10)  NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE PaymentMethod (
    PaymentID varchar(10) NOT NULL,
    PaymentName varchar(32) NOT NULL,
    CONSTRAINT PaymentMethod_pk PRIMARY KEY  (PaymentID)
)

CREATE TABLE ProductIngredients (
    ProductID varchar(10)  NOT NULL,
    IngredientID varchar(10)  NOT NULL,
    CONSTRAINT ProductIngredients_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE IngredientsWarehouse (
    IngredientID varchar(10)  NOT NULL,
    IngredientName varchar(64)  NOT NULL,
    QuantityLeft int  NOT NULL,
    CONSTRAINT IngredientsWarehouse_pk PRIMARY KEY  (IngredientID)
);

CREATE TABLE Products (
    ProductID varchar(10)  NOT NULL,
    ProductName varchar(64)  NOT NULL,
    CategoryID varchar(10)  NOT NULL,
    UnitPrice int  NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE ProductPrices (
    ProductID varchar(10)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL,
    UnitPrice int  NOT NULL,
    CONSTRAINT ProductPrices_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE Categories (
    CategoryID varchar(10)  NOT NULL,
    CategoryName varchar(64)  NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY  (CategoryID)
);

CREATE TABLE Reservation (
    ReservationID varchar(10) NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Seats int  NOT NULL,
    DiningTableID varchar(10)  NOT NULL,
    OrderID varchar(10)  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE RestaurantEmployees (
    RestaurantEmployeeID varchar(10)  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    Occupation varchar(64)  NOT NULL,
    Street varchar(64)  NOT NULL,
    Country varchar(64)  NOT NULL,
    City varchar(64)  NOT NULL,
    PostCode varchar(16)  NOT NULL,
    Phone varchar(16)  NOT NULL,
    Email varchar(64)  NOT NULL,
    CONSTRAINT RestaurantEmployees_pk PRIMARY KEY  (RestaurantEmployeeID)
);

CREATE TABLE EmployeesSalary (
    RestaurantEmployeeID varchar(10)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL,
    Salary int NOT NULL,
    CONSTRAINT EmployeesSalary_pk PRIMARY KEY  (RestaurantEmployeeID)
);

CREATE TABLE Takeaway (
    OrderID varchar(10)  NOT NULL,
    PickupDate datetime  NOT NULL,
    CONSTRAINT Takeaway_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE VariablesData (
    FromTime datetime  NOT NULL,
    ToTime datetime   NULL,
    VariableType varchar(3)  NOT NULL,
    VariableValue int  NOT NULL
);

-- Foreign Keys
ALTER TABLE Products ADD CONSTRAINT Categories_Products
    FOREIGN KEY (CategoryID)
    REFERENCES Categories (CategoryID);

ALTER TABLE Companies ADD CONSTRAINT Companies_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE CompanyEmployees ADD CONSTRAINT CompanyEmployees_Companies
    FOREIGN KEY (CompanyID)
    REFERENCES Companies (CompanyID);

ALTER TABLE EmployeesSalary ADD CONSTRAINT EmployeesSalary_RestaurantEmployee
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES RestaurantEmployees (RestaurantEmployeeID);

ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyEmployees_CompanyReservationParticipants
    FOREIGN KEY (CompanyEmployeeID)
    REFERENCES CompanyEmployees (CompanyEmployeeID);

ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyReservationParticipants_Reservation
    FOREIGN KEY (ReservationID)
    REFERENCES Reservation (ReservationID);

ALTER TABLE CompanyEmployees ADD CONSTRAINT CustomerPersonalData_CompanyEmployees
    FOREIGN KEY (PersonID)
    REFERENCES CustomersPersonalData (PersonID);

ALTER TABLE IndividualCustomers ADD CONSTRAINT CustomerPersonalData_IndividualCustomers
    FOREIGN KEY (PersonID)
    REFERENCES CustomersPersonalData (PersonID);

ALTER TABLE Orders ADD CONSTRAINT Customers_Orders
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE IndividualCustomers ADD CONSTRAINT IndividualCustomers_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

ALTER TABLE ProductIngredients ADD CONSTRAINT IngredientsWarehouse_ProductIngredients
    FOREIGN KEY (IngredientID)
    REFERENCES IngredientsWarehouse (IngredientID);

ALTER TABLE MenuDetails ADD CONSTRAINT MenuDetails_Products
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE MenuDetails ADD CONSTRAINT Menu_MenuDetails
    FOREIGN KEY (MenuID)
    REFERENCES Menu (MenuID);

ALTER TABLE Invoices ADD CONSTRAINT Orders_Invoices
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT Orders_OrderDetails
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE Reservation ADD CONSTRAINT Orders_Reservation
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE Orders ADD CONSTRAINT Orders_RestaurantEmployees
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES RestaurantEmployees (RestaurantEmployeeID);

ALTER TABLE Takeaway ADD CONSTRAINT Orders_Takeaway
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

ALTER TABLE OrderDetails ADD CONSTRAINT Products_OrderDetails
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE ProductIngredients ADD CONSTRAINT Products_ProductIngredients
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE Reservation ADD CONSTRAINT Reservation_DiningTables
    FOREIGN KEY (DiningTableID)
    REFERENCES DiningTables (DiningTableID);

ALTER TABLE ProductPrices ADD CONSTRAINT ProductPrices_Products
    FOREIGN KEY (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE Orders ADD CONSTRAINT Orders_PaymentMethod
    FOREIGN KEY (PayVia)
    REFERENCES PaymentMethod (PaymentID);
