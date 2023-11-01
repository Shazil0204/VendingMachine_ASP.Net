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
