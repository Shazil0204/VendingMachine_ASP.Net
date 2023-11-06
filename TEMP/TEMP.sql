-- ALL THE DATA THAT I HAVE TO SEND FROM MY PC TO THE SERVER WILL GO THROUGH HERE!

SET v_SQL = CONCAT(
    'USE ', QUOTE(CITY, '_VM'), ';

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
        (''ProductB3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 210, 75, 3, 1),
        (''ProductC1'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 120, 52, 1, 3),
        (''ProductC2'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 160, 62, 2, 1),
        (''ProductC3'', ''https://img.freepik.com/free-vector/realistic-hand-drawn-fuck-you-symbol_23-2148684365.jpg'', 220, 72, 3, 2);
');
