-- Сколько раз заказали каждую пиццу и сколько они стоили
SELECT
    P.ID AS PizzaID,
    P.Name AS PizzaName,
    COUNT(OD.ID) AS TimesOrdered,
    SUM(P.Price * OD.Quantity) AS TotalAmount
FROM
    Pizzas P
JOIN
    OrderDetails OD ON P.ID = OD.PizzaID
GROUP BY
    P.ID, P.Name;
