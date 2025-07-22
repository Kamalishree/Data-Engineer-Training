CREATE DATABASE bookstore_db;
USE bookstore_db;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(8,2)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
INSERT INTO books (book_id, title, author, genre, price) VALUES
(1, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 550.00),
(2, 'Atomic Habits', 'James Clear', 'Self-help', 620.00),
(3, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 450.00),
(4, 'The Alchemist', 'Paulo Coelho', 'Fiction', 500.00),
(5, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 700.00);

INSERT INTO customers (customer_id, name, email, city) VALUES
(101, 'Anjali Rao', 'anjali@example.com', 'Hyderabad'),
(102, 'Ravi Sharma', 'ravi@example.com', 'Delhi'),
(103, 'Sneha Iyer', 'sneha@example.com', 'Hyderabad'),
(104, 'Vikram Singh', 'vikram@example.com', 'Chennai'),
(105, 'Divya Patel', 'divya@example.com', 'Mumbai');

INSERT INTO orders (order_id, customer_id, book_id, order_date, quantity) VALUES
(201, 101, 1, '2023-03-15', 2),
(202, 102, 2, '2023-02-10', 1),
(203, 103, 1, '2023-01-05', 1),
(204, 104, 3, '2022-12-25', 1),
(205, 105, 4, '2023-04-01', 3),
(206, 101, 5, '2023-05-20', 1),
(207, 102, 2, '2023-07-10', 2);

-- 1. List all books with price above 500
SELECT * FROM books
WHERE price > 500;

 -- 2. Show all customers from the city of ‘Hyderabad’
 SELECT * FROM customers
WHERE city = 'Hyderabad';

-- 3. Find all orders placed after ‘2023-01-01’
SELECT * FROM orders
WHERE order_date > '2023-01-01';

-- 4. Show customer names along with book titles they purchased
SELECT c.name AS customer_name, b.title AS book_title
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN books b ON o.book_id = b.book_id;

--  5. List each genre and total number of books sold in that genre
SELECT b.genre, SUM(o.quantity) AS total_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre;

-- 6. Find the total sales amount (price × quantity) for each book
SELECT b.title, SUM(b.price * o.quantity) AS total_sales
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.title;

-- 7. Show the customer who placed the highest number of orders
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 1;

--  8. Display average price of books by genre
SELECT genre, AVG(price) AS avg_price
FROM books
GROUP BY genre;

--  9. List all books that have not been ordered

DELETE FROM orders
WHERE book_id = 3;

SELECT * FROM books
WHERE book_id NOT IN (
    SELECT DISTINCT book_id FROM orders
    WHERE book_id IS NOT NULL
);


-- 10. Show the name of the customer who has spent the most in total
SELECT c.name, SUM(b.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN books b ON o.book_id = b.book_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;



