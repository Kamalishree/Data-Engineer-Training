CREATE DATABASE FitnessTracker_db;
USE FitnessTracker_db;

CREATE TABLE Exercises (
    exercise_id INT PRIMARY KEY,
    exercise_name VARCHAR(50),
    category VARCHAR(30),
    calories_burn_per_min INT
);

CREATE TABLE WorkoutLog (
    log_id INT PRIMARY KEY,
    exercise_id INT,
    date DATE,
    duration_min INT,
    mood VARCHAR(20),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
);

INSERT INTO Exercises VALUES
(1, 'Running', 'Cardio', 10),
(2, 'Cycling', 'Cardio', 8),
(3, 'Weight Lifting', 'Strength', 6),
(4, 'Yoga', 'Flexibility', 4),
(5, 'HIIT', 'Cardio', 12);

INSERT INTO WorkoutLog VALUES
(101, 1, '2025-03-01', 30, 'Energized'),
(102, 1, '2025-03-05', 45, 'Tired'),
(103, 2, '2025-03-03', 25, 'Normal'),
(104, 2, '2025-03-10', 35, 'Energized'),
(105, 3, '2025-03-02', 40, 'Tired'),
(106, 3, '2025-03-06', 50, 'Normal'),
(107, 4, '2025-03-07', 30, 'Energized'),
(108, 4, '2025-03-09', 20, 'Normal'),
(109, 5, '2025-03-04', 15, 'Tired'),
(110, 5, '2025-03-11', 20, 'Energized');

-- Show all exercises under the “Cardio” category.

SELECT * FROM Exercises
WHERE category = 'Cardio';

-- 2. Show workouts done in the month of March 2025.

SELECT * FROM WorkoutLog
WHERE MONTH(date) = 3 AND YEAR(date) = 2025;


-- 3. Calculate total calories burned per workout.

SELECT log_id, exercise_id, date, duration_min,
       duration_min * calories_burn_per_min AS total_calories
FROM WorkoutLog wl
JOIN Exercises e ON wl.exercise_id = e.exercise_id;


-- 4. Average workout duration per category.

SELECT e.category, AVG(wl.duration_min) AS avg_duration
FROM WorkoutLog wl
JOIN Exercises e ON wl.exercise_id = e.exercise_id
GROUP BY e.category;


-- 5. List exercise name, date, duration, and calories burned.

SELECT e.exercise_name, wl.date, wl.duration_min,
       wl.duration_min * e.calories_burn_per_min AS calories_burned
FROM WorkoutLog wl
JOIN Exercises e ON wl.exercise_id = e.exercise_id;

-- 6. Show total calories burned per day.

SELECT wl.date, SUM(wl.duration_min * e.calories_burn_per_min) AS total_calories_burned
FROM WorkoutLog wl
JOIN Exercises e ON wl.exercise_id = e.exercise_id
GROUP BY wl.date
ORDER BY wl.date;

-- 7. Find the exercise that burned the most calories in total.

SELECT e.exercise_name, SUM(wl.duration_min * e.calories_burn_per_min) AS total_burned
FROM WorkoutLog wl
JOIN Exercises e ON wl.exercise_id = e.exercise_id
GROUP BY e.exercise_name
ORDER BY total_burned DESC
LIMIT 1;


-- 8. List exercises never logged in the workout log.

SELECT * FROM Exercises
WHERE exercise_id NOT IN (SELECT DISTINCT exercise_id FROM WorkoutLog);


-- 9. Show workouts where mood was “Tired” and duration > 30 mins.

SELECT * FROM WorkoutLog
WHERE mood = 'Tired' AND duration_min > 30;


-- 10. Update a workout log to correct a wrongly entered mood.

UPDATE WorkoutLog
SET mood = 'Normal'
WHERE log_id = 102;  -- Change log_id as needed


-- 11. Update the calories per minute for “Running”.

UPDATE Exercises
SET calories_burn_per_min = 11
WHERE exercise_name = 'Running';

-- 12. Delete all logs from February 2024.

DELETE FROM WorkoutLog
WHERE MONTH(date) = 2 AND YEAR(date) = 2024;






