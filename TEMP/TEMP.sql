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

        -- [rest of your table creation and data insertion logic goes here]
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
