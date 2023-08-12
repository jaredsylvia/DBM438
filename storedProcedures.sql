-- The stored procedures contains semicolons, so we need to change the delimiter here.
DELIMITER //

CREATE PROCEDURE InsertAuthor(
    IN p_Lname VARCHAR(50),
    IN p_Fname VARCHAR(50)
)
BEGIN
    -- Check if the input data is valid, if not, raise an error. 
    -- In this case the condition is that each value must be at least 1 character long.
    IF LENGTH(p_Lname) > 0 AND LENGTH(p_Fname) > 0 THEN
       -- If the input data is valid, insert the data into the table
        INSERT INTO AUTHOR (Lname, Fname) VALUES (p_Lname, p_Fname);
                
    ELSE
        -- If the input data is not valid, raise an error of type '45000' then set the message text.
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid input data';
    END IF;
END //
-- Restore the delimiter to the default
DELIMITER ;

-- Here we can see the stored procedure in the database
SHOW CREATE PROCEDURE InsertAuthor;

-- To use the stored prodedure we need to change the delimiter again..
DELIMITER //

-- Call the stored procedure with valid input data
CALL InsertAuthor('Doe', 'John')//

-- Now we'll try to call the stored procedure with invalid input data
CALL InsertAuthor('', '')//

-- Restore the delimiter to the default
DELIMITER ;

-- Then show the data in the table
SELECT * FROM AUTHOR WHERE Lname = 'Doe' AND Fname = 'John';

-- TO see the procedure in the database
SHOW CREATE PROCEDURE InsertAuthor;

-- And finally drop the procedure
DROP PROCEDURE InsertAuthor;

/*
-- If you want to remove all the John Does after running this multiple times uncomment the following code
DELETE FROM AUTHOR
WHERE Lname = 'Doe' AND Fname = 'John';
*/


