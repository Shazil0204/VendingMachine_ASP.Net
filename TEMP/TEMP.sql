DELIMITER //

CREATE PROCEDURE CREATING_VM(IN CITY VARCHAR(100), OUT RESULT INT)
BEGIN
    DECLARE v_SQL TEXT;

    -- Initialize RESULT to a default value
    SET RESULT = -3;

    -- Check if the database already exists in MainDB
    IF EXISTS (
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name = CONCAT(CITY, '_VM')
    ) THEN
        SET RESULT = -2;
        SELECT 'THIS VENDING MACHINE ALREADY EXISTS';
    ELSEIF EXISTS (SELECT 1 FROM Cities WHERE City = CITY) THEN
        -- INSERT THIS DATABASE NAME INSIDE THE TABLE TO SHOW WHICH CITY HAS A VENDING MACHINE
        SET v_SQL = CONCAT('INSERT INTO DBRecords(DBName) VALUES(', QUOTE(CONCAT(CITY, '_VM')), ')');
        PREPARE stmt FROM v_SQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Create the new database
        SET v_SQL = CONCAT('CREATE DATABASE `', CITY, '_VM`');
        PREPARE stmt FROM v_SQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Create tables in the new database and insert data
        SET v_SQL = CONCAT(
        'USE `', CITY, '_VM`;

        CREATE TABLE Brands(
            BrandID INT AUTO_INCREMENT PRIMARY KEY,
            ProductBrand VARCHAR(30) NOT NULL
        );

        CREATE TABLE Types(
            TypeID INT AUTO_INCREMENT PRIMARY KEY,
            ProductType VARCHAR(30)
        );

        CREATE TABLE Products(
            ProductID int AUTO_INCREMENT PRIMARY KEY,
            ProductName VARCHAR(30),
            ProductURL VARCHAR(1000),
            Stock int,
            Price INT NOT NULL,
            BrandID INT NOT NULL,
            TypeID INT NOT NULL,
            FOREIGN KEY(BrandID) REFERENCES Brands(BrandID),
            FOREIGN KEY(TypeID) REFERENCES Types(TypeID)
        );

        CREATE TABLE Transactions(
            TransactionID INT AUTO_INCREMENT PRIMARY KEY,
            TotalPrice INT NOT NULL,
            Quantity INT NOT NULL,
            ProductID INT NOT NULL,
            FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
        );

        INSERT INTO Brands (ProductBrand) VALUES (''BrandA''), (''BrandB''), (''BrandC'');

        INSERT INTO Types (ProductType) VALUES (''Type1''), (''Type2''), (''Type3'');

        INSERT INTO Products (ProductName, ProductURL, Stock, Price, BrandID, TypeID) 
        VALUES 
            (''ProductA1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 100, 50, 1, 1),
            (''ProductA2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 150, 60, 2, 2),
            (''ProductA3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 200, 70, 3, 3),
            (''ProductB1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 110, 55, 1, 2),
            (''ProductB2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 155, 65, 2, 3),
            (''ProductB3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 210, 75, 3, 1);
        ');

        PREPARE stmt FROM v_SQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET RESULT = 0; -- Indicating success
        SELECT 'DONE SUCCESSFULLY';
    ELSE
        SET RESULT = -1; -- City name doesn't exist
        SELECT 'THIS CITY NAME DOES NOT EXIST IN OUR DATABASE';
    END IF;
END //

DELIMITER ;
