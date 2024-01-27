SELECT
    c.CustomerID,
	c.FullName,
    o.OrderID,
    o.TotalCost,
    m.Name,
    m.Description
FROM
    customer c
JOIN
    orders o ON c.CustomerID = o.Customer_CustomerID
JOIN
    menu m ON o.MenuID = m.MenuID
WHERE
    o.TotalCost > 150
ORDER BY
    o.TotalCost ASC;
