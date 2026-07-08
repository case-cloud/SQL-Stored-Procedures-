CREATE TABLE IF NOT EXISTS customers (
    id_customer INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    login VARCHAR(36)
);

CREATE TABLE IF NOT EXISTS products (
    id_product INT PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    id_employee INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    login VARCHAR(36)
);

CREATE TABLE IF NOT EXISTS orders (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    order_number VARCHAR(20) NOT NULL,
    id_customer INT,
    id_employee INT,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customers(id_customer),
    FOREIGN KEY (id_employee) REFERENCES employees(id_employee)
);

CREATE TABLE IF NOT EXISTS order_items (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_order INT,
    id_product INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_order) REFERENCES orders(id_order),
    FOREIGN KEY (id_product) REFERENCES products(id_product)
);