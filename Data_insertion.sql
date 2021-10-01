/*
	Team 12
	DMDD - Project
*/


USE Team12;

--Data Insertion
INSERT INTO ProductCategory VALUES
	('Furniture'),
	('Stationary'),
	('Toys'),
	('Electronics'),
	('Beauty & Personal Care'),
	('Food & Grocery'),
	('Clothing'),
	('Utensils'),
	('Sports'),
	('Health Care'),
	('Automobile & Industrial Equipments'),
	('Accessories')

GO
DROP FUNCTION IF EXISTS dbo.getProductCategoryID;
GO

CREATE FUNCTION dbo.getProductCategoryID(@CategoryName VARCHAR(MAX)) RETURNS INT
BEGIN
	RETURN (SELECT ProductCategoryID FROM ProductCategory WHERE ProductCategory = @CategoryName)
END;

GO

INSERT INTO Product (ProductName, UnitPrice, Quantity, ProductCategoryID) VALUES
	('Shoes',49.98,200,dbo.getProductCategoryID('Sports')),
	('Mobile Phone',389,100,dbo.getProductCategoryID('Electronics')),
	('Laptop',500,100,dbo.getProductCategoryID('Electronics')),
	('Bottle',17.99,400,dbo.getProductCategoryID('Utensils')),
	('T-shirt',10.99,700,dbo.getProductCategoryID('Clothing')),
	('Hand-Bag',200.00,200,dbo.getProductCategoryID('Accessories')),
	('HeadPhone',30.99,300,dbo.getProductCategoryID('Electronics')),
	('Acrylic Colours',24.99,200,dbo.getProductCategoryID('Stationary')),
	('Desk',69.99,100,dbo.getProductCategoryID('Furniture')),
	('File Cabinet',84.12,300,dbo.getProductCategoryID('Furniture')),
	('Book',12.00,600,dbo.getProductCategoryID('Stationary')),
	('Scissors',9.49,300,dbo.getProductCategoryID('Stationary')),
	('Dinner Set',44.66,100,dbo.getProductCategoryID('Utensils')),
	('Lipstick',12.78,300,dbo.getProductCategoryID('Beauty & Personal Care')),
	('RC Car',90,300,dbo.getProductCategoryID('Toys'))

GO

INSERT INTO [Address] Values 
	(1,'8273 Brown Rd','Middle Village','NY', 11379,'East','US'),
	(2,'435 James Street','Levittown', 'CA',11756,'West','US'),
	(3,'974 High Point Ave','Upper Darby','CA',19082,'West','US'),
	(4,'5 Leeton Ridge Ave','Greenwood','CA',29646,'West','US'),
	(5,'543 Cherry Hill Ave','Defiance','TX',43512, 'South','US'),
	(6,'44 Cambridge Avenue','Jonesboro','CA', 30236,'West','US'),
	(7,'823 Addison Ave','Oak Park','CA',48237,'West','US'),
	(8,'25 New Ave','Rolla','TX',65401,'South','US'),
	(9,'9001 Bradford Ave','Dracut','TX',01826,'South','US'),
	(10,'270 Rockaway St','Yuba City','CA',95993,'West','US'),
	(11,'9224 Beechwood Road','Manitowoc','TX',54220,'South','US'),
	(12,'447 Alton Ave','Beloit','CA',53511,'West','US'),
	(13,'20 Cobblestone Court','Eau Claire','NY',54701,'East','US'),
	(14,'647 Mammoth Avenue','Hudsonville','CA',49426,'West','US'),
	(15,'8966 Cedar Ave Apt 545','Lady Lake','WA',32159,'North','US')

GO

INSERT INTO Customer VALUES
	(1001,'Prajakta','Sawant','1995-12-30','prajakta225@gmail.com',7806280121),
	(1002,'Adarsh','Havalad','1996-11-04','Adarsh.H500@gmail.com',8667156109),
	(1003,'Rushabh','Patel','1996-12-23','R.Patel@gmial.com',9176008190),
	(1004,'Rutuja','Kale','1993-12-05','Rutuja.Kale15@gmail.com',1809003232),
	(1005,'Katy','Tupes','1986-01-29','Tupes55.Katy@yahoo.com',4132056127),
	(1006,'Riya','Sharma','2000-05-09','Sharma.Riya@gmail.com',8676678678),
	(1007,'Josh','Henry','1980-06-05','Henry.J@gmail.com',2025550111),
	(1008,'Robert','Williams','1961-03-24','R.williams50@gmail.com',4105550148),
	(1009,'Ann','Hurley','1995-11-29','Ann.Hurley25@yahoo.com',2025550199),
	(1010,'John','Webber','2005-09-01','J.webber14@gmail.com',4105550133),
	(1011,'Susanne','West','1983-04-30','West.Susan10@gmail.com',6175550111),
	(1012,'Pearson','Charles','1929-06-08','PCharles@gmail.com',6172090111),
	(1013,'Mike','Crosse','2000-12-27','Crosse.Mike20@gmial.com',8035550123),
	(1014,'Holly','Yodice','1995-10-20','Holly.Y@gmail.com',4015550101),
	(1015,'Susan','Lucy','1950-07-15','Lucy.S@gmail.com',2025550191) 

GO

INSERT INTO CustomerAddress VALUES
	(1001,1),
	(1002,2),
	(1003,3),
	(1004,4),
	(1005,5),
	(1006,6),
	(1007,7),
	(1008,8),
	(1009,9),
	(1010,10),
	(1011,11),
	(1012,12),
	(1013,13),
	(1014,14),
	(1015,15);

GO

INSERT INTO SellerAddress Values
	(200,'31643 55th Ln', 'Arkansas City','KS',67005,'Middle','US'),
	(201,'8865 Foxrun Lane','Oxnard','CA',93033,'West','US'),
	(202,'87 N. Shore St','Jones','OK',73049,'South','US'),
	(203,'280 Sumner St','Stoughton','MA',09876,'East','US'),
	(204,'11255 River Rd','Havre','MT',59501,'North','US'),
	(205,'218 Country Ave','Roselle','IL',60172,'East','US'),
	(206,'38 Forest St','Mason','OH',45040,'North','US'),
	(207,'9825 E. Birchpond Street','Egg Harbor Township','NJ',08234,'East','US'),
	(208,'8626 Rockaway St','Smyrna','GA',30080,'South','US'),
	(209,'269 Pennington Ave','Oakland Gardens','NY',11364,'East','US'),
	(210,'79 East Ocean St','Zion','IL',60099,'East','US') 

GO

GO

INSERT INTO [Order](OrderID, CustomerID, OrderDate) VALUES 
	(1,1001,'2021-07-01'),
	(2,1002,'2021-07-01'),
	(3,1003,'2021-07-01'),
	(4,1004,'2021-07-02'),
	(5,1005,'2021-07-02'),
	(6,1006,'2021-07-03'),
	(7,1007,'2021-07-03'),
	(8,1008,'2021-07-05'),
	(9,1009,'2021-08-18'),
	(10,1010,'2021-08-18'),
	(11,1011,'2021-08-18'),
	(12,1012,'2021-08-18'),
	(13,1013,'2021-08-18'),
	(14,1014,'2021-08-18'),
	(15,1015,'2021-08-18')

GO

INSERT INTO OrderStatus VALUES
	(1,1001,'Delivered'),
	(2,1002,'Delivered'),
	(3,1003,'Shipped'),
	(4,1004,'Processing'),
	(5,1005,'Shipped'),
	(6,1006,'Cancelled'),
	(7,1007,'Shipped'),
	(8,1008,'Delivered'),
	(9,1009,'Processing'),
	(10,1010,'Delivered'),
	(11,1011,'Delivered'),
	(12,1012,'Shipped'),
	(13,1013,'Shipped'),
	(14,1014,'Delivered'),
	(15,1015,'Processing');

GO

INSERT INTO Membership VALUES 
		(1001,'Classic',DATEADD(DAY,90,2021-06-01)),
		(1002,'Premier',DATEADD(DAY,365,2022-01-05)),
		(1003,'Classic',DATEADD(DAY,90,2021-05-07)),
		(1004,'Classic',DATEADD(DAY,90,2021-09-10)),
		(1005,'Premier',DATEADD(DAY,365,2022-12-30)),
		(1006,'Classic',DATEADD(DAY,90,2021-02-10)),
		(1007,'Premier',DATEADD(DAY,365,2022-01-25)),
		(1008,'Premier',DATEADD(DAY,365,2022-03-20)),
		(1009,'Classic',DATEADD(DAY,90,2021-05-03)),
		(1010,'Classic',DATEADD(DAY,90,2021-12-05)),
		(1011,'Classic',DATEADD(DAY,90,2021-08-19)),
		(1012,'Premier',DATEADD(DAY,365,2022-12-04)),
		(1013,'Classic',DATEADD(DAY,90,2021-06-15)),
		(1014,'Classic',DATEADD(DAY,90,2021-02-10)),
		(1015,'Classic',DATEADD(DAY,90,2021-09-19));


GO 

Insert INTO Seller VALUES
	(2101,'MM Electronics','Electronics@mm.com',7858245592,200),
	(2102,'Palo Accessories','Accessories@palo.com',5628019854,201),
	(2103,'Copley Products','Products@copley.com',9182512886,203),
	(2104,'Arlington Care','Care@arlington.com',51527281231,204),
	(2105,'Burlington Sports','sports@burlington.com',5808841421,205),
	(2106,'RC Devices','customer@RCDevices.com',6177087890,206),
	(2107,'Sephora Cosmetics','Sephora@cc.com',6177087890,207),
	(2108,'Symphony Baggages','Symphony@Bag.com',8901136170,208),
	(2109,'Toys City Enterprise','ToyCity@ET.com',4156006190,209),
	(2110,'Goodwill Store','customer@goodwillstore.com',3567213090,210),
	(2111,'Alewife Furnitures','customer@AlewifeFurniture.com',3567213090,202)  

INSERT INTO SellerProduct VALUES
             (2101,3),
			 (2101,2),
			 (2101,7),
			 (2102,6),
			 (2102,11),
			 (2103,13),
			 (2103,4),
			 (2104,1),
			 (2105,5),
			 (2106,15),
			 (2107,14),
			 (2108,10),
			 (2109,12),
			 (2110,8),
			 (2111,9)

GO 

DROP FUNCTION IF EXISTS dbo.getdisbursementamount;
GO

INSERT INTO OrderProduct VALUES
	(1,1,8,2104),(1,2,1,2101),(2,3,1,2101),(2,4,6,2103),(3,5,9,2105),(4,6,4,2102),(5,7,3,2101),(5,8,10,2110),(6,9,6,2111),(7,9,5,2111),(8,10,7,2108),(9,11,12,2102),(10,12,5,2109),(10,13,7,2103),(11,14,4,2107),(12,15,9,2106),(13,15,10,2106),(14,4,8,2103),(15,3,6,2105)
Go 

INSERT INTO Feedback Values
			 (2101,2,4,NULL),
			 (2101,3,5,'Super Quality,Quick delivery'),
			 (2101,7,4,'Remarkably pleased'),
			 (2102,6,5,'Excellent product quality'),
			 (2102,11,5,'Quality of item was great. Quality of the wrapping was good. Fantastic delivery'),
			 (2103,4,2,'Product was fine'),
			 (2103,13,3,'Fine packaging. Notably super delivery'),
			 (2104,1,3,NULL),
			 (2105,5,4,'Delivered product was fine'),
			 (2106,15,4,NULL),
			 (2107,14,5,'Very, very high-standard delivery. Lovely packaging. Recommended'),
			 (2108,10,5,'Great packaging. Delivery was high-standard'),
			 (2109,12,3,NULL),
			 (2110,8,3,'Good Seller'),
			 (2111,9,2,'Delivered late') 
Go 

DROP FUNCTION IF EXISTS dbo.getOrderAmount;
GO

CREATE FUNCTION dbo.getOrderAmount(@orderID INT) RETURNS MONEY 
BEGIN
RETURN(
	SELECT SUM(op.QUANTITY * (1-(pm.Discount/100.0)) * p.UnitPrice) [OrderAmount]
				FROM ORDERPRODUCT op
				JOIN Product p
				ON op.PRODUCTID = p.ProductID
				JOIN Promotion pm
				ON p.ProductID = pm.ProductID
				WHERE op.ORDERID = @orderID
				GROUP BY op.ORDERID)
END;

GO

Insert Into Promotion VALUES 
(1,10.0),(2,20.0),(3,10),(4,10),(5,5),(6,10),(7,5),(8,5),(9,10),(10,10),(11,2),(12,2),(13,2),(14,10),(15,2); 

GO

Insert INTO ProductTax Values 
(1,2),(2,10),(3,7),(4,2),(5,2),(6,5),(7,2),(8,2),(9,6),(10,5),(11,7),(12,1),(13,4),(14,2),(15,1);

GO

DROP FUNCTION IF EXISTS getBillingAmount;
GO

CREATE FUNCTION dbo.getBillingAmount(@orderID INT) RETURNS MONEY 
BEGIN
RETURN(
	SELECT SUM(op.QUANTITY * (1-(pm.Discount/100)) * p.UnitPrice * (1+(pt.TaxAmount/100))) [OrderAmount]
				FROM ORDERPRODUCT op
				JOIN Product p
				ON op.PRODUCTID = p.ProductID
				JOIN Promotion pm
				ON p.ProductID = pm.ProductID
				JOIN ProductTax pt
				ON p.ProductID = pt.ProductID
				WHERE op.ORDERID = @orderID
				GROUP BY op.ORDERID)
END;

GO 

INSERT INTO Payment VALUES
	(1,dbo.getBillingAmount(1),'Pending','Debit'),
	(2,dbo.getBillingAmount(2),'Complete','Credit'),
	(3,dbo.getBillingAmount(3),'Complete','Credit'),
	(4,dbo.getBillingAmount(4),'Complete','Debit'),
	(5,dbo.getBillingAmount(5),'Complete','Debit'),
	(6,dbo.getBillingAmount(6),'Complete','Credit'),
	(7,dbo.getBillingAmount(7),'Complete','Paypal'),
	(8,dbo.getBillingAmount(8),'Complete','Credit'),
	(9,dbo.getBillingAmount(9),'Complete','Debit'),
	(10,dbo.getBillingAmount(10),'Pending','Credit'),
	(11,dbo.getBillingAmount(11),'Complete','Paypal'),
	(12,dbo.getBillingAmount(12),'Complete','Credit'),
	(13,dbo.getBillingAmount(13),'Complete','Debit'),
	(14,dbo.getBillingAmount(14),'Failed','Paypal'),
	(15,dbo.getBillingAmount(15),'Complete','Credit') 

GO

DROP FUNCTION IF EXISTS getOrderAmount;

GO

CREATE FUNCTION dbo.getOrderAmount(@orderID INT) RETURNS MONEY 
BEGIN
RETURN(
	SELECT SUM(op.QUANTITY * (1-(pm.Discount/100.0)) * p.UnitPrice) [OrderAmount]
				FROM ORDERPRODUCT op
				JOIN Product p
				ON op.PRODUCTID = p.ProductID
				JOIN Promotion pm
				ON p.ProductID = pm.ProductID
				WHERE op.ORDERID = @orderID
				GROUP BY op.ORDERID)
END;

GO

------ Compued column using function----------
CREATE FUNCTION dbo.getdisbursementamount(@sellid INT) 
RETURNS MONEY 
BEGIN
RETURN(
	SELECT SUM(p.unitprice * op.quantity * 0.30) [DisbursementAmount]
				FROM ORDERPRODUCT op
				JOIN Product p
				ON op.PRODUCTID = p.ProductID
				JOIN SellerProduct sp
				ON p.ProductID = sp.ProductID
				WHERE sp.sellerid= @sellid
				GROUP BY sp.SellerID)
END; 

GO 

UPDATE [ORDER] SET AMOUNT = dbo.getOrderAmount(ORDERID)
UPDATE Payment SET BillingAmount = dbo.getBillingAmount(ORDERID)

GO

INSERT INTO Disbursment Values 
	(dbo.getdisbursementamount(2101),'BOFA','2021-08-31',2101),
	(dbo.getdisbursementamount(2102),'Chase Bank','2021-08-31',2102),
	(dbo.getdisbursementamount(2103),'TD National','2021-08-31',2103),
	(dbo.getdisbursementamount(2104),'Santander','2021-08-31',2104),
	(dbo.getdisbursementamount(2105),'Citizen','2021-08-31',2105),
	(dbo.getdisbursementamount(2106),'Citi Bank','2021-08-31',2106),
	(dbo.getdisbursementamount(2107),'California Bank','2021-08-31',2107),
	(dbo.getdisbursementamount(2108),'Boston Bank','2021-08-31',2108),
	(dbo.getdisbursementamount(2109),'Newyork Bank','2021-08-31',2109),
	(dbo.getdisbursementamount(2110),'Kansas Bank','2021-08-31',2110),
	(dbo.getdisbursementamount(2111), 'Washington Bank','2021-08-31',2111);

insert into [RETURN] values (1,1,'Exchange','Not Satisfied'),
													(2,4,'Exchange','Not Satisfied'),
													(3,5,'Cancellation','Not Satisfied'),
													(4,6,'Exchange','Not Satisfied'),
													(5,8,'Cancellation','Better Price Available'),
													(6,9,'Exchange','Not Satisfied'),
													(13,15,'Cancellation','Better Price Available'),
													(14,4,'Cancellation','Not Satisfied'),
													(10,12,'Exchange','Not Satisfied'),
													(11,14,'Cancellation','Not Satisfied');


PRINT 'Data Inserted successfully';



