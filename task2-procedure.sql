DELIMITER //

CREATE PROCEDURE GetOrderDetail(IN inputCustomerID INT)
BEGIN
    SET @stmt = CONCAT('SELECT OrderID, Quantity, Cost FROM Orders WHERE CustomerID = ?', inputCustomerID);
    PREPARE stmt FROM @stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
