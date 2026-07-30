-- Employee Database Analysis
-- SQL Data Analytics Project

CREATE DATABASE employee_analysis;
USE employee_analysis;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    experience_years INT,
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Aarav Sharma', 'IT', 'Data Analyst', 55000, 2, '2023-01-15'),
(2, 'Priya Verma', 'HR', 'HR Executive', 45000, 3, '2022-06-10'),
(3, 'Rahul Singh', 'Finance', 'Financial Analyst', 60000, 4, '2021-03-20'),
(4, 'Neha Gupta', 'IT', 'Software Developer', 70000, 5, '2020-08-12'),
(5, 'Arjun Mehta', 'Sales', 'Sales Executive', 40000, 2, '2023-04-18'),
(6, 'Sneha Kapoor', 'Marketing', 'Marketing Analyst', 52000, 3, '2022-09-05'),
(7, 'Karan Malhotra', 'IT', 'Data Analyst', 62000, 4, '2021-11-22'),
(8, 'Ananya Joshi', 'Finance', 'Accountant', 48000, 2, '2023-02-14'),
(9, 'Vikas Yadav', 'Sales', 'Sales Manager', 75000, 7, '2018-07-30'),
(10, 'Riya Agarwal', 'HR', 'HR Manager', 68000, 6, '2019-05-25');

-- 1. View all employees
SELECT *
FROM employees;

-- 2. Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 3. Average salary
SELECT ROUND(AVG(salary), 2) AS average_salary
FROM employees;

-- 4. Highest salary
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 5. Lowest salary
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 1;

-- 6. Average salary by department
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

-- 7. Number of employees in each department
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;

-- 8. Employees with salary greater than 60000
SELECT *
FROM employees
WHERE salary > 60000
ORDER BY salary DESC;

-- 9. Employees with more than 3 years of experience
SELECT *
FROM employees
WHERE experience_years > 3
ORDER BY experience_years DESC;

-- 10. Highest paid employee in each department
SELECT department,
       employee_name,
       salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);

-- 11. Employees sorted by joining date
SELECT *
FROM employees
ORDER BY joining_date ASC;

-- 12. Salary ranking
SELECT employee_name,
       department,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
