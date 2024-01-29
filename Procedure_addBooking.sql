DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN booking_date DATE, IN table_number INT)
BEGIN
    -- Add a new booking record
    INSERT INTO Bookings (BookingID, CustomerID, Date, TableNumber)
    VALUES (booking_id, customer_id, booking_date, table_number);

    -- SELECT 'New booking added!' AS Status;
END //

DELIMITER ;
