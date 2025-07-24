CREATE DATABASE TravelPlanner_db;
USE TravelPlanner_db;
CREATE TABLE Destinations (
    destination_id INT PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50),
    category VARCHAR(30),
    avg_cost_per_day INT
);

CREATE TABLE Trips (
    trip_id INT PRIMARY KEY,
    destination_id INT,
    traveler_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    budget INT,
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id)
);
INSERT INTO Destinations VALUES
(1, 'Goa', 'India', 'Beach', 2500),
(2, 'Jaipur', 'India', 'Historical', 2200),
(3, 'Paris', 'France', 'Historical', 4000),
(4, 'Bali', 'Indonesia', 'Beach', 2800),
(5, 'Zurich', 'Switzerland', 'Nature', 5000),
(6, 'Queenstown', 'New Zealand', 'Adventure', 4500);

INSERT INTO Trips VALUES
(101, 1, 'Aarav Mehta', '2025-02-01', '2025-02-05', 13000),
(102, 2, 'Meera Iyer', '2025-03-01', '2025-03-08', 16000),
(103, 3, 'David Lee', '2025-04-15', '2025-04-22', 30000),
(104, 4, 'Aarav Mehta', '2025-01-10', '2025-01-12', 8500),
(105, 5, 'Emily Zhang', '2025-05-01', '2025-05-10', 48000),
(106, 6, 'Rohan Singh', '2025-06-01', '2025-06-07', 34000),
(107, 1, 'Priya Sharma', '2023-12-10', '2023-12-15', 14000),
(108, 4, 'Meera Iyer', '2024-11-01', '2024-11-05', 12000),
(109, 3, 'Aarav Mehta', '2024-08-20', '2024-08-25', 25000),
(110, 2, 'David Lee', '2022-06-01', '2022-06-05', 11000);

-- 1. Show all trips to destinations in “India”.
SELECT t.*
FROM Trips t
JOIN Destinations d ON t.destination_id = d.destination_id
WHERE d.country = 'India';


-- 2. List all destinations with an average cost below 3000.
SELECT * FROM Destinations
WHERE avg_cost_per_day < 3000;


-- 3. Calculate the number of days for each trip.
SELECT trip_id, traveler_name, start_date, end_date,
       DATEDIFF(end_date, start_date) + 1 AS trip_duration_days
FROM Trips;

-- 4. List all trips that last more than 7 days.
SELECT * FROM Trips
WHERE DATEDIFF(end_date, start_date) + 1 > 7;


-- 5. List traveler name, destination city, and total trip cost.
SELECT t.traveler_name, d.city,
       (DATEDIFF(t.end_date, t.start_date) + 1) * d.avg_cost_per_day AS total_cost
FROM Trips t
JOIN Destinations d ON t.destination_id = d.destination_id;


-- 6. Find the total number of trips per country.
SELECT d.country, COUNT(*) AS total_trips
FROM Trips t
JOIN Destinations d ON t.destination_id = d.destination_id
GROUP BY d.country;

-- 7. Show average budget per country.
SELECT d.country, AVG(t.budget) AS avg_budget
FROM Trips t
JOIN Destinations d ON t.destination_id = d.destination_id
GROUP BY d.country;


-- 8. Find which traveler has taken the most trips.

SELECT traveler_name, COUNT(*) AS trip_count
FROM Trips
GROUP BY traveler_name
ORDER BY trip_count DESC
LIMIT 1;

-- 9. Show destinations that haven’t been visited yet.

SELECT * FROM Destinations
WHERE destination_id NOT IN (SELECT DISTINCT destination_id FROM Trips);


-- 10. Find the trip with the highest cost per day.
SELECT t.*, d.city,
       (t.budget / (DATEDIFF(t.end_date, t.start_date) + 1)) AS cost_per_day
FROM Trips t
JOIN Destinations d ON t.destination_id = d.destination_id
ORDER BY cost_per_day DESC
LIMIT 1;


-- 11. Update the budget for a trip that was extended by 3 days.
-- First, calculate the new budget:
-- Original duration = 5 days, now becomes 8 days
-- avg_cost_per_day = 2500 (Goa)

UPDATE Trips
SET budget = 2500 * 8  -- new budget based on extended duration
WHERE trip_id = 101;


-- 12. Delete all trips completed before Jan 1, 2023.
DELETE FROM Trips
WHERE end_date < '2023-01-01';


