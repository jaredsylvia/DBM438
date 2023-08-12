-- The stored procedures contain semicolons, so we need to change the delimiter here.
DELIMITER //

CREATE PROCEDURE InsertAuthor(
    IN p_AuthorID INT,
    IN p_Lname VARCHAR(50),
    IN p_Fname VARCHAR(50)
)
BEGIN
    -- Check if the input data is valid, if not, raise an error.
    -- AuthorID should be an INT of minimum 4 characters other fiels greater than 0.
    IF LENGTH(p_Lname) > 0 AND LENGTH(p_Fname) > 0 AND LENGTH(CAST(p_AuthorID AS CHAR)) >= 4 THEN
       -- If the input data is valid, insert the data into the table.
        INSERT INTO AUTHOR (AuthorID, Lname, Fname) VALUES (p_AuthorID, p_Lname, p_Fname);
                
    ELSE
        -- If the input data is not valid, raise an error of type '45000' then set the message text.
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid input data';
    END IF;
END //
-- Restore the delimiter to the default
DELIMITER ;

-- To see the stored procedure in the database
SHOW CREATE PROCEDURE InsertAuthor;

-- To use the stored procedure we need to change the delimiter again..
DELIMITER //

-- Call the stored procedure with valid input data
CALL InsertAuthor(1234, 'Doe', 'John')//

-- Now we'll try to call the stored procedure with invalid input data
CALL InsertAuthor(12, 'Invalid', 'Data')//

-- Restore the delimiter to the default
DELIMITER ;

-- Show the data in the table
SELECT * FROM AUTHOR WHERE Lname = 'Doe' AND Fname = 'John';

-- To see the procedure in the database
SHOW CREATE PROCEDURE InsertAuthor;

-- Finally, drop the procedure
DROP PROCEDURE InsertAuthor;



-- Delete the John Doe record so that we can insert it again.
DELETE FROM AUTHOR
WHERE AuthorID = 1234;



