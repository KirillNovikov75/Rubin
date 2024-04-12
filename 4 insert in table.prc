-- Процедура вставки данных в таблицу
create or replace procedure insert_in_table(
    ID2 NUMBER,
    FullName2 VARCHAR2,
    PhoneNumber2 NUMBER,
    HireDate2 DATE,
    DismissalDate2 Date
)
is
begin
  insert into Couriers (ID, FullName, PhoneNumber, HireDate, DismissalDate)
    values (ID2, FullName2, PhoneNumber2, HireDate2, DismissalDate2);
    DBMS_OUTPUT.PUT_LINE('Запись вставлена');
exception
    when others then
        DBMS_OUTPUT.PUT_LINE('Ошибка при вставке записи: ' || SQLERRM);       
end insert_in_table;
/
