CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    age INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
-- Insert into employees

INSERT INTO employees VALUES
(101, 'Amit Sharma', 'Engineering', 60000, 30),
(102, 'Neha Reddy', 'Marketing', 45000, 28),
(103, 'Faizan Ali', 'Engineering', 58000, 32),
(104, 'Divya Mehta', 'HR', 40000, 29),
(105, 'Ravi Verma', 'Sales', 35000, 26);

-- Insert into departments
INSERT INTO departments VALUES
(1, 'Engineering', 'Bangalore'),
(2, 'Marketing', 'Mumbai'),
(3, 'HR', 'Delhi'),
(4, 'Sales', 'Chennai');

-- 1. Display all employees
SELECT * FROM employees;

-- 2. Show only emp_name and salary of all employees
SELECT emp_name, salary FROM employees;

-- 3. Find employees with a salary greater than 40,000
SELECT * FROM employees
WHERE salary > 40000;

-- 4. List employees between age 28 and 32 (inclusive)
SELECT * FROM employees
WHERE age BETWEEN 28 AND 32;

-- 5. Show employees who are not in the HR department
SELECT * FROM employees
WHERE department != 'HR';

-- 6. Sort employees by salary in descending order
SELECT * FROM employees
ORDER BY salary DESC;

-- 7. Count the number of employees in the table
SELECT COUNT(*) AS total_employees FROM employees;

-- 8. Find the employee with the highest salary
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1



