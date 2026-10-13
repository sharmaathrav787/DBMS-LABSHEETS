-- LAB SHEET 1: DDL COMMANDS — CREATE, ALTER AND DROP
-- Database: MySQL
-- Run statements in order. Some later tasks intentionally rename/drop tables or columns;
-- comments explain where table names change.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- 1. Create a Student table
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT,
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- 2. Create an Employee table
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- 3. Create a Department table
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

-- 4. Create a Product table
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

-- 5. Create a Customer table
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20)
);

-- 6. Create a Course table
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- 7. Create a Faculty table
CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- 8. Create a Library table
CREATE TABLE IF NOT EXISTS Library (
    Book_ID INT,
    Book_Name VARCHAR(150),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 9. Department with Primary Key (separate example table)
CREATE TABLE IF NOT EXISTS Department_PK (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

-- 10. Student with Primary Key and NOT NULL
CREATE TABLE IF NOT EXISTS Student_Constraints (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- 11. Employee with UNIQUE Email
CREATE TABLE IF NOT EXISTS Employee_Email (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    Email VARCHAR(150) UNIQUE
);

-- 12. Product with CHECK constraint (MySQL 8.0.16+ enforces CHECK)
CREATE TABLE IF NOT EXISTS Product_Check (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

-- 13. Add Email column to Student
ALTER TABLE Student ADD COLUMN Email VARCHAR(150);

-- 14. Add Phone column to Student
ALTER TABLE Student ADD COLUMN Phone VARCHAR(20);

-- 15. Modify datatype/size of Name
ALTER TABLE Student MODIFY COLUMN Name VARCHAR(150);

-- 16. Rename Student table to Student_Details
RENAME TABLE Student TO Student_Details;

-- 17. Rename City column to Address
ALTER TABLE Student_Details RENAME COLUMN City TO Address;

-- 18. Add Salary column to Employee
ALTER TABLE Employee ADD COLUMN Salary_Bonus DECIMAL(10,2);

-- 19. Drop Phone column from Student_Details
ALTER TABLE Student_Details DROP COLUMN Phone;

-- 20. Drop Email column from Student_Details
ALTER TABLE Student_Details DROP COLUMN Email;

-- 21. Remove all records using TRUNCATE (example table)
TRUNCATE TABLE Student_Details;

-- 22. Drop Course table
DROP TABLE IF EXISTS Course;

-- 23. Drop Customer table
DROP TABLE IF EXISTS Customer;

-- 24. Complete Student table with Primary Key, NOT NULL, UNIQUE and CHECK
CREATE TABLE IF NOT EXISTS Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Age INT CHECK (Age >= 16),
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- 25. Demonstrate suitable ALTER and DROP operations
ALTER TABLE Student_Complete ADD COLUMN Phone VARCHAR(20);
ALTER TABLE Student_Complete MODIFY COLUMN Name VARCHAR(150) NOT NULL;
ALTER TABLE Student_Complete DROP COLUMN Phone;

-- Verify remaining tables
SHOW TABLES;
