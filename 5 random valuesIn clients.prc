-- «аполнение таблицы случайными значени€ми
CREATE OR REPLACE PROCEDURE random_valuesIn_clients 
IS
  TYPE NameArray IS VARRAY(7) OF VARCHAR2(50);
  TYPE SurnameArray IS VARRAY(7) OF VARCHAR2(50);

  fn NameArray := NameArray('Scarlett', 'Lucas', 'Isabella', 'Grace', 'Emma', 'Elijah', 'Sophia');
  lkn SurnameArray := SurnameArray('Johnson', 'Smith', 'Anderson', 'Taylor', 'Miller', 'Clark', 'Robinson');

  v_id NUMBER;
  v_full_name VARCHAR2(255);
  v_phone_number VARCHAR2(11);

BEGIN
  SELECT COUNT(ID) INTO v_id FROM Clients;

  v_full_name := fn(DBMS_RANDOM.VALUE(1, 7)) || ' ' || lkn(DBMS_RANDOM.VALUE(1, 7));
  v_phone_number := TO_CHAR(TRUNC(8 + DBMS_RANDOM.VALUE(1, 999)), 'FM00000000000');

  INSERT INTO Clients (ID, FullName, PhoneNumber)
  VALUES (v_id + 1, v_full_name, v_phone_number);

END random_valuesIn_clients;
/
