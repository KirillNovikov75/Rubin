-- Создание таблицы Курьеры
CREATE TABLE Couriers (
    ID NUMBER PRIMARY KEY,
    FullName VARCHAR2(255),
    PhoneNumber VARCHAR2(11),
    HireDate DATE,
    DismissalDate Date
);

-- Создание таблицы Клиенты
CREATE TABLE Clients (
    ID NUMBER PRIMARY KEY,
    FullName VARCHAR2(255),
    PhoneNumber VARCHAR2(11)
);

-- Создание таблицы Пиццы
CREATE TABLE Pizzas (
    ID NUMBER PRIMARY KEY,
    Name VARCHAR2(255),
    Price NUMBER,
    Description VARCHAR2(500)
);
-- Создание таблицы Адреса
CREATE TABLE Addresses (
    ID NUMBER PRIMARY KEY,
    Address VARCHAR2(500)
);

-- Создание таблицы Заказы
CREATE TABLE Orders (
    ID NUMBER PRIMARY KEY,
    CourierID NUMBER,
    ClientID NUMBER,
    AddressID NUMBER,
    Landmark VARCHAR2(255),
    OrderComment VARCHAR2(1000),
    FOREIGN KEY (ClientID) REFERENCES Clients(ID),
    FOREIGN KEY (CourierID) REFERENCES Couriers(ID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(ID)
);

-- Создание таблицы Детали заказа
CREATE TABLE OrderDetails (
    ID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    PizzaID NUMBER,
    Quantity NUMBER,
    FOREIGN KEY (OrderID) REFERENCES Orders(ID),
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(ID)
);

COMMIT;
