/*
	Team 12
	DMDD - Project
*/


USE Team12;

------------------------------Encrypted Column----------------------

ALTER TABLE Customer DROP COLUMN PhoneNumber;
ALTER TABLE Customer ADD PhoneNumber VARBINARY(250);

BEGIN TRY
	Create Master Key 
	Encryption By Password = 'P@ssword';

	Create Certificate ProjectCertificate
	With Subject = 'Project Certificate',
	Expiry_Date = '2021-12-31';

	Create Symmetric Key ProjectSymmetricKey
	With Algorithm = AES_128
	Encryption by Certificate ProjectCertificate;
END TRY
BEGIN CATCH
	PRINT 'Master key and certificates already exists';
END CATCH

OPEN SYMMETRIC KEY ProjectSymmetricKey
DECRYPTION BY CERTIFICATE ProjectCertificate;

DECLARE @cnt INT = 1
WHILE @cnt <= (SELECT MAX(c.CustomerID) FROM Customer c)
BEGIN
	UPDATE Customer 
		SET PhoneNumber = (EncryptByKey(Key_GUID(N'ProjectSymmetricKey'), 
			convert(varbinary, 'Pass'+CAST(@cnt AS VARCHAR)))) Where CustomerID = 1000 + @cnt;
	SET @cnt += 1;
END;

GO

----------------------------Stored Procedure---------------------

GO
Drop PROCEDURE IF EXISTS TotalSalesPerDay;

GO
CREATE PROCEDURE TotalSalesPerDay
@OrderDate DATE,
@totalSales Money OUTPUT
AS BEGIN
	SET @totalSales = ( SELECT sum(pm.BillingAmount) as TotalSale
						FROM [Order] o
						INNER JOIN Payment pm
						ON pm.OrderId = o.OrderId
						WHERE o.OrderDate = @OrderDate
						GROUP BY o.OrderDate )
END;

GO

DECLARE @date DATE = '2021-07-02';
DECLARE @totalSales MONEY;

EXEC TotalSalesPerDay @date, @totalSales OUTPUT;
SELECT @totalSales AS [TotalSales];

GO

----------------------------Views--------------------------------

GO
Drop view IF EXISTS CustomerOrderStatus;
GO

Create view CustomerOrderStatus AS
	select (c.FirstName+ ' ' +c.LastName) AS fullname, o.OrderID,os.Status,o.OrderDate
	from Customer c 
	inner join [order] o 
	on c.CustomerID =o.CUSTOMERID 
	inner join OrderStatus os
	on c.CustomerID = os.CustomerID

GO 

Select * from CustomerOrderStatus 
GO

Drop view IF EXISTS Product_Division;
GO

CREATE VIEW Product_Division AS
	SELECT ProductID,ProductName,UnitPrice,
	CASE 
	WHEN UnitPrice < 25 THEN 'Cheap'
	WHEN UnitPrice > 50 THEN 'Exorbitant'
	ELSE 'Affordable'
	END AS Product_Division
	FROM Product;

GO

SELECT * FROM Product_Division;
GO

Drop view IF EXISTS SellerRating;
GO

Create view SellerRating As 
	select s.SellerID, f.rating
	from Seller s 
	inner join Feedback f 
	on s.SellerID = f.SellerID 
	Where rating >= 3

GO 
Select * from SellerRating
GO

SELECT * FROM CustomerAddress;
