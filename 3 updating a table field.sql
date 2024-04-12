-- Добавляет префикс, обозначающий прекращение готовки пиццы, которую заказали меньше всего раз
UPDATE Pizzas
SET Name = 'NotCooking ' || Name
WHERE ID = (
    SELECT PizzaID
    FROM (
        SELECT PizzaID, COUNT(*) AS order_count
        FROM OrderDetails OD
        JOIN Pizzas P ON OD.PizzaID = P.ID
        WHERE NOT P.Name LIKE 'NotCooking%'
        GROUP BY PizzaID
        ORDER BY order_count ASC
        FETCH FIRST ROW ONLY
    ) least_ordered_pizza
);

COMMIT;
