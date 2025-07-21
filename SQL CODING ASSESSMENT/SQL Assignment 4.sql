CREATE DATABASE MovieRental_db;
USE MovieRental_db;

-- 1. Movies Table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    rental_rate DECIMAL(6,2)
);

-- 2. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- 3. Rentals Table
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    movie_id INT,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Movies
INSERT INTO movies (title, genre, release_year, rental_rate) VALUES
('Inception', 'Sci-Fi', 2010, 150.00),
('The Godfather', 'Crime', 1972, 120.00),
('Avengers: Endgame', 'Action', 2019, 180.00),
('Soul', 'Animation', 2020, 100.00),
('Dune', 'Sci-Fi', 2021, 160.00);

-- Customers
INSERT INTO customers (name, email, city) VALUES
('Amit Sharma', 'amit@example.com', 'Delhi'),
('Neha Patel', 'neha@example.com', 'Bangalore'),
('Rahul Verma', 'rahul@example.com', 'Chennai'),
('Sana Khan', 'sana@example.com', 'Mumbai'),
('Karthik Iyer', 'karthik@example.com', 'Bangalore');

-- Rentals
INSERT INTO rentals (customer_id, movie_id, rental_date, return_date) VALUES
(1, 1, '2024-06-01', '2024-06-05'),
(1, 3, '2024-06-10', '2024-06-13'),
(2, 2, '2024-06-15', '2024-06-20'),
(3, 5, '2024-06-18', NULL),  -- Not yet returned
(4, 4, '2024-06-21', '2024-06-23'),
(5, 1, '2024-06-25', NULL),  -- Same movie rented again
(2, 5, '2024-06-26', '2024-06-30'),
(3, 2, '2024-07-01', '2024-07-04');

-- 1. Retrieve all movies rented by a customer named 'Amit Sharma'
SELECT m.title
FROM movies m
JOIN rentals r ON m.movie_id = r.movie_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE c.name = 'Amit Sharma';

-- 2. Show the details of customers from 'Bangalore'
SELECT *
FROM customers
WHERE city = 'Bangalore';

-- 3. List all movies released after the year 2020
SELECT *
FROM movies
WHERE release_year > 2020;

-- 4. Count how many movies each customer has rented
SELECT c.name, COUNT(r.rental_id) AS total_rentals
FROM customers c
LEFT JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.name;

-- 5. Find the most rented movie title
SELECT m.title, COUNT(r.rental_id) AS times_rented
FROM movies m
JOIN rentals r ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY times_rented DESC
LIMIT 1;

-- 6. Calculate total revenue earned from all rentals
SELECT SUM(m.rental_rate) AS total_revenue
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id;

-- 7. List all customers who have never rented a movie
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM rentals
);

-- 8. Show each genre and the total revenue from that genre
SELECT m.genre, SUM(m.rental_rate) AS genre_revenue
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.genre;

-- 9. Find the customer who spent the most money on rentals
SELECT c.name, SUM(m.rental_rate) AS total_spent
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
JOIN customers c ON r.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- 10. Display movie titles that were rented and not yet returned
SELECT m.title
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.return_date IS NULL;
