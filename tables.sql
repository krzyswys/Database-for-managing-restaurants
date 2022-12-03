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

-- Table: IndividualCustomers
CREATE TABLE IndividualCustomers (
    CustomerID int  NOT NULL,
    PersonID int  NOT NULL,
    CONSTRAINT IndividualCustomers_pk PRIMARY KEY  (CustomerID)
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

-- Reference: CustomerPersonalData_CompanyEmployees (table: CompanyEmployees)
ALTER TABLE CompanyEmployees ADD CONSTRAINT CustomerPersonalData_CompanyEmployees
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

-- Reference: CustomerPersonalData_IndividualCustomers (table: IndividualCustomers)
ALTER TABLE IndividualCustomers ADD CONSTRAINT CustomerPersonalData_IndividualCustomers
    FOREIGN KEY (PersonID)
    REFERENCES CustomerPersonalData (PersonID);

-- Reference: IndividualCustomers_Customers (table: IndividualCustomers)
ALTER TABLE IndividualCustomers ADD CONSTRAINT IndividualCustomers_Customers
    FOREIGN KEY (CustomerID)
    REFERENCES Customers (CustomerID);