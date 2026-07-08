DELIMITER $$

CREATE PROCEDURE Get_Sales_By_Product()
BEGIN
    SELECT
        p.name AS product_name,
        p.article,
        SUM(oi.quantity) AS total_sold,
        SUM(oi.quantity * oi.price) AS revenue
    FROM products p
    LEFT JOIN order_items oi ON p.id_product = oi.id_product
    GROUP BY p.id_product, p.name, p.article
    ORDER BY revenue DESC;
END$$

CREATE PROCEDURE Get_Sales_By_Employee(IN p_Employee_Login VARCHAR(36))
BEGIN
    SELECT
        e.full_name,
        COUNT(DISTINCT o.id_order) AS total_orders,
        SUM(oi.quantity * oi.price) AS total_revenue
    FROM employees e
    INNER JOIN orders o ON e.id_employee = o.id_employee
    LEFT JOIN order_items oi ON o.id_order = oi.id_order
    WHERE e.login = p_Employee_Login
    GROUP BY e.id_employee, e.full_name;
END$$

CREATE PROCEDURE Get_Customer_Orders(IN p_Customer_Login VARCHAR(36))
BEGIN
    SELECT
        o.order_number,
        o.order_date,
        o.status,
        p.name AS product_name,
        oi.quantity,
        oi.price,
        (oi.quantity * oi.price) AS item_total
    FROM customers c
    INNER JOIN orders o ON c.id_customer = o.id_customer
    LEFT JOIN order_items oi ON o.id_order = oi.id_order
    LEFT JOIN products p ON oi.id_product = p.id_product
    WHERE c.login = p_Customer_Login
    ORDER BY o.order_date DESC;
END$$

CREATE PROCEDURE Calculate_Monthly_Stats(
    IN p_Month INT,
    IN p_Year INT,
    OUT p_Total_Orders INT,
    OUT p_Total_Revenue DECIMAL(15,2)
)
BEGIN
    SELECT
        COUNT(DISTINCT o.id_order),
        COALESCE(SUM(oi.quantity * oi.price), 0)
    INTO p_Total_Orders, p_Total_Revenue
    FROM orders o
    LEFT JOIN order_items oi ON o.id_order = oi.id_order
    WHERE MONTH(o.order_date) = p_Month
      AND YEAR(o.order_date) = p_Year;
END$$

CREATE PROCEDURE Get_Top_Customers(IN p_Limit INT)
BEGIN
    SELECT
        c.full_name,
        COUNT(DISTINCT o.id_order) AS order_count,
        SUM(oi.quantity * oi.price) AS total_spent
    FROM customers c
    INNER JOIN orders o ON c.id_customer = o.id_customer
    INNER JOIN order_items oi ON o.id_order = oi.id_order
    GROUP BY c.id_customer, c.full_name
    ORDER BY total_spent DESC
    LIMIT p_Limit;
END$$

DELIMITER ;