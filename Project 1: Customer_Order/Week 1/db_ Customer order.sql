CREATE DATABASE CustomerOrder_db;
USE CustomerOrder_db;


-- 1. MySQL Table Creation

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    region VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    delivery_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Delivery_Status table
CREATE TABLE Delivery_Status (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_status VARCHAR(50),
    updated_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


-- 2.Sample Insert Data (Optional for Testing

INSERT INTO Customers (name, email, region)
VALUES 
('Alice Johnson', 'alice.johnson@example.com', 'South'),
('Bob Smith', 'bob.smith@example.com', 'North'),
('Clara Lee', 'clara.lee@example.com', 'West'),
('David Kim', 'david.kim@example.com', 'East'),
('Evelyn Scott', 'evelyn.scott@example.com', 'South'),
('Frank Wright', 'frank.wright@example.com', 'North'),
('Grace Hall', 'grace.hall@example.com', 'West'),
('Henry Adams', 'henry.adams@example.com', 'East'),
('Isla Moore', 'isla.moore@example.com', 'South'),
('Jack Brown', 'jack.brown@example.com', 'West');


INSERT INTO Orders (customer_id, order_date, delivery_date, status)
VALUES
(1, '2025-07-10', '2025-07-15', 'Delivered'),
(2, '2025-07-11', '2025-07-20', 'Delayed'),
(3, '2025-07-12', '2025-07-17', 'Delivered'),
(4, '2025-07-13', '2025-07-19', 'In Transit'),
(5, '2025-07-14', '2025-07-18', 'Delayed'),
(6, '2025-07-15', '2025-07-19', 'Delivered'),
(7, '2025-07-16', '2025-07-21', 'Cancelled'),
(8, '2025-07-17', '2025-07-23', 'Delayed'),
(9, '2025-07-18', '2025-07-22', 'In Transit'),
(10, '2025-07-19', '2025-07-25', 'Delivered');


INSERT INTO Delivery_Status (order_id, delivery_status, updated_at)
VALUES
(1, 'Delivered', NOW()),
(2, 'Delayed', NOW()),
(3, 'Delivered', NOW()),
(4, 'In Transit', NOW()),
(5, 'Delayed', NOW()),
(6, 'Delivered', NOW()),
(7, 'Cancelled', NOW()),
(8, 'Delayed', NOW()),
(9, 'In Transit', NOW()),
(10, 'Delivered', NOW());

-- 3.CRUD Operations Example

-- Update order status
UPDATE Orders
SET status = 'In Transit'
WHERE order_id = 1;

-- Delete a delivery record
DELETE FROM Delivery_Status
WHERE delivery_id = 2;

-- Select orders for a customer
SELECT * FROM Orders
WHERE customer_id = 1;

-- 4.tored Procedure: Get Delayed Deliveries for a Customer

DELIMITER $$

CREATE PROCEDURE GetDelayedDeliveries(IN cust_id INT)
BEGIN
    SELECT o.order_id, o.order_date, o.delivery_date, ds.delivery_status
    FROM Orders o
    JOIN Delivery_Status ds ON o.order_id = ds.order_id
    WHERE o.customer_id = cust_id AND ds.delivery_status = 'Delayed';
END $$

DELIMITER ;
