
-- Create Database
CREATE DATABASE  supply_chain;
USE supply_chain;

-- Suppliers Table
CREATE TABLE  suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    contact_info VARCHAR(255)
);

-- Inventory Table
CREATE TABLE  inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    reorder_level INT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity_ordered INT,
    order_date DATE,
    delivery_date DATE,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);


INSERT INTO suppliers (name, contact_info) VALUES
('Alpha Supplies', 'alpha@example.com'),
('Beta Traders', 'beta@example.com'),
('Gamma Goods', 'gamma@example.com'),
('Delta Distributors', 'delta@example.com'),
('Epsilon Enterprises', 'epsilon@example.com'),
('Zeta Zone', 'zeta@example.com'),
('Eta Exports', 'eta@example.com'),
('Theta Traders', 'theta@example.com'),
('Iota Imports', 'iota@example.com'),
('Kappa Kargo', 'kappa@example.com');


INSERT INTO inventory (product_name, quantity, reorder_level, supplier_id) VALUES
('Widget A', 150, 50, 1),
('Gadget B', 70, 30, 2),
('Tool C', 45, 20, 3),
('Component D', 20, 10, 4),
('Machine E', 90, 40, 5),
('Device F', 110, 50, 6),
('Unit G', 60, 25, 7),
('Part H', 33, 15, 8),
('Accessory I', 75, 30, 9),
('Item J', 200, 60, 10);


INSERT INTO orders (product_name, quantity_ordered, order_date, delivery_date, supplier_id) VALUES
('Widget A', 100, '2025-07-20', '2025-07-23', 1),
('Gadget B', 60, '2025-07-21', '2025-07-25', 2),
('Tool C', 30, '2025-07-22', '2025-07-26', 3),
('Component D', 15, '2025-07-18', '2025-07-22', 4),
('Machine E', 45, '2025-07-19', '2025-07-23', 5),
('Device F', 55, '2025-07-20', '2025-07-24', 6),
('Unit G', 20, '2025-07-17', '2025-07-21', 7),
('Part H', 25, '2025-07-16', '2025-07-20', 8),
('Accessory I', 80, '2025-07-15', '2025-07-19', 9),
('Item J', 90, '2025-07-14', '2025-07-18', 10);

-- 3. Basic CRUD Operatiov
SELECT * FROM suppliers;

UPDATE suppliers
SET contact_info = 'support@beta-traders.com'
WHERE name = 'Beta Traders';

SELECT * FROM inventory WHERE quantity < reorder_level;


UPDATE inventory
SET quantity = quantity + 50
WHERE product_name = 'Tool C';

SELECT * FROM orders WHERE delivery_date > order_date;


UPDATE orders
SET quantity_ordered = 120
WHERE product_name = 'Accessory I';


-- 3. Stored Procedure – Auto-Reorder Trigger

DELIMITER //
CREATE PROCEDURE auto_reorder_check()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT;
    DECLARE qty INT;
    DECLARE rlevel INT;
    DECLARE sid INT;

    DECLARE cur CURSOR FOR
        SELECT inventory_id, quantity, reorder_level, supplier_id FROM inventory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO pid, qty, rlevel, sid;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF qty <= rlevel THEN
            INSERT INTO orders (product_name, quantity_ordered, order_date, delivery_date, supplier_id)
            SELECT product_name, 100, CURDATE(), CURDATE() + INTERVAL 5 DAY, supplier_id
            FROM inventory WHERE inventory_id = pid;
        END IF;
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;
