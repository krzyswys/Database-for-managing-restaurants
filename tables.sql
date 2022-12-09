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

