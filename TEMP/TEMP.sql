DELIMITER //

CREATE PROCEDURE DELETING_VM(IN CITY VARCHAR(100), OUT RESULT INT)
BEGIN
    DECLARE v_SQL TEXT;

    -- Check if the Database name exists in the DBRecords table
    IF EXISTS (SELECT 1 FROM DBRecords WHERE DBName = CITY) THEN
        -- Drop the database
        SET v_SQL = CONCAT('DROP DATABASE `', CITY, '`');
        PREPARE stmt FROM v_SQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Delete the record from the DBRecords table
        DELETE FROM DBRecords WHERE DBName = CITY;

        SET RESULT = 0; -- Indicating success
        SELECT 'DONE';
    ELSE
        SET RESULT = -1; -- Database not found in DBRecords
        SELECT 'THERE IS NO DATABASE WITH THIS NAME. PLEASE CHECK YOUR INSERT TEXT AGAIN THANKS!';
    END IF;
END //

DELIMITER ;
