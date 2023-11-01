-- THIS DATABASE WILL ONLY WHOLE ALL THE EMPLOYES INFOMATION
CREATE DATABASE AdminLoginDB;
GO

USE AdminLoginDB;	
GO

CREATE TABLE Positions(
	PositionID INT IDENTITY(1,1) PRIMARY KEY,
	Position VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Employees(
	EmployeID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeNumber INT NOT NULL,
	FirstName VARCHAR(15) NOT NULL,
	LastName VARCHAR(15) NOT NULL,
	Age INT NOT NULL,
	PositionID INT NOT NULL,
	FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

------------------------------------------------------------------------------------------------------------------------

-- THIS DATABASE WILL ONLY HAVE INFO ABOUT HOW MANY VENDING MACHINES WE HAVE
CREATE DATABASE AllVendingMachinesDB;
GO

-- The reason this Table is commented is because we will create this table using C# program that way we don't have to insert data our self

-- This table will store all the city names in denmark
/*
CREATE TABLE VendingMachine(
	VendingMachineID INT IDENTITY(1,1) PRIMARY KEY,
	City VARCHAR(50)
);
GO
*/

-- Over here i have my whole program
CREATE PROCEDURE [dbo].[CreatingVM]
    @CITY VARCHAR(100),
    @RESULT INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @SQL NVARCHAR(MAX);

    -- Initialize @Result to a default value
    SET @RESULT = -3;

    -- Check if the table already exists in MainDB
    IF EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = @CITY + '_VM'
	)
	BEGIN
		SET @Result = -2;
		PRINT 'THIS VENDING MACHINE ALREADY EXISTS';
		RETURN;
	END


    -- Check if the city name you have typed exists
    IF EXISTS (SELECT * FROM Cities WHERE City = @CITY)
    BEGIN
		-- INSERT THIS DATABASE NAME INSIDE THE TABLE TO SHOW WHICH CITY HAS A VENDING MACHINE
		SET @SQL = 'INSERT INTO DBRecords(DBName) VALUES(''' + @CITY + ''')'
		EXECUTE sp_executesql @SQL;

        -- Create the new database
        SET @SQL = 'CREATE DATABASE ' + QUOTENAME(@CITY + '_VM');
        EXECUTE sp_executesql @SQL;

        -- Create tables in the new database
        SET @SQL = 'USE ' + QUOTENAME(@CITY + '_VM') + ';
        
        CREATE TABLE Prices(
            PriceID INT IDENTITY(1,1) PRIMARY KEY,
            Price INT NOT NULL
        );

        CREATE TABLE Brands(
            BrandID INT IDENTITY(1,1) PRIMARY KEY,
            Brand VARCHAR(30) NOT NULL
        );

        CREATE TABLE Types(
            TypeID INT IDENTITY(1,1) PRIMARY KEY,
            ProductType VARCHAR(30)
        );

        CREATE TABLE Products(
            ProductID int IDENTITY(1,1) PRIMARY KEY,
            ProductName varchar(30),
            Stock int,
            BrandID INT NOT NULL,
            PriceID INT NOT NULL,
            TypeID INT NOT NULL,
            FOREIGN KEY(BrandID) REFERENCES Brands(BrandID),
            FOREIGN KEY(PriceID) REFERENCES Prices(PriceID),
            FOREIGN KEY(TypeID) REFERENCES Types(TypeID)
        );

        CREATE TABLE Transactions(
            TransactionID INT IDENTITY(1,1) PRIMARY KEY,
            TotalPrice INT NOT NULL,
            Quantity INT NOT NULL,
            ProductID INT NOT NULL,
            FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
        );
		
		-- Insert Brands
		INSERT INTO Brands (Brand) VALUES (''Coca-Cola'');
		INSERT INTO Brands (Brand) VALUES (''Pepsi'');
		INSERT INTO Brands (Brand) VALUES (''Lays'');
		INSERT INTO Brands (Brand) VALUES (''Mars'');
		INSERT INTO Brands (Brand) VALUES (''Cadbury'');
		INSERT INTO Brands (Brand) VALUES (''Nestle'');
		INSERT INTO Brands (Brand) VALUES (''Doritos'');	

		-- Insert Prices (Assuming price is in cents)
		INSERT INTO Prices (Price) VALUES (150); -- $1.50
		INSERT INTO Prices (Price) VALUES (100); -- $1.00
		INSERT INTO Prices (Price) VALUES (200); -- $2.00
		INSERT INTO Prices (Price) VALUES (250); -- $2.50
		INSERT INTO Prices (Price) VALUES (300); -- $3.00
		INSERT INTO Prices (Price) VALUES (350); -- $3.50

		-- Insert Types
		INSERT INTO Types (ProductType) VALUES (''Soda'');
		INSERT INTO Types (ProductType) VALUES (''Chips'');
		INSERT INTO Types (ProductType) VALUES (''Chocolate'');
		INSERT INTO Types (ProductType) VALUES (''Gum'');
		INSERT INTO Types (ProductType) VALUES (''Juice'');
		INSERT INTO Types (ProductType) VALUES (''Cookies'');

		-- Insert Products
		-- Assuming BrandID, PriceID, and TypeID are sequential and start from 1
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Coca-Cola Can'', 50, 1, 1, 1); -- Soda by Coca-Cola at $1.50
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Pepsi Bottle'', 60, 2, 2, 1); -- Soda by Pepsi at $1.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Lays Classic'', 40, 3, 3, 2); -- Chips by Lays at $2.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Mars Bar'', 30, 4, 4, 3); -- Chocolate by Mars at $2.50
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Cadbury Juice'', 20, 5, 5, 5); -- Juice by Cadbury at $3.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Nestle Water'', 80, 6, 2, 5); -- Juice by Nestle at $1.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Doritos Nacho'', 45, 7, 3, 2); -- Chips by Doritos at $2.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Coca-Cola Bottle'', 40, 1, 5, 1); -- Soda by Coca-Cola at $3.00
		INSERT INTO Products (ProductName, Stock, BrandID, PriceID, TypeID) VALUES (''Nestle Cookies'', 35, 6, 6, 4); -- Cookies by Nestle at $3.50

		';
       
        EXECUTE sp_executesql @SQL;
        
        SET @Result = 0; -- Indicating success
		PRINT 'DONE SUCCESSFULLY';
    END
    ELSE
    BEGIN
        SET @Result = -1; -- City name doesn't exist
		PRINT 'THIS CITY NAME DOES NOT EXIST IN OUR DATABASE';
    END
END;


-- EXAMPLE HOW TO EXECUTE
-- DECLARE @OutputResult INT;
-- EXEC CreatingVM @CITY = 'København', @RESULT = @OutputResult OUTPUT;
-- SELECT @OutputResult;

-- use København_VM;

-- select * from Prices;
-- select * from Brands;
-- select * from Types;
-- select * from Products;