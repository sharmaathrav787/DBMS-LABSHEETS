-- LAB SHEET 2: DML COMMANDS — INSERT, UPDATE AND DELETE
-- Database: MySQL
USE CollegeDB;

-- Create/recreate working tables for repeatable practice
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
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- 1. Insert one record into Student
INSERT INTO Student VALUES (1, 'Aarav Sharma', 20, 'BTech AIML', 'Haridwar');

-- 2. Insert five student records using separate INSERT statements
INSERT INTO Student VALUES (2, 'Riya Verma', 19, 'BTech CSE', 'Meerut');
INSERT INTO Student VALUES (3, 'Arjun Gupta', 21, 'BTech AIML', 'Noida');
INSERT INTO Student VALUES (4, 'Ananya Singh', 20, 'BTech IT', 'Delhi');
INSERT INTO Student VALUES (5, 'Rohan Kumar', 22, 'BTech CSE', 'Roorkee');
INSERT INTO Student VALUES (6, 'Priya Mishra', 19, 'BTech AIML', 'Meerut');

-- 3. Insert multiple records in one statement
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES
(7, 'Aditya Jain', 21, 'BTech CSE', 'Ghaziabad'),
(8, 'Kavya Joshi', 20, 'BTech IT', 'Delhi');

-- 4. Insert Employee records
INSERT INTO Employee VALUES
(101, 'Vikas Singh', 'IT', 45000.00),
(102, 'Neha Sharma', 'HR', 38000.00),
(103, 'Rahul Verma', 'Finance', 52000.00);

-- 5. Insert Department records
INSERT INTO Department VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Information Technology', 'Block B'),
(3, 'Human Resources', 'Block C');

-- 6. Insert Product records
INSERT INTO Product VALUES
(1, 'Keyboard', 799.00, 25),
(2, 'Mouse', 499.00, 40),
(3, 'Monitor', 8500.00, 0);

-- 7. Insert Customer records
INSERT INTO Customer VALUES
(1, 'Aman Gupta', 'aman@example.com', '9876500001'),
(2, 'Sneha Rawat', 'sneha@example.com', '9876500002');

-- 8. Insert Course records
INSERT INTO Course VALUES
(1, 'BTech AIML', '4 Years', 120000.00),
(2, 'BTech CSE', '4 Years', 115000.00),
(3, 'BTech IT', '4 Years', 110000.00);

-- 9. Insert a student record with values for all columns
INSERT INTO Student VALUES (9, 'Simran Kaur', 20, 'BTech CSE', 'Dehradun');

-- 10. Insert by specifying selected columns
INSERT INTO Student (Student_ID, Name, Course) VALUES (10, 'Mohit Kumar', 'BTech AIML');

-- 11. Update the city of a particular student
UPDATE Student SET City = 'Delhi' WHERE Student_ID = 2;

-- 12. Update salary of a particular employee
UPDATE Employee SET Salary = 48000.00 WHERE Emp_ID = 101;

-- 13. Increase salary of all employees by 10%
UPDATE Employee SET Salary = Salary * 1.10;

-- 14. Increase price of all products by 5%
UPDATE Product SET Price = Price * 1.05;

-- 15. Change course of a particular student
UPDATE Student SET Course = 'BTech Data Science' WHERE Student_ID = 3;

-- 16. Update department of an employee
UPDATE Employee SET Department = 'IT' WHERE Emp_ID = 102;

-- 17. Update city of all students from Meerut to Delhi
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update fees of a particular course
UPDATE Course SET Fees = 125000.00 WHERE Course_ID = 1;

-- 19. Update multiple columns of a student simultaneously
UPDATE Student
SET Age = 21, City = 'Haridwar'
WHERE Student_ID = 4;

-- 20. Delete a particular student using Student_ID
DELETE FROM Student WHERE Student_ID = 10;

-- 21. Delete all students belonging to a particular city
DELETE FROM Student WHERE City = 'Roorkee';

-- 22. Delete employees whose salary is below a specified amount
DELETE FROM Employee WHERE Salary < 40000.00;

-- 23. Delete products whose quantity is zero
DELETE FROM Product WHERE Quantity = 0;

-- 24. Delete records using multiple conditions (AND/OR)
DELETE FROM Student
WHERE (City = 'Noida' AND Age > 20) OR Course = 'BTech Data Science';

-- 25. Display the Student table after the operations
SELECT * FROM Student;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Course;
