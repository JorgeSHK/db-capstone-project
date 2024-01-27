SELECT
    Name
FROM
    menu
WHERE
    MenuID = ANY (
        SELECT
            MenuID
        FROM
            orders
        GROUP BY
            MenuID
        HAVING
            COUNT(*) > 2
    );
