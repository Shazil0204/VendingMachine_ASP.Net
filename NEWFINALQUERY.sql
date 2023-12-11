--USE master;
--DROP DATABASE VENDINGMACHINEDB;
CREATE DATABASE VENDINGMACHINEDB;
GO

USE VENDINGMACHINEDB;
GO

CREATE TABLE Cities (
	CityID INT identity(1,1) PRIMARY KEY,
	City VARCHAR(50) NOT NULL
);
GO

CREATE TABLE DBRecords (
	DBID INT identity(1,1) PRIMARY KEY,
	DBStatus BIT NOT NULL,
	DBName VARCHAR(50) NOT NULL,
	CityID INT NOT NULL,
	FOREIGN KEY(CityID) REFERENCES Cities(CityID)
);
GO

CREATE TABLE Positions (
    PositionID INT identity(1,1) PRIMARY KEY,
    Position VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Employees (
	EmployeeID INT identity(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	EmployeeNumber INT NOT NULL,
	UserName VARCHAR(50) NOT NULL,
	Password VARCHAR(100) NOT NULL,
	Permission BIT NOT NULL,
	Age INT NOT NULL,
	PositionID INT NOT NULL,
	FOREIGN KEY(PositionID) REFERENCES Positions(PositionID)
);
GO

-- CREATE TABLE Employee_DB (
	-- Employee_DBID INT identity(1,1) PRIMARY KEY,
	-- EmployeeID INT NOT NULL,
	-- DBID INT NOT NULL,
	-- FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
	-- FOREIGN KEY(DBID) REFERENCES DBRecords(DBID)
-- );
-- GO

CREATE TABLE Brands (
	BrandID INT identity(1,1) PRIMARY KEY,
	ProductBrand VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Types (
	TypeID INT identity(1,1) PRIMARY KEY,
	ProductType VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Products (
	ProductID INT identity(1,1) PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	ProductURL VARCHAR(MAX) NOT NULL,
	Stock INT NOT NULL,
	Price INT NOT NULL,
	BrandID INT NOT NULL,
	TypeID INT NOT NULL,
	FOREIGN KEY(BrandID) REFERENCES Brands(BrandID),
	FOREIGN KEY(TypeID) REFERENCES Types(TypeID)
);
GO

CREATE TABLE DBProduct (
	DBProductID INT identity(1,1) PRIMARY KEY,
	DBID INT NOT NULL,
	ProductID INT NOT NULL,
	FOREIGN KEY(DBID) REFERENCES DBRecords(DBID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);
GO

-- INSERTING DUMMY DATA 
INSERT INTO Cities (City) VALUES ('Copenhagen'), ('Aarhus'), ('Odense'), ('Aalborg'), ('Esbjerg'), ('Randers'), ('Kolding'), ('Horsens'), ('Vejle'), ('Roskilde');
GO

INSERT INTO DBRecords (DBStatus, DBName, CityID) VALUES 
(1, 'MainVM', 1),
(1, 'DB1', 1), (1, 'DB2', 2), (1, 'DB3', 3), (1, 'DB4', 4),
(1, 'DB5', 5), (1, 'DB6', 6), (1, 'DB7', 7), (1, 'DB8', 8),
(1, 'DB9', 9), (1, 'DB10', 10);
GO

INSERT INTO Positions (Position) VALUES ('Manager'), ('Accountant'), ('Sales Representative'), ('Technician'), 
('HR Specialist'), ('Marketing Coordinator'), ('Product Manager'), ('IT Support'), ('Quality Control'), ('Operations Specialist');
GO

INSERT INTO Employees (FirstName, LastName, EmployeeNumber, UserName, Password, Permission, Age, PositionID) VALUES
('John', 'Doe', 3, '3', '3', 1, 30, 1),
('John', 'Doe', 1001, 'johndoe', '0x123456', 1, 30, 1), 
('Jane', 'Smith', 1002, 'janesmith', '0x789ABC', 0, 28, 2),
('Bob', 'Johnson', 1003, 'bobjohnson', '0xDEF012', 0, 35, 3), 
('Alice', 'Williams', 1004, 'alicewilliams', '0x345678', 1, 32, 4),
('Michael', 'Brown', 1005, 'michaelbrown', '0x9ABCDEF', 1, 40, 5), 
('Emily', 'Jones', 1006, 'emilyjones', '0xFEDCBA', 1, 26, 6),
('David', 'Miller', 1007, 'davidmiller', '0x654321', 1, 45, 7), 
('Sarah', 'Wilson', 1008, 'sarahwilson', '0xABCDEF', 0, 29, 8),
('Chris', 'Moore', 1009, 'chrismoore', '0x1234ABCD', 0, 37, 9), 
('Ashley', 'Taylor', 1010, 'ashleytaylor', '0xDEADBEEFø', 1, 33, 10);
GO

--INSERT INTO Employee_DB (EmployeeID, DBID) VALUES 
--(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);
--GO

INSERT INTO Brands (ProductBrand) VALUES ('Coca-Cola'), ('Pepsi'), ('Nestle'), ('Kraft Foods'), ('Unilever'), ('Lays'), ('Doritos'), ('Red Bull'), ('Starbucks'), ('Cadbury');
GO

INSERT INTO Types (ProductType) VALUES ('Beverage'), ('Snack'), ('Confectionery'), ('Dairy'), ('Cereal'), ('Juice'), ('Energy Drink'), ('Coffee'), ('Tea'), ('Biscuit');
GO

INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES
('Coca-Cola Classic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 1, 1), 
('Pepsi Cola', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 2, 1),
('Nestle Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 3, 3), 
('Kraft Cheese', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 30, 5, 4, 4),
('Unilever Tea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 75, 4, 5, 9), 
('Lays Chips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 6, 2),
('Doritos Nachos', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 7, 2), 
('Red Bull Energy Drink', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 6, 8, 7),
('Starbucks Coffee', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 5, 9, 8), 
('Cadbury Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 10, 3),
('Coca-Cola Classic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 1, 1), 
('Pepsi Cola', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 2, 1),
('Nestle Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 3, 3), 
('Kraft Cheese', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 30, 5, 4, 4),
('Unilever Tea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 75, 4, 5, 9), 
('Lays Chips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 6, 2),
('Doritos Nachos', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 7, 2), 
('Red Bull Energy Drink', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 6, 8, 7),
('Starbucks Coffee', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 5, 9, 8), 
('Cadbury Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 10, 3),
('Coca-Cola Classic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 1, 1), 
('Pepsi Cola', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 2, 1),
('Nestle Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 3, 3), 
('Kraft Cheese', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 30, 5, 4, 4),
('Unilever Tea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 75, 4, 5, 9), 
('Lays Chips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 6, 2),
('Doritos Nachos', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 7, 2), 
('Red Bull Energy Drink', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 6, 8, 7),
('Starbucks Coffee', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 5, 9, 8), 
('Cadbury Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 10, 3),
('Coca-Cola Classic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 1, 1), 
('Pepsi Cola', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 2, 1),
('Nestle Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 3, 3), 
('Kraft Cheese', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 30, 5, 4, 4),
('Unilever Tea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 75, 4, 5, 9), 
('Lays Chips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 6, 2),
('Doritos Nachos', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 7, 2), 
('Red Bull Energy Drink', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 6, 8, 7),
('Starbucks Coffee', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 5, 9, 8), 
('Cadbury Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 10, 3),
('Coca-Cola Classic', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 1, 1), 
('Pepsi Cola', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 2, 2, 1),
('Nestle Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 3, 3), 
('Kraft Cheese', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 30, 5, 4, 4),
('Unilever Tea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 75, 4, 5, 9), 
('Lays Chips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 6, 2),
('Doritos Nachos', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 80, 2, 7, 2), 
('Red Bull Energy Drink', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 100, 6, 8, 7),
('Starbucks Coffee', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 5, 9, 8), 
('Cadbury Chocolate', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Pepsi_logo_%282014%29.svg/800px-Pepsi_logo_%282014%29.svg.png?20230105182856', 50, 3, 10, 3);
GO

DECLARE @DBID INT;
DECLARE @MaxDBID INT;

-- Get the maximum DBID from DBRecordsS to loop through each vending machine
SELECT @MaxDBID = MAX(DBID) FROM DBRecords;

SET @DBID = 1;

-- Loop through each vending machine
WHILE @DBID <= @MaxDBID
BEGIN
    -- Insert first 50 products for each vending machine
    INSERT INTO DBProduct (DBID, ProductID)
    SELECT @DBID, ProductID FROM Products
    WHERE ProductID <= 50;

    -- Move to the next vending machine
    SET @DBID = @DBID + 1;
END;
GO

-- PROCEDURES

-- 1 CHECKINGPERMISSION

CREATE PROCEDURE CHECKINGPERMISSION(
    @EmployeeNumber INT,
    @UserName VARCHAR(50),
    @Password VARCHAR(MAX)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if employee exists by unique identifier (Employee Number)
        IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeNumber = @EmployeeNumber)
        BEGIN
            SELECT -2 AS Result;
            PRINT 'No Employee with this Employee Number exists';
            RETURN;
        END
        
        -- Check if username matches
        IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeNumber = @EmployeeNumber AND UserName = @UserName)
        BEGIN
            SELECT -1 AS Result;
            PRINT 'Employee username does not match';
            RETURN;
        END;
        
        -- Check if password matches
        IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeNumber = @EmployeeNumber AND Password = @Password)
        BEGIN
            SELECT 0 AS Result;
            PRINT 'Employee password is incorrect';
            RETURN;
        END;
        
        -- Check if employee has the required permission
        -- Assuming there's a column 'HasPermission' in 'Employees' table
        IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeNumber = @EmployeeNumber AND Permission = 1)
		BEGIN
			SELECT 2 AS Result;
			PRINT 'Employee does not have permission';
			RETURN;
		END;

        
        -- If all checks pass
        SELECT 1 AS Result;
        RETURN;
        
    END TRY
    
    BEGIN CATCH
        -- Handle errors
        SELECT -99 AS Result, 
               ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 2 CREATINGVM

CREATE PROCEDURE CREATINGVM
    @DBName VARCHAR(50),
    @CityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CityID INT;
    DECLARE @NewDBID INT;
	DECLARE @response INT = -5;

    BEGIN TRY
        -- Retrieve CityID based on CityName
        SELECT @CityID = CityID FROM Cities WHERE City = @CityName;
        IF @CityID IS NULL
        BEGIN
            -- If the city is not found, you can choose to return an error or add handling logic here
            SELECT -1 AS Result; -- City not found
            RETURN;
        END

        -- Insert new vending machine into DBRecordsS with default DBStatus as 1
        INSERT INTO DBRecords (DBStatus, DBName, CityID) 
        VALUES (1, @DBName, @CityID);

        -- Get the ID of the newly created vending machine
        SELECT @NewDBID = SCOPE_IDENTITY();

        -- Insert the first 50 products for the new vending machine
        INSERT INTO DBProduct (DBID, ProductID)
        SELECT @NewDBID, ProductID FROM Products
        WHERE ProductID <= 50;
		
		SET @response = 1;
		SELECT @response AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 3 READINGVM

CREATE PROCEDURE READINGVM(
    @VMName NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM DBRecords WHERE DBName = @VMName)
        BEGIN
            -- Return the result if database does not exist in DBRecords
            SELECT -2 AS Result;
            PRINT 'VENDING MACHINE does not exist';
            RETURN;
        END

        -- Query to select products linked to the specific vending machine
        SELECT p.ProductName, p.Price, p.ProductURL 
        FROM Products p
        INNER JOIN DBProduct dp ON p.ProductID = dp.ProductID
        INNER JOIN DBRecords dr ON dr.DBID = dp.DBID AND dr.DBName = @VMName;
        
        SELECT 1 AS Result; -- Indicate success

    END TRY
    BEGIN CATCH
        -- If there is an error, return -99 along with error information
        SELECT -99 AS Result, 
               ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;    		
    END CATCH
END
GO

-- 4 DELETINGVM

CREATE PROCEDURE DELETINGVM
    @DBName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DBID INT;

    BEGIN TRY
        -- Check if the DBName exists
        SELECT @DBID = DBID FROM DBRecords WHERE DBName = @DBName;
        IF @DBID IS NULL
        BEGIN
            SELECT -1 AS Result; -- DBName does not exist
            RETURN;
        END

        -- First, delete related entries in DBProduct
        DELETE FROM DBProduct WHERE DBID = @DBID;

        -- Then, delete the record from DBRecords
        DELETE FROM DBRecords WHERE DBID = @DBID;

        -- If deletion is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 5 CREATINGPRODUCT

CREATE PROCEDURE CREATINGPRODUCT
    @DBName VARCHAR(50), -- Use DBName instead of DBID
    @ProductName VARCHAR(50),
    @ProductURL VARCHAR(MAX),
    @Stock INT,
    @Price INT,
    @BrandID INT,
    @TypeID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewProductID INT; -- Variable to store the new product ID
    DECLARE @DBID INT; -- Variable to store the DBID

    BEGIN TRY
        -- Find the DBID from DBRecords using DBName
        SELECT @DBID = DBID FROM DBRecords WHERE DBName = @DBName;
        IF @DBID IS NULL
        BEGIN
            RAISERROR ('Invalid DBName provided', 16, 1);
            RETURN;
        END

        -- Insert new product
        INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID)
        VALUES (@ProductName, @ProductURL, @Stock, @Price, @BrandID, @TypeID);

        -- Retrieve the ID of the newly inserted product
        SELECT @NewProductID = SCOPE_IDENTITY();

        -- Link the new product with the DBRecords
        INSERT INTO DBProduct (DBID, ProductID)
        VALUES (@DBID, @NewProductID);

        -- Return success along with the new product ID
        SELECT 1 AS Result, @NewProductID AS NewProductID; 

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 6 UPDATTINGPRODUCT

CREATE PROCEDURE UPDATTINGPRODUCT
    @DBName VARCHAR(50),
    @ProductName VARCHAR(50) = NULL,
    @ProductURL VARCHAR(MAX) = NULL,
    @Stock INT = NULL,
    @Price INT = NULL,
    @BrandID INT = NULL,
    @TypeID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DBID INT; -- Variable to store the DBID
    DECLARE @ProductID INT; -- Variable to store the ProductID

    BEGIN TRY
        -- Find the DBID from DBRecords using DBName
        SELECT @DBID = DBID FROM DBRecords WHERE DBName = @DBName;
        IF @DBID IS NULL
        BEGIN
            RAISERROR ('Invalid DBName provided', 16, 1);
            RETURN;
        END

        -- Check if the product exists and get its ID
        SELECT @ProductID = ProductID FROM Products WHERE ProductName = @ProductName;
        IF @ProductID IS NULL
        BEGIN
            SELECT -1 AS Result; -- Product does not exist
            PRINT 'Product does not exist';
            RETURN;
        END

        -- Check if the DBName has this product connected to it
        IF NOT EXISTS (
            SELECT 1 
            FROM DBProduct 
            WHERE DBID = @DBID AND ProductID = @ProductID)
        BEGIN
            SELECT -3 AS Result; -- Product not connected to the specified DBName
            PRINT 'Product not connected to the specified DBName';
            RETURN;
        END

        -- Update product details
        UPDATE Products
        SET ProductName = ISNULL(@ProductName, ProductName),
            ProductURL = ISNULL(@ProductURL, ProductURL),
            Stock = ISNULL(@Stock, Stock),
            Price = ISNULL(@Price, Price),
            BrandID = ISNULL(@BrandID, BrandID),
            TypeID = ISNULL(@TypeID, TypeID)
        WHERE ProductID = @ProductID;

        -- If update is successful
        SELECT 1 AS Result; -- Success
        PRINT 'Success';

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 7 CREATINGCITY

CREATE PROCEDURE CREATINGCITY
    @CityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the city already exists
        IF EXISTS (SELECT 1 FROM Cities WHERE City = @CityName)
        BEGIN
            SELECT -1 AS Result; -- City already exists
            RETURN;
        END

        -- Insert new city
        INSERT INTO Cities (City) VALUES (@CityName);

		SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO


-- 8 UPDATINGCITY

CREATE PROCEDURE UPDATINGCITY
    @City VARCHAR(50),
    @NewCityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the city exists
        IF NOT EXISTS (SELECT 1 FROM Cities WHERE City = @City)
        BEGIN
            SELECT -1 AS Result; -- City does not exist
            RETURN;
        END

        -- Check if the new city name already exists (to avoid duplicates)
        IF EXISTS (SELECT 1 FROM Cities WHERE City = @NewCityName AND City <> @City)
        BEGIN
            SELECT -2 AS Result; -- New city name already exists
            RETURN;
        END

        -- Update the city name
        UPDATE Cities
        SET City = @NewCityName
        WHERE City = @City;

        -- If update is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 9 DELETINGCITY

CREATE PROCEDURE DELETINGCITY
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the city exists
        IF NOT EXISTS (SELECT 1 FROM Cities WHERE City = @City)
        BEGIN
            SELECT -1 AS Result; -- City does not exist
            RETURN;
        END

        -- Additional check for dependencies in other tables can be added here
        -- For example, checking if the city is referenced in DBRecords

        -- Delete the city
        DELETE FROM Cities WHERE City = @City;

        -- If deletion is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 10 UPDATINGDBSTATUS

CREATE PROCEDURE UPDATINGDBSTATUS
    @DBName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the DBName exists
        IF NOT EXISTS (SELECT 1 FROM DBRecords WHERE DBName = @DBName)
        BEGIN
            SELECT -1 AS Result; -- DBName does not exist
            RETURN;
        END

        -- Update DBStatus by toggling its value
        UPDATE DBRecords
        SET DBStatus = 1 - DBStatus
        WHERE DBName = @DBName;

        -- If update is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 11 READINGVMSTATUS

GO
CREATE PROCEDURE READINGVMSTATUS(
    @DBName NVARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @result INT = -5;
    DECLARE @sqlQuery NVARCHAR(MAX);

    BEGIN TRY

        IF NOT EXISTS (SELECT 1 FROM DBRecords WHERE DBName = @DBName)
        BEGIN
            SET @result = -2;
			print 'name does not exist';
            SELECT @result AS Result;
            RETURN;
        END
        ELSE

        BEGIN
            -- Combine the USE statement and the query into one dynamic SQL statement
            SET @sqlQuery = N'
                SELECT DBStatus FROM DBRecords WHERE DBName = @DBName;';



            EXEC sp_executesql @sqlQuery, 
                N'@DBName NVARCHAR(50)',
                @DBName;

            -- No need to select @result here as the desired query has already executed
        END;

    END TRY
    BEGIN CATCH

        -- If there is an error, return -99 along with error information
        SELECT -99 AS Result, 
               ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 12 SHOWALLDBRECORDS

CREATE PROCEDURE SHOWALLDBRECORDS
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Select all records from DBRecords
        SELECT * FROM DBRecords;

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 13 CREATINGBRAND

CREATE PROCEDURE CREATINGBRAND
    @ProductBrand VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the brand already exists
        IF EXISTS (SELECT 1 FROM Brands WHERE ProductBrand = @ProductBrand)
        BEGIN
            SELECT -1 AS Result; -- Brand already exists
            RETURN;
        END

        -- Insert new brand
        INSERT INTO Brands (ProductBrand) VALUES (@ProductBrand);
		
		SELECT 1 AS Result; -- Brand created successfully

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 14 UPDATINGBRAND

CREATE PROCEDURE UPDATINGBRAND
    @ProductBrand VARCHAR(50),
    @NewBrandName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the brand exists
        IF NOT EXISTS (SELECT 1 FROM Brands WHERE ProductBrand = @ProductBrand)
        BEGIN
            SELECT -1 AS Result; -- Brand does not exist
            RETURN;
        END

        -- Check if the new brand name already exists (to avoid duplicates)
        IF EXISTS (SELECT 1 FROM Brands WHERE ProductBrand = @NewBrandName AND ProductBrand <> @ProductBrand)
        BEGIN
            SELECT -2 AS Result; -- New brand name already exists
            RETURN;
        END

        -- Update the brand name
        UPDATE Brands
        SET ProductBrand = @NewBrandName
        WHERE ProductBrand = @ProductBrand;

        -- If update is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 15 CREATINGPRODUCTTYPE

CREATE PROCEDURE CREATINGPRODUCTTYPE
    @ProductType VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the product type already exists
        IF EXISTS (SELECT 1 FROM Types WHERE ProductType = @ProductType)
        BEGIN
            SELECT -1 AS Result; -- Product type already exists
            RETURN;
        END

        -- Insert new product type
        INSERT INTO Types (ProductType) VALUES (@ProductType);
		
		SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS ErrorNumber, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

-- 16 UPDATINGPRODUCTTYPE

CREATE PROCEDURE UPDATINGPRODUCTTYPE
    @ProductType VARCHAR(50),
    @NewTypeName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the product type exists
        IF NOT EXISTS (SELECT 1 FROM Types WHERE ProductType = @ProductType)
        BEGIN
            SELECT -1 AS Result; -- Type does not exist
            RETURN;
        END

        -- Check if the new type name already exists (to avoid duplicates)
        IF EXISTS (SELECT 1 FROM Types WHERE ProductType = @NewTypeName AND ProductType <> @ProductType)
        BEGIN
            SELECT -2 AS Result; -- New type name already exists
            RETURN;
        END

        -- Update the product type
        UPDATE Types
        SET ProductType = @NewTypeName
        WHERE ProductType = @ProductType;

        -- If update is successful
        SELECT 1 AS Result; -- Success

    END TRY
    BEGIN CATCH
        -- Handle errors
        SELECT ERROR_NUMBER() AS Result, 
               ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO

USE [master];
GO

CREATE LOGIN [VendingLogin] WITH PASSWORD = N'Kode1234!', DEFAULT_DATABASE=[VENDINGMACHINEDB], CHECK_POLICY = ON;
GO

USE [VENDINGMACHINEDB];
GO

CREATE USER [VendingLogin] FOR LOGIN [VendingLogin];
GO

ALTER ROLE db_owner ADD MEMBER [VendingLogin];
GO