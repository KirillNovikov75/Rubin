--  урьер и их доходность в день
SELECT
    C.FullName AS CourierName,
    TRUNC(SYSDATE - C.HireDate) AS WorkExperience,
    SUM(P.Price * OD.Quantity) AS TotalAmount,
    ROUND(SUM(P.Price * OD.Quantity) / TRUNC(SYSDATE - C.HireDate), 2) AS AmountPerDay
FROM
    Couriers C
JOIN
    Orders O ON C.ID = O.CourierID
JOIN
    OrderDetails OD ON O.ID = OD.OrderID
JOIN
    Pizzas P ON OD.PizzaID = P.ID
GROUP BY
    C.ID, C.FullName, C.HireDate;
