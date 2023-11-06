DELIMITER //

CREATE PROCEDURE UPDATE_VM(
    IN DBName VARCHAR(50),
    IN ProductID INT,
    IN ProductName VARCHAR(30),
    IN ProductURL TEXT,
    IN Stock INT,
    IN Price INT,
    IN BrandID INT,
    IN TypeID INT,
    OUT RESULT INT
)
BEGIN
    DECLARE v_SQL TEXT;

    -- Check if the database exists
    IF EXISTS (
        SELECT schema_name 
        FROM information_schema.schemata 
        WHERE schema_name = DBName
    ) THEN
        -- Prepare the update statement
        SET v_SQL = CONCAT('UPDATE `', DBName, '`.Products SET 
            ProductName = ?', 
            ', ProductURL = ?', 
            ', Stock = ?', 
            ', Price = ?', 
            ', BrandID = ?', 
            ', TypeID = ? 
        WHERE ProductID = ?');

        -- Execute the prepared statement with provided parameters
        PREPARE stmt FROM v_SQL;
        EXECUTE stmt USING ProductName, ProductURL, Stock, Price, BrandID, TypeID, ProductID;
        DEALLOCATE PREPARE stmt;

        SET RESULT = 0; -- Indicating success
        SELECT CONCAT('SYSTEM HAVE UPDATED TABLE IN DATABASE `', DBName, '` SUCCESSFULLY');
    ELSE
        SET RESULT = -1; -- Database not found
        SELECT 'SYSTEM CAN''T FIND A DATABASE WITH THIS NAME';
    END IF;
END //

DELIMITER ;
