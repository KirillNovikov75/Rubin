-- Количество доставок конкретным курьером конкретному клиенту
SELECT
    C.FullName AS CourierName,
    Cl.FullName AS ClientName,
    COUNT(*) AS DeliveryCount
FROM
    Orders O
JOIN
    Couriers C ON O.CourierID = C.ID
JOIN
    Clients Cl ON O.ClientID = Cl.ID
GROUP BY
    C.FullName, Cl.FullName
ORDER BY
    COUNT(*) DESC;
