INSERT INTO customers (full_name, login) VALUES
    ('Алексеев Максим Анатольевич', 'cust_alekseev'),
    ('Иванова Ирина Дмитриевна', 'cust_ivanova');

INSERT INTO products (article, name, price) VALUES
    ('ЛП-0000002', 'Ноутбук HP', 2400.00),
    ('ЛП-0000001', 'Мышь беспроводная', 150.00),
    ('ЛП-0000005', 'Клавиатура механическая', 540.90);

INSERT INTO employees (full_name, login) VALUES
    ('Иванов Иван Иванович', 'emp_ivanov'),
    ('Петров Пётр Петрович', 'emp_petrov');

INSERT INTO orders (order_number, id_customer, id_employee, order_date, status) VALUES
    ('ЗК000000006', 1, 1, '2024-07-01', 'Отправлен'),
    ('ЗК000000007', 2, 2, '2024-07-02', 'В сборке'),
    ('ЗК000000008', 1, 1, '2024-07-05', 'Собран');

INSERT INTO order_items (id_order, id_product, quantity, price) VALUES
    (1, 1, 2, 2400.00),
    (2, 2, 1, 150.00),
    (3, 3, 2, 540.90);

CALL Get_Sales_By_Product();

CALL Get_Sales_By_Employee('emp_ivanov');

CALL Get_Customer_Orders('cust_alekseev');

CALL Get_Top_Customers(5);

CALL Get_Inventory_Status();

CALL Get_Order_Status_Report();

CALL Get_Daily_Revenue('2024-07-01', '2024-07-31');

CALL Calculate_Monthly_Stats(7, 2024, @total_orders, @total_revenue);
SELECT @total_orders AS total_orders, @total_revenue AS total_revenue;
