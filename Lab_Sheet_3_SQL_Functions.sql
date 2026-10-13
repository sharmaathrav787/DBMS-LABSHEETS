-- LAB SHEET 3: SQL FUNCTIONS
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
    Salary DECIMAL(10,2),
    Joining_Date DATE
);

-- Sample data (INSERT IGNORE avoids duplicate-key errors when rerun)
INSERT IGNORE INTO Student VALUES
(1, 'Aarav Sharma', 20, 'BTech AIML', 'Haridwar'),
(2, 'Riya Verma', 19, 'BTech CSE', 'Meerut'),
(3, 'Arjun Gupta', 21, 'BTech AIML', 'Noida');
INSERT IGNORE INTO Employee VALUES
(101, 'Vikas Singh', 'IT', 45500.75, '2023-01-15'),
(102, 'Neha Sharma', 'HR', 38200.40, '2022-07-10'),
(103, 'Rahul Verma', 'Finance', 52750.90, '2021-03-22');

-- A. Number Functions
-- 1. ABS()
SELECT ABS(-25) AS Absolute_Value;
-- 2. ROUND()
SELECT ROUND(123.4567, 2) AS Rounded_Value;
-- 3. CEIL() and FLOOR()
SELECT CEIL(12.3) AS Ceiling_Value, FLOOR(12.9) AS Floor_Value;
-- 4. MOD()
SELECT MOD(17, 5) AS Remainder;
-- 5. Rounded employee salaries
SELECT Emp_Name, Salary, ROUND(Salary) AS Rounded_Salary FROM Employee;

-- B. Aggregate Functions
-- 6. COUNT()
SELECT COUNT(*) AS Total_Students FROM Student;
-- 7. SUM()
SELECT SUM(Salary) AS Total_Salary FROM Employee;
-- 8. AVG()
SELECT AVG(Salary) AS Average_Salary FROM Employee;
-- 9. MAX()
SELECT MAX(Salary) AS Highest_Salary FROM Employee;
-- 10. MIN()
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;

-- C. Character Functions
-- 11. UPPER()
SELECT Name, UPPER(Name) AS Uppercase_Name FROM Student;
-- 12. LOWER()
SELECT Name, LOWER(Name) AS Lowercase_Name FROM Student;
-- 13. LENGTH()
SELECT Name, LENGTH(Name) AS Name_Length_Bytes FROM Student;
-- 14. CONCAT()
SELECT CONCAT('Aarav', ' ', 'Sharma') AS Full_Name;
-- 15. SUBSTRING()/SUBSTR()
SELECT Name, SUBSTRING(Name, 1, 5) AS Name_Part FROM Student;
SELECT SUBSTR('DATABASE', 1, 4) AS Substring_Example;

-- D. Conversion Functions
-- 16. Convert number to string
SELECT CAST(12345 AS CHAR) AS Number_As_String;
-- 17. Convert string to number
SELECT CAST('123.45' AS DECIMAL(10,2)) AS String_As_Number;
-- 18. Convert date to a different format
SELECT DATE_FORMAT('2026-10-12', '%d-%m-%Y') AS Formatted_Date;
-- 19. CAST()
SELECT CAST('2026-10-12' AS DATE) AS Cast_Date;
-- 20. CONVERT()
SELECT CONVERT('456', UNSIGNED) AS Converted_Number;

-- E. Date Functions
-- 21. Current date
SELECT CURDATE() AS Current_Date;
-- 22. Extract year, month and day
SELECT YEAR('2026-10-12') AS Year_Value,
       MONTH('2026-10-12') AS Month_Value,
       DAY('2026-10-12') AS Day_Value;
-- 23. Difference between two dates (days)
SELECT DATEDIFF('2026-10-12', '2026-01-01') AS Difference_In_Days;
-- 24. Add specified days to a date
SELECT DATE_ADD('2026-10-12', INTERVAL 10 DAY) AS Date_After_10_Days;
-- 25. Display employee joining dates in required format
SELECT Emp_Name, Joining_Date,
       DATE_FORMAT(Joining_Date, '%d/%m/%Y') AS Formatted_Joining_Date
FROM Employee;
