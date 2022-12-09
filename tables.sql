-- Tables
CREATE TABLE Companies (
    CompanyID varchar(10) NOT NULL,
    CustomerID varchar(10)  NOT NULL,
    CompanyName varchar(64)  NOT NULL,
    NIP varchar(10)  NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY  (CompanyID)
);

CREATE TABLE CompanyEmployees (
    CompanyEmployeeID varchar(10)  NOT NULL,
    PersonID varchar(10)  NOT NULL,
    CompanyID varchar(10)  NOT NULL,
    CONSTRAINT CompanyEmployees_pk PRIMARY KEY  (CompanyEmployeeID)
);

CREATE TABLE CompanyReservationParticipants (
    ReservationID varchar(10)  NOT NULL,
    CompanyEmployeeID varchar(10)  NOT NULL,
    CONSTRAINT CompanyReservationParticipants_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE CustomersPersonalData (
    PersonID varchar(10)  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    CONSTRAINT CustomersPersonalData_pk PRIMARY KEY  (PersonID)
);

CREATE TABLE Customers (
    CustomerID varchar(10)  NOT NULL,
    Street varchar(64)  NOT NULL,
    Country varchar(64)  NOT NULL,
    City varchar(64)  NOT NULL,
    PostCode varchar(16)  NOT NULL,
    Phone varchar(16)  NOT NULL,
    Email varchar(64)  NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE IndividualCustomers (
    CustomerID varchar(10)  NOT NULL,
    PersonID varchar(10)  NOT NULL,
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY  (CustomerID)
);

CREATE TABLE DiningTables (
    DiningTableID varchar(10)  NOT NULL,
    NumberOfSeats int  NOT NULL,
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
    ProductID char(10)  NOT NULL,
    ProductName varchar(64)  NOT NULL,
    CategoryID char(10)  NOT NULL,
    UnitPrice int  NOT NULL DEFAULT 0,
	CONSTRAINT properPrices CHECK ((UnitPrice >= 0)),
	CONSTRAINT ProductID_Products CHECK (Products.ProductID LIKE '^\d*$'),
    CONSTRAINT Products_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE ProductPrices (
    ProductID char(10)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL DEFAULT GETDATE(),
    UnitPrice int  NOT NULL DEFAULT 0,
	CONSTRAINT ProductID_ProductPrices CHECK (ProductPrices.ProductID LIKE '^\d*$'),
	CONSTRAINT properProductPricesDate CHECK (FromTime < ISNULL(ToTime, GETDATE())),
    CONSTRAINT ProductPrices_pk PRIMARY KEY  (ProductID)
);

CREATE TABLE Categories (
    CategoryID char(10)  NOT NULL,
    CategoryName varchar(64)  NOT NULL,
	CONSTRAINT CategoryID_Categories CHECK (Categories.CategoryID LIKE '^\d*$'),
    CONSTRAINT Categories_pk PRIMARY KEY  (CategoryID)
);

CREATE TABLE Reservation (
    ReservationID char(10) NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Seats int  NOT NULL,
    DiningTableID char(10)  NOT NULL,
    OrderID char(10)  NOT NULL,
	CONSTRAINT ReservationID_Reservation CHECK (Reservation.ReservationID LIKE '^\d*$'),
	CONSTRAINT maxSeats_Reservation CHECK (Seats <= 20 AND Seats > 0),
	CONSTRAINT properReservationDate_Reservation CHECK (FromTime < ToTime),
    CONSTRAINT Reservation_pk PRIMARY KEY  (ReservationID)
);

CREATE TABLE RestaurantEmployees (
    RestaurantEmployeeID char(10)  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    Occupation varchar(64)  NOT NULL,
    Street varchar(64)  NOT NULL,
    Country varchar(64)  NOT NULL,
    City varchar(64)  NOT NULL,
    PostCode varchar(16)  NOT NULL,
    Phone char(9)  NOT NULL,
    Email varchar(64)  NOT NULL,
	CONSTRAINT RestaurantEmployeeID_RestaurantEmployees CHECK (RestaurantEmployees.RestaurantEmployeeID LIKE '^\d*$'),
	CONSTRAINT cityName_RestaurantEmployees CHECK ((City LIKE '^[A-Z]')),
	CONSTRAINT countryName_RestaurantEmployees CHECK ((Country LIKE '^[A-Z]')),
	CONSTRAINT nameValidation_RestaurantEmployees CHECK ((FirstName LIKE '^[A-Z][a-z]*$') AND (LastName LIKE '^[A-Z][a-z]*$')),
	CONSTRAINT phoneValidation_RestaurantEmployees CHECK (Phone LIKE '^[0-9]*$'),
	CONSTRAINT emailValidation_RestaurantEmployees CHECK ((Email LIKE '%@%.%')),
    CONSTRAINT RestaurantEmployees_pk PRIMARY KEY  (RestaurantEmployeeID)
);

CREATE TABLE EmployeesSalary (
    RestaurantEmployeeID varchar(10)  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL,
    Salary int NOT NULL,
	CONSTRAINT RestaurantEmployeeID_EmployeesSalary CHECK (EmployeesSalary.RestaurantEmployeeID LIKE '^\d*$'),
	CONSTRAINT salaryConstraint_EmployeesSalary CHECK (Salary >= 0),
	CONSTRAINT properReservationDate_EmployeesSalary CHECK (FromTime < ISNULL(ToTime, GETDATE())),
    CONSTRAINT EmployeesSalary_pk_EmployeesSalary PRIMARY KEY  (RestaurantEmployeeID)
);

CREATE TABLE Takeaway (
    OrderID char(10)  NOT NULL,
    PickupDate datetime NULL,
	CONSTRAINT orderID_Takeaway CHECK (Takeaway.OrderID LIKE '^\d*$'),
	
    CONSTRAINT Takeaway_pk PRIMARY KEY  (OrderID)
);

CREATE TABLE VariablesData (
    FromTime datetime  NOT NULL,
    ToTime datetime  NULL,
    VariableType varchar(3)  NOT NULL,
    VariableValue int  NOT NULL
	CONSTRAINT validationDate_VariablesData CHECK (FromTime < ISNULL(ToTime, GETDATE())),
	CONSTRAINT variableValueAboveZero_VariablesData CHECK (VariableValue >= 0)
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
