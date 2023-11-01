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
