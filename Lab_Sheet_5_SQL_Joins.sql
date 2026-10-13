-- LAB SHEET 5: SQL JOINS
-- MySQL syntax
USE CollegeDB;

-- Create tables with matching relationship columns
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2),
    Dept_ID INT
);
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course_ID INT,
    Dept_ID INT,
    City VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    Manager_ID INT NULL,
    Dept_ID INT NULL
);

-- Sample data; INSERT IGNORE allows rerunning the file
INSERT IGNORE INTO Department VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Information Technology', 'Block B'),
(3, 'Human Resources', 'Block C'),
(4, 'Mechanical Engineering', 'Block D');

INSERT IGNORE INTO Course VALUES
(1, 'BTech AIML', '4 Years', 120000.00, 1),
(2, 'BTech CSE', '4 Years', 115000.00, 1),
(3, 'BTech IT', '4 Years', 110000.00, 2),
(4, 'BBA', '3 Years', 80000.00, 3);

INSERT IGNORE INTO Student VALUES
(1, 'Aarav Sharma', 20, 1, 1, 'Haridwar'),
(2, 'Riya Verma', 19, 2, 1, 'Meerut'),
(3, 'Arjun Gupta', 21, 1, 1, 'Noida'),
(4, 'Ananya Singh', 20, 3, 2, 'Delhi'),
(5, 'Rohan Kumar', 22, NULL, NULL, 'Roorkee');

INSERT IGNORE INTO Employee VALUES
(101, 'Vikas Singh', 'IT', 45000.00, NULL, 2),
(102, 'Neha Sharma', 'HR', 38000.00, 101, 3),
(103, 'Rahul Verma', 'Finance', 52000.00, 101, 1),
(104, 'Pooja Mehta', 'IT', 61000.00, 101, 2);

-- 1. INNER JOIN Student and Department
SELECT s.Student_ID, s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 2. Student names with department names
SELECT s.Name AS Student_Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 3. Employee names with department names
SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
INNER JOIN Department d ON e.Dept_ID = d.Dept_ID;

-- 4. Students with course details
SELECT s.Name, c.Course_Name, c.Duration, c.Fees
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- 5. Students belonging to a particular department
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- 6. LEFT OUTER JOIN
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 7. All students, including those without a matching department
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 8. RIGHT OUTER JOIN
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 9. All departments, including departments with no students
SELECT d.Dept_ID, d.Dept_Name, s.Name AS Student_Name
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID;

-- 10. Students not assigned to any department
SELECT s.Student_ID, s.Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments having no students
SELECT d.Dept_ID, d.Dept_Name
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- 12. FULL OUTER JOIN concept (MySQL workaround using LEFT JOIN + RIGHT-only rows)
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 13. CROSS JOIN Student and Course
SELECT s.Name AS Student_Name, c.Course_Name
FROM Student s
CROSS JOIN Course c;

-- 14. Number of possible Student-Course combinations
SELECT COUNT(*) AS Possible_Combinations
FROM Student
CROSS JOIN Course;

-- 15. NATURAL JOIN example (both tables share Dept_ID)
SELECT Dept_ID, Dept_Name, Course_Name
FROM Department
NATURAL JOIN Course;

-- 16. Compare NATURAL JOIN and INNER JOIN
SELECT Dept_ID, Dept_Name, Course_Name
FROM Department
NATURAL JOIN Course;
SELECT d.Dept_ID, d.Dept_Name, c.Course_Name
FROM Department d
INNER JOIN Course c ON d.Dept_ID = c.Dept_ID;

-- 17. SELF JOIN Employee to show employee-manager relationships
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 18. Employees along with their managers
SELECT e.Emp_ID, e.Emp_Name, m.Emp_Name AS Manager_Name
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 19. Join Student, Department and Course
SELECT s.Name, d.Dept_Name, c.Course_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course c ON s.Course_ID = c.Course_ID;

-- 20. Student name, course name and department name
SELECT s.Name AS Student_Name, c.Course_Name, d.Dept_Name
FROM Student s
LEFT JOIN Course c ON s.Course_ID = c.Course_ID
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 21. Employees whose salary is greater than the average salary of their department
SELECT e.Emp_Name, e.Salary, e.Dept_ID
FROM Employee e
JOIN (
    SELECT Dept_ID, AVG(Salary) AS Avg_Salary
    FROM Employee
    WHERE Dept_ID IS NOT NULL
    GROUP BY Dept_ID
) a ON e.Dept_ID = a.Dept_ID
WHERE e.Salary > a.Avg_Salary;

-- 22. Department having the maximum number of students
SELECT d.Dept_ID, d.Dept_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(Student_Count)
    FROM (
        SELECT COUNT(*) AS Student_Count
        FROM Student
        WHERE Dept_ID IS NOT NULL
        GROUP BY Dept_ID
    ) AS CountsByDept
);

-- 23. Departments and total number of students in each department
SELECT d.Dept_ID, d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- 24. Courses with the number of students enrolled in each course
SELECT c.Course_ID, c.Course_Name, COUNT(s.Student_ID) AS Enrolled_Students
FROM Course c
LEFT JOIN Student s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- 25. Report using INNER JOIN, LEFT JOIN, GROUP BY and aggregate functions
SELECT d.Dept_Name, c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students,
       AVG(s.Age) AS Average_Age
FROM Department d
LEFT JOIN Course c ON c.Dept_ID = d.Dept_ID
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID AND s.Course_ID = c.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;
