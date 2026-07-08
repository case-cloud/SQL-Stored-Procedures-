DELIMITER $$

CREATE PROCEDURE Get_Inventory_Status()
BEGIN
    SELECT
        p.article,
        p.name,
        COALESCE(SUM(oi.quantity), 0) AS sold_quantity,
        CASE
            WHEN COALESCE(SUM(oi.quantity), 0) > 50 THEN 'Высокий спрос'
            WHEN COALESCE(SUM(oi.quantity), 0) > 20 THEN 'Средний спрос'
            ELSE 'Низкий спрос'
        END AS demand_level
    FROM products p
    LEFT JOIN order_items oi ON p.id_product = oi.id_product
    GROUP BY p.id_product, p.article, p.name
    ORDER BY sold_quantity DESC;
END$$

CREATE PROCEDURE Get_Order_Status_Report()
BEGIN
    SELECT
        o.status,
        COUNT(o.id_order) AS order_count,
        COUNT(DISTINCT o.id_customer) AS unique_customers,
        SUM(oi.quantity * oi.price) AS revenue
    FROM orders o
    LEFT JOIN order_items oi ON o.id_order = oi.id_order
    GROUP BY o.status;
END$$

CREATE PROCEDURE Get_Daily_Revenue(IN p_Start_Date DATE, IN p_End_Date DATE)
BEGIN
    SELECT
        o.order_date,
        COUNT(o.id_order) AS orders_count,
        SUM(oi.quantity * oi.price) AS daily_revenue
    FROM orders o
    INNER JOIN order_items oi ON o.id_order = oi.id_order
    WHERE o.order_date BETWEEN p_Start_Date AND p_End_Date
    GROUP BY o.order_date
    ORDER BY o.order_date;
END$$

DELIMITER ;