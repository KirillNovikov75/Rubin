-- Удаляет информацию про заказ номер 6
DELETE FROM OrderDetails
WHERE OrderID = 6;

DELETE FROM Orders
WHERE ID = 6;

COMMIT;
