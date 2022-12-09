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

