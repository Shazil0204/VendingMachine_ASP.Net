-- CREATE DATABASE PROCEDURE

CREATE PROCEDURE [dbo].[CREATING_VM]
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
        SET @SQL = 'INSERT INTO DBRecords(DBName) VALUES(''' + @CITY + '_VM'')';
        EXECUTE sp_executesql @SQL;

        -- Create the new database
        SET @SQL = 'CREATE DATABASE ' + QUOTENAME(@CITY + '_VM');
        EXECUTE sp_executesql @SQL;

        -- Create tables in the new database and insert data
        SET @SQL = '
        USE ' + QUOTENAME(@CITY + '_VM') + ';

        CREATE TABLE Brands(
            BrandID INT IDENTITY(1,1) PRIMARY KEY,
            ProductBrand VARCHAR(30) NOT NULL
        );

        CREATE TABLE Types(
            TypeID INT IDENTITY(1,1) PRIMARY KEY,
            ProductType VARCHAR(30)
        );

        CREATE TABLE Products(
            ProductID int IDENTITY(1,1) PRIMARY KEY,
            ProductName VARCHAR(30),
            ProductURL NVARCHAR(1000),
            Stock int,
            Price INT NOT NULL,
            BrandID INT NOT NULL,
            TypeID INT NOT NULL,
            FOREIGN KEY(BrandID) REFERENCES Brands(BrandID),
            FOREIGN KEY(TypeID) REFERENCES Types(TypeID)
        );

        CREATE TABLE Transactions(
            TransactionID INT IDENTITY(1,1) PRIMARY KEY,
            TotalPrice INT NOT NULL,
            Quantity INT NOT NULL,
            ProductID INT NOT NULL,
            FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
        );

        -- INSERT INTO BRANDS
        INSERT INTO Brands (Brand) VALUES (''BrandA'');
        INSERT INTO Brands (Brand) VALUES (''BrandB'');
        INSERT INTO Brands (Brand) VALUES (''BrandC'');

        -- INSERT INTO TYPES
        INSERT INTO Types (ProductType) VALUES (''Type1'');
        INSERT INTO Types (ProductType) VALUES (''Type2'');
        INSERT INTO Types (ProductType) VALUES (''Type3'');

        -- INSERT INTO PRODUCTS
        INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductA1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 100, 50, 1, 1);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductA2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 150, 60, 2, 2);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductA3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 200, 70, 3, 3);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductB1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 110, 55, 1, 2);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductB2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 155, 65, 2, 3);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductB3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 210, 75, 3, 1);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductC1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 120, 52, 1, 3);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductC2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 160, 62, 2, 1);
		INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) VALUES (''ProductC3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 220, 72, 3, 2);

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

