/*
	Team 12
	DMDD - Project
*/


IF DB_ID('Team12') IS NULL
BEGIN
	PRINT 'Creating Databse';
	CREATE DATABASE Team12;
END
ELSE
BEGIN
	USE Team12;
	PRINT 'Database already exists';
END;

--Setting database context
USE Team12;

GO

DROP PROCEDURE IF EXISTS DELETE_ALL_TABLES;

GO

-- Stored procedure to drop all tables

CREATE PROCEDURE DELETE_ALL_TABLES AS
BEGIN
	DROP TABLE IF EXISTS Membership; 
	DROP TABLE IF EXISTS OrderStatus;
	DROP TABLE IF EXISTS ProductCategory;
	DROP TABLE IF EXISTS [Return];
	DROP TABLE IF EXISTS Payment;
	DROP TABLE IF EXISTS [Order];
	DROP TABLE IF EXISTS CustomerAddress;
	DROP TABLE IF EXISTS Customer;
	DROP TABLE IF EXISTS [Address];
	DROP TABLE IF EXISTS Promotion;
	DROP TABLE IF EXISTS OrderProduct;
	DROP TABLE IF EXISTS ProductTax;
	DROP TABLE IF EXISTS SellerProduct; 
	DROP TABLE IF EXISTS Product; 
	DROP TABLE IF EXISTS Disbursment;
	DROP TABLE IF EXISTS Seller;
	DROP TABLE IF EXISTS Feedback;
	DROP TABLE IF EXISTS SellerAddress;
END;

GO

--EXEC DELETE_ALL_TABLES;

GO

-- Creating tables

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Address'))
BEGIN
	CREATE TABLE Address( 
		AddressID INT PRIMARY KEY,
		Street VARCHAR(95) NOT NULL,
		City VARCHAR(30) NOT NULL,
		State VARCHAR(2) NOT NULL,
		Zipcode INT NOT NULL,
		Region VARCHAR(30) NOT NULL,
		Country VARCHAR(30) NOT NULL)
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'SellerAddress'))
BEGIN
	CREATE TABLE SellerAddress(
		  AddressID INT PRIMARY KEY,
		  Street VARCHAR(95) NOT NULL,
		  City VARCHAR(30) NOT NULL,
		  State VARCHAR(2) NOT NULL,
		  ZipCode INT NOT NULL,
		  Region VARCHAR(30) NOT NULL,
		  Country VARCHAR(30) NOT NULL)
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'ProductCategory'))
BEGIN 
     CREATE TABLE ProductCategory (
		ProductCategoryID int IDENTITY Primary key,
		ProductCategory Varchar(60) NOT NULL)
END; 

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Customer'))
BEGIN
    CREATE TABLE Customer ( 
		CustomerID INT PRIMARY KEY,
		FirstName VARCHAR(45) NOT NULL,
		LastName VARCHAR(45) NOT NULL,
		DOB DATE NOT NULL,
		Email VARCHAR(255) NOT NULL,
		PhoneNumber BIGINT NOT NULL)
END;


IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Seller'))
BEGIN
	CREATE TABLE Seller (
		SellerId INT PRIMARY KEY,
		OrganizationName VARCHAR(255) NOT NULL,
		Email VARCHAR(255) NOT NULL,
		PhoneNumber BIGINT NOT NULL,
		SellerAddressId INT NOT NULL FOREIGN KEY REFERENCES SellerAddress(AddressId))
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Product'))
BEGIN 
	CREATE TABLE Product
	(
	ProductID int IDENTITY Primary Key, 
	ProductName Varchar(255) NOT NULL,
	UnitPrice Money NOT NULL,
	Quantity int NOT NULL,
	ProductCategoryID int NOT NULL Foreign Key(ProductCategoryId) References ProductCategory(ProductCategoryID) 
	)
END; 

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'SellerProduct'))
BEGIN
	CREATE TABLE SellerProduct(
    SellerID INT,
    ProductID INT,
    PRIMARY KEY(SellerID, ProductID),
    FOREIGN KEY(SellerID) REFERENCES Seller(SellerID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID))
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Disbursment'))
BEGIN
	CREATE TABLE Disbursment(
		DisbursmentID INT Identity PRIMARY KEY,
		Amount MONEY NULL,
		BankName VARCHAR(45) NOT NULL,
		DisbursmentDate DATETIME NOT NULL,
		SellerID INT NOT NULL
		FOREIGN KEY(SELLERID) REFERENCES Seller(SellerID))
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'OrderStatus'))
BEGIN
	CREATE TABLE OrderStatus (
		OrderID INT PRIMARY KEY,
		CustomerID INT NOT NULL,
		Status VARCHAR(10) NOT NULL,
		FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
		CONSTRAINT STATUS CHECK (STATUS IN ('Delivered','Shipped','Processing','Cancelled')))
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'CustomerAddress'))
BEGIN
	CREATE TABLE CustomerAddress (
		CustomerID INT,
		AddressID INT,
		CONSTRAINT Customer_PK PRIMARY KEY(CustomerID, AddressID),
		CONSTRAINT Customer_FK1 FOREIGN KEY(AddressID) REFERENCES Address(AddressID),
		CONSTRAINT Customer_FK2 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID))
END;



IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Return'))
BEGIN
	CREATE TABLE [RETURN] (
		OrderID INT PRIMARY KEY,
		ProductID INT NOT NULL,
		TYPE VARCHAR(15) NOT NULL,
		REASON VARCHAR (255) NOT NULL,
		CONSTRAINT OrderStatus_FK FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
		CONSTRAINT TYPE CHECK(TYPE IN ('Exchange', 'Cancellation')))
END;


IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'ProductTax'))
BEGIN 
	CREATE TABLE ProductTax 
	(
	ProductID int Primary Key References Product(ProductID),
	TaxAmount Money NOT NULL
	) 
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Promotion'))
BEGIN 
	CREATE TABLE Promotion
	(
	PromtionID int IDENTITY Primary Key,
	ProductID int NOT NULL Foreign Key (ProductID) References Product(ProductID),
	Discount Decimal NOT NULL
	)
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Feedback'))
BEGIN 
	CREATE TABLE Feedback 
	(
	FeedbackID int IDENTITY Primary Key,
	SellerId int NOT NULL Foreign Key(SellerId) References Seller(SellerID),
	ProductID int NOT NULL Foreign key(ProductID) References Product(ProductID),
	Rating int NOT NULL,
	Comment Varchar(255) NULL
	) 
END;  

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Order'))
BEGIN 
	CREATE TABLE [ORDER]
	(
	ORDERID INT PRIMARY KEY,
	CUSTOMERID INT NOT NULL,
	AMOUNT MONEY NULL,
	ORDERDATE DATETIME NOT NULL,
	FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER(CUSTOMERID))
END; 

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'OrderProduct'))
BEGIN 
	CREATE TABLE ORDERPRODUCT
	(
	SalesOrderID INT IDENTITY,
	ORDERID INT NOT NULL,
	PRODUCTID INT NOT NULL,
	QUANTITY INT NOT NULL,
	SellerID INT NOT NULL,
	Constraint OrderProduct_PK PRIMARY KEY(ORDERID,PRODUCTID),
	Constraint OrderProduct_FK1 Foreign KEY(ORDERID) REFERENCES [ORDER](ORDERID),
	Constraint OrderProduct_FK2 Foreign KEY(PRODUCTID) REFERENCES PRODUCT(PRODUCTID),
	Constraint OrderProduct_FK3 Foreign KEY(SellerID) REFERENCES Seller(SellerID)
	)
END;


IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Payment'))
BEGIN 
	Create Table Payment 
	( 
	PaymentID INT IDENTITY Primary key, 
	OrderID int NOT NULL Foreign Key(OrderID) References [Order](OrderID), 
	BillingAmount Money NOT NULL,
	Status varchar(50) NOt NULL, 
	PaymentMode varchar(50) NOT NULL 
	)
END;

IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'membership'))
BEGIN 
	Create table Membership 
	(
	MembershipId int IDENTITY Primary Key,
	CustomerId int NOT NULL Foreign Key(CustomerId) References Customer(CustomerId),
	PlanType varchar(10)  NOT NULL,
	PlanExpiry Date NOT NULL
	)
End

PRINT 'Tables created successfully';








