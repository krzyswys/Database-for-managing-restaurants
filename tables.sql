-- tables
-- Table: Companies
CREATE TABLE Companies (
    CompanyID int  NOT NULL,
    CustomerID int  NOT NULL,
    CompanyName varchar(64)  NOT NULL,
    NIP smallint  NOT NULL,
    CONSTRAINT Companies_pk PRIMARY KEY  (CompanyID)
);

-- Table: CompanyEmployees
CREATE TABLE CompanyEmployees (
    CompanyEmployeeID int  NOT NULL,
    PersonID int  NOT NULL,
    CompanyID int  NOT NULL,
    CONSTRAINT CompanyEmployees_pk PRIMARY KEY  (CompanyEmployeeID)
);

-- Table: CompanyReservationParticipants
CREATE TABLE CompanyReservationParticipants (
    ReservationID int  NOT NULL,
    CompanyEmployeeID int  NOT NULL,
    CONSTRAINT CompanyReservationParticipants_pk PRIMARY KEY  (ReservationID)
);

-- Table: CustomerPersonalData
CREATE TABLE CustomerPersonalData (
    PersonID int  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    CONSTRAINT CustomerPersonalData_pk PRIMARY KEY  (PersonID)
);

-- Table: Customers
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

-- Table: DiningTables
CREATE TABLE DiningTables (
    DiningTableID int  NOT NULL,
    NumberOfSeats int  NOT NULL,
    CONSTRAINT DiningTables_pk PRIMARY KEY  (DiningTableID)
);

-- Table: IndividualCustomers
CREATE TABLE IndividualCustomers (
    CustomerID int  NOT NULL,
    PersonID int  NOT NULL,
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY  (CustomerID)
);

-- Table: Invoices
CREATE TABLE Invoices (
    InvoiceID int  NOT NULL,
    OrderID int  NOT NULL,
    CONSTRAINT InvoiceId PRIMARY KEY  (InvoiceID)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID int  NOT NULL,
    CustomerID int  NOT NULL,
    OrderDate datetime  NOT NULL,
    PaymentDate datetime  NULL,
    OrderStatus varchar(12)  NOT NULL,
    RestaurantEmployeeID int  NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY  (OrderID)
);

-- Table: Reservation
CREATE TABLE Reservation (
    ReservationID int  NOT NULL,
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Seats int  NOT NULL,
    DiningTableID int  NOT NULL,
    OrderID int  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY  (ReservationID)
);

-- Table: RestauransEmployees
CREATE TABLE RestauransEmployees (
    RestaurantEmployeeID int  NOT NULL,
    FirstName varchar(64)  NOT NULL,
    LastName varchar(64)  NOT NULL,
    Salary varchar(64)  NOT NULL,
    AdressDetails varchar(64)  NOT NULL,
    Occupation varchar(64)  NOT NULL,
    CONSTRAINT RestauransEmployees_pk PRIMARY KEY  (RestaurantEmployeeID)
);

-- Table: TakeAway
CREATE TABLE TakeAway (
    OrderID int  NOT NULL,
    PickupDate datetime  NOT NULL,
    CONSTRAINT TakeAway_pk PRIMARY KEY  (OrderID)
);

-- Table: VariablesData
CREATE TABLE VariablesData (
    FromTime datetime  NOT NULL,
    ToTime datetime  NOT NULL,
    Type varchar(3)  NOT NULL,
    Value int  NOT NULL
);

-- foreign keys
-- Reference: Companies_Customers (table: Companies)
ALTER TABLE Companies ADD CONSTRAINT Companies_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: CompanyEmployees_Companies (table: CompanyEmployees)
ALTER TABLE CompanyEmployees ADD CONSTRAINT CompanyEmployees_Companies
    FOREIGN KEY (CompanyID)
    REFERENCES Companies (CompanyID);

-- Reference: CompanyEmployees_CompanyReservationParticipants (table: CompanyReservationParticipants)
ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyEmployees_CompanyReservationParticipants
    FOREIGN KEY (CompanyEmployeeID)
    REFERENCES CompanyEmployees (CompanyEmployeeID);

-- Reference: CompanyReservationParticipants_Reservation (table: CompanyReservationParticipants)
ALTER TABLE CompanyReservationParticipants ADD CONSTRAINT CompanyReservationParticipants_Reservation
    FOREIGN KEY (ReservationID)
    REFERENCES Reservation (ReservationID);

-- Reference: CustomerPersonalData_CompanyEmployees (table: CompanyEmployees)
ALTER TABLE CompanyEmployees ADD CONSTRAINT CustomerPersonalData_CompanyEmployees
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

-- Reference: CustomerPersonalData_IndividualCustomers (table: IndividualCustomers)
ALTER TABLE IndividualCustomers ADD CONSTRAINT CustomerPersonalData_IndividualCustomers
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

-- Reference: Customers_Orders (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Customers_Orders
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: IndividualCustomers_Customers (table: IndividualCustomers)
ALTER TABLE IndividualCustomers ADD CONSTRAINT IndividualCustomers_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: Orders_Invoices (table: Invoices)
ALTER TABLE Invoices ADD CONSTRAINT Orders_Invoices
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

-- Reference: Orders_Reservation (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_Reservation
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES Reservation (ReservationID);

-- Reference: Orders_RestauransEmployees (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_RestauransEmployees
    FOREIGN KEY (RestaurantEmployeeID)
    REFERENCES RestauransEmployees (RestaurantEmployeeID);

-- Reference: Orders_TakeAway (table: TakeAway)
ALTER TABLE TakeAway ADD CONSTRAINT Orders_TakeAway
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID);

-- Reference: Reservation_DiningTables (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_DiningTables
    FOREIGN KEY (DiningTableID)
    REFERENCES DiningTables (DiningTableID);

-- End of file.

