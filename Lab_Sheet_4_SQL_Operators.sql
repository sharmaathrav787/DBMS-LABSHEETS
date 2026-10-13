-- LAB SHEET 4: SQL OPERATORS
-- MySQL syntax
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2)
);
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT IGNORE INTO Student VALUES
(1, 'Aarav Sharma', 20, 'BTech AIML', 'Haridwar'),
(2, 'Riya Verma', 19, 'BTech CSE', 'Meerut'),
(3, 'Arjun Gupta', 21, 'BTech AIML', 'Noida'),
(4, 'Ananya Singh', 20, 'BTech IT', 'Delhi');
INSERT IGNORE INTO Employee VALUES
(101, 'Vikas Singh', 'IT', 45000.00),
(102, 'Neha Sharma', 'HR', 38000.00),
(103, 'Rahul Verma', 'Finance', 52000.00);
INSERT IGNORE INTO Product VALUES
(1, 'Keyboard', 799.00, 25),
(2, 'Mouse', 499.00, 40),
(3, 'Monitor', 8500.00, 10);

-- Arithmetic Operators
-- 1. Addition
SELECT 10 + 5 AS Addition;
-- 2. Subtraction
SELECT 10 - 5 AS Subtraction;
-- 3. Multiplication
SELECT 10 * 5 AS Multiplication;
-- 4. Division
SELECT 10 / 5 AS Division;
-- 5. Total amount = Price * Quantity
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount FROM Product;

-- Logical Operators
-- 6. AND
SELECT * FROM Student WHERE Age >= 20 AND City = 'Delhi';
-- 7. OR
SELECT * FROM Student WHERE City = 'Delhi' OR City = 'Meerut';
-- 8. NOT
SELECT * FROM Student WHERE NOT City = 'Delhi';
-- 9. Students in a specific course AND city
SELECT * FROM Student WHERE Course = 'BTech AIML' AND City = 'Haridwar';
-- 10. Employees in either of two departments
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';

-- Comparison Operators
-- 11. =
SELECT * FROM Student WHERE City = 'Delhi';
-- 12. >
SELECT * FROM Employee WHERE Salary > 40000;
-- 13. <
SELECT * FROM Student WHERE Age < 21;
-- 14. >= and <=
SELECT * FROM Employee WHERE Salary >= 38000 AND Salary <= 50000;
-- 15. <> / !=
SELECT * FROM Student WHERE City <> 'Delhi';
SELECT * FROM Student WHERE City != 'Delhi';

-- Special Operators
-- 16. BETWEEN
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 55000;
-- 17. IN
SELECT * FROM Student WHERE City IN ('Delhi', 'Meerut');
-- 18. NOT IN
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Meerut');
-- 19. LIKE names beginning with a particular letter
SELECT * FROM Student WHERE Name LIKE 'A%';
-- 20. IS NULL and IS NOT NULL
SELECT * FROM Student WHERE City IS NULL;
SELECT * FROM Student WHERE City IS NOT NULL;

-- Set Operations
-- 21. UNION
SELECT City AS Place FROM Student WHERE City IS NOT NULL
UNION
SELECT Department AS Place FROM Employee WHERE Department IS NOT NULL;
-- 22. UNION ALL
SELECT City AS Place FROM Student WHERE City IS NOT NULL
UNION ALL
SELECT Department AS Place FROM Employee WHERE Department IS NOT NULL;
-- 23. INTERSECT is not supported in MySQL. Equivalent workaround:
SELECT DISTINCT s.City
FROM Student s
INNER JOIN Employee e ON s.City = e.Department;
-- 24. EXCEPT/MINUS is not supported in MySQL. Equivalent workaround:
SELECT DISTINCT s.City
FROM Student s
WHERE s.City IS NOT NULL
  AND s.City NOT IN (SELECT e.Department FROM Employee e WHERE e.Department IS NOT NULL);

-- 25. Multiple operators together: arithmetic + logical + comparison + special
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount
FROM Product
WHERE Price > 500
  AND Quantity BETWEEN 1 AND 50
  AND Product_Name LIKE 'M%';
