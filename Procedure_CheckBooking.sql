DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status VARCHAR(10);

    -- Check if the table is booked on the specified date
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM Bookings
                WHERE TableNumber = table_number AND BookingDate = booking_date
            ) THEN 'Booked'
            ELSE 'Available'
        END INTO booking_status;

    -- Display the booking status
    SELECT CONCAT('Table ', table_number, ' on ', booking_date, ' is ', booking_status) AS Status;
END //

DELIMITER ;
