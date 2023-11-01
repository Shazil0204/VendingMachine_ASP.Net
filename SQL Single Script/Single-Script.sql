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

-- THIS DATABASE WILL HAVE INFO ABOUT HOW MANY VENDING MACHINES WE HAVE AND HOW MANY WE CAN HAVE
CREATE DATABASE AllVendingMachinesDB;
GO

USE AllVendingMachinesDB;

-- THIS TABLE WILL AHEV ALL THE NAMES FOR THE CITIES WHERE WE CAN CREATE A VENDING MACHINE
CREATE TABLE Cities(
	CityID INT IDENTITY(1,1) PRIMARY KEY,
	City VARCHAR(50) NOT NULL
);

-- THIS TABLE WILL STORE NAME OF ALL THE CITIES WHERE WE HAVE A TABLE ALREADY
CREATE TABLE DBRecords(
	DBID INT IDENTITY(1,1) PRIMARY KEY,
	DBName VARCHAR(50)
);

-- 																		STORED PROCEDURE

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

GO

CREATE PROCEDURE READ_VM
	@DBName VARCHAR(50),
	@RESULT INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @SQL NVARCHAR(MAX);

	IF EXISTS (
        SELECT name 
        FROM sys.databases 
        WHERE name = @DBName
    )
    BEGIN
	
		SET @SQL = 'USE ' + QUOTENAME(@DBName);
		EXECUTE sp_executesql @SQL;
	
		SET @SQL = '
			SELECT
				P.ProductName,
				P.ProductURL,
				P.Stock,
				P.Price,
				T.ProductType,
				B.ProductBrand
			FROM
				Products AS P
			INNER JOIN
				Brands AS B ON P.BrandID = B.BrandID
			INNER JOIN
				Types AS T ON P.TypeID = T.TypeID;

		';
		EXECUTE sp_executesql @SQL;
		
		SET @RESULT = 0;
		PRINT 'HERE YOU GO!';
		
	END
	ELSE
	BEGIN
		SET @RESULT = -1;
		PRINT 'CAN''T FIND A DATABASE WITH THIS NAME';
	END
END;

GO

/*
Just think first how is this procedure going to work

first we have to check the city name if there is a vending machine in that city 
then we will be able to update it otherwise it will show an error as @RETURN.

SECOND we will check for Product ID number that way we will be able to see which product are we talking about

then we will update all the other things inside that database in each table and return an output using @RESULT just to show if it SUCCESSFUL done

*/

CREATE PROCEDURE UPDATE_VM
    @DBName VARCHAR(50),
    @ProductID int,
    @ProductName VARCHAR(30),
    @ProductURL NVARCHAR(1000),
    @Stock int,
    @Price INT,
    @BrandID INT,
    @TypeID INT,
    @RESULT INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @SQL NVARCHAR(MAX);

    IF EXISTS (
        SELECT name 
        FROM sys.databases 
        WHERE name = @DBName
    )
    BEGIN
        -- Switch to the specified database
        SET @SQL = 'USE ' + QUOTENAME(@DBName);
        EXECUTE sp_executesql @SQL;
        
        -- Update the product
        SET @SQL = '
        UPDATE Products 
        SET 
            ProductName = ''' + @ProductName + ''',
            ProductURL = ''' + @ProductURL + ''', 
            Stock = ' + CAST(@Stock AS NVARCHAR(10)) + ', 
            Price = ' + CAST(@Price AS NVARCHAR(10)) + ',
            BrandID = ' + CAST(@BrandID AS NVARCHAR(10)) + ',
            TypeID = ' + CAST(@TypeID AS NVARCHAR(10)) + ' 
        WHERE ProductID = ' + CAST(@ProductID AS NVARCHAR(10));
        
        EXECUTE sp_executesql @SQL;
		SET @RESULT = 0;
        PRINT 'SYSTEM HAVE UPDATED TABLE IN DATABASE''' + QUOTENAME(@DBName) + ''' SUCCESSFUL';
		
    END
    ELSE
    BEGIN
        SET @RESULT = -1;
        PRINT 'SYSTEM CAN''T FIND A DATABASE WITH THIS NAME';
    END
END;

GO

-- DROP DATABASE PROCEDURE
CREATE PROCEDURE [dbo].[DELETING_VM]
    @CITY VARCHAR(100),
    @RESULT INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @SQL NVARCHAR(MAX);

	-- Check if the Database name you have typed exists
    IF EXISTS (SELECT * FROM DBRecords WHERE DBName = @CITY)
    BEGIN
		SET @SQL = 'DROP DATABASE ' + @CITY;

		EXECUTE sp_executesql @SQL;

		SET @SQL = 'DELETE FROM DBRecords WHERE WHERE DBName = ' + @CITY

		PRINT'DONE';
	END
	ELSE 
	BEGIN
		SET @RESULT = -1
		PRINT 'THERE IS NO DATABASE WITH THIS NAME. PLEASE CHECK YOUR INSERT TEXT AGAIN THANKS!';
	END
END;

GO