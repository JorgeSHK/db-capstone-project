DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_status VARCHAR(10);

    -- Start the transaction
    START TRANSACTION;

    -- Add a new booking record
    INSERT INTO Bookings (BookingDate, TableNumber)
    VALUES (booking_date, table_number);

    -- Check if the table is already booked on the given date
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM Bookings
                WHERE TableNumber = table_number AND BookingDate = booking_date
                AND CustomerName <> ''
            ) THEN 'Booked'
            ELSE 'Available'
        END INTO table_status;

    -- Check the table status and commit or rollback the transaction
    IF table_status = 'Booked' THEN
        -- Rollback the transaction if the table is already booked
        ROLLBACK;
        SELECT 'Table ' AS Status, table_number AS TableNumber, ' is already booked on ' AS Message, booking_date AS BookingDate;
    ELSE
        -- Commit the transaction if the table is available
        COMMIT;
        SELECT 'Booking successful for Table ' AS Status, table_number AS TableNumber, ' on ' AS Message, booking_date AS BookingDate;
    END IF;
END //

DELIMITER ;
