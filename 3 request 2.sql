-- Номер телефона клиента, количество заказов и их общий чек
SELECT
    C.FullName AS ClientName,
    C.PhoneNumber AS ClientPhoneNumber,
    COUNT(DISTINCT O.ID) AS TotalOrders,
    SUM(P.Price * OD.Quantity) AS TotalAmount
FROM
    Clients C
JOIN
    Orders O ON C.ID = O.ClientID
JOIN
    OrderDetails OD ON O.ID = OD.OrderID
JOIN
    Pizzas P ON OD.PizzaID = P.ID
GROUP BY
    C.FullName, C.PhoneNumber;
