-- Функция. которая возвращает количество записей
CREATE OR REPLACE FUNCTION count_orders_for_client(
    p_client_id NUMBER
) RETURN NUMBER
IS
    v_order_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_order_count
    FROM Orders
    WHERE ClientID = p_client_id;

    RETURN v_order_count;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        RETURN NULL;
END count_orders_for_client;
/
