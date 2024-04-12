-- Заказы чек которых больше 6000
SELECT
    O.ID AS OrderID,
    C.FullName AS ClientName,
    C2.FullName AS CourierName,
    SUM(P.Price * OD.Quantity) AS TotalAmount
FROM
    Orders O
JOIN
    Clients C ON O.ClientID = C.ID
JOIN
    Couriers C2 ON O.CourierID = C2.ID
JOIN
    OrderDetails OD ON O.ID = OD.OrderID
JOIN
    Pizzas P ON OD.PizzaID = P.ID
GROUP BY
    O.ID, C.FullName, C2.FullName
HAVING
    SUM(P.Price * OD.Quantity) > 6000;
