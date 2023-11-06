DELIMITER //

CREATE PROCEDURE READ_VM(IN DBName VARCHAR(50), OUT RESULT INT)
BEGIN
    DECLARE v_SQL TEXT;

    -- Check if the database exists
    IF EXISTS (
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name = DBName
    ) THEN
        -- Use the database and fetch the required data
        SET v_SQL = CONCAT('USE `', DBName, '`;

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
        ');

        PREPARE stmt FROM v_SQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET RESULT = 0; -- Indicating success
        SELECT 'HERE YOU GO!';
    ELSE
        SET RESULT = -1; -- Database not found
        SELECT 'CAN''T FIND A DATABASE WITH THIS NAME';
    END IF;
END //

DELIMITER ;
