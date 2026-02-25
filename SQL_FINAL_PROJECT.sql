create database UCMS;
USE UCMS;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    EmailAddress VARCHAR(100),
    DOB DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    credits INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorsID INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    EmailAddress VARCHAR(100),
    DepartmentID INT,
    MonthlySalary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Business Administration'),
(4, 'Mathematics');



INSERT INTO Students VALUES
(1, 'Jayal', 'Gorajiya', 'jayal@email.com', '2000-01-15', '2022-08-01'),
(2, 'vishal', 'yadav', 'yadav@email.com', '1999-04-15', '2021-09-01'),
(3, 'Henet', 'Patel', 'henet@email.com', '2002-03-20', '2023-07-10'),
(4, 'Veeraj', 'Prajapati', 'veeraj@email.com', '2001-06-10', '2022-07-15'),
(5, 'Neel', 'Shah', 'neel@email.com', '2003-11-05', '2024-01-10'),
(6, 'Karan', 'Yadav', 'karan@email.com', '2000-09-18', '2021-06-12');


INSERT INTO Courses VALUES
(101, 'Database Management', 4, 1),
(102, 'Operating Systems', 3, 1),
(103, 'Thermodynamics', 4, 2),
(104, 'Marketing Principles', 3, 3),
(105, 'Linear Algebra', 4, 4);


INSERT INTO Instructors VALUES
(1, 'Ajay', 'Patel', 'ajay@email.com', 1, 90000),
(2, 'Shivam', 'Shah', 'shivam@email.com', 2, 85000),
(3, 'Rakesh', 'Mehta', 'rakesh@email.com', 3, 80000),
(4, 'Anita', 'Desai', 'anita@email.com', 4, 95000);


INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 1, 102, '2022-08-05'),
(3, 2, 103, '2021-09-10'),
(4, 3, 101, '2023-07-12'),
(5, 4, 104, '2022-07-20'),
(6, 5, 105, '2024-01-15'),
(7, 6, 101, '2021-06-15'),
(8, 2, 104, '2021-09-12');

-- crud operation on departments table --
-- CREATE --
INSERT INTO Departments VALUES (5, 'Civil Engineering');

-- READ
SELECT * FROM Departments;

-- UPDATE --
UPDATE Departments 
SET DepartmentName = 'Civil Engg'
WHERE DepartmentID = 5;

-- DELETE--
DELETE FROM Departments 
WHERE DepartmentID = 5;

-- CRUD OPERATION ON STUDENTS TABLE --
-- CREATE
INSERT INTO Students VALUES 
(7, 'Rohan', 'Patel', 'rohan@email.com', '2002-02-10', '2024-08-01');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students 
SET EmailAddress = 'rohan123@email.com'
WHERE StudentID = 7;

-- DELETE
DELETE FROM Students 
WHERE StudentID = 7;

-- CRUD OPERATION IN COURSES TABLE --
-- CREATE
INSERT INTO Courses VALUES 
(106, 'Structural Analysis', 4, 2);

-- READ
SELECT * FROM Courses;

-- UPDATE
UPDATE Courses 
SET credits = 5
WHERE CourseID = 106;

-- DELETE
DELETE FROM Courses 
WHERE CourseID = 106;

-- CRUD OPERATION ON INSTUCTORS --
-- CREATE
INSERT INTO Instructors VALUES 
(5, 'Manish', 'Kumar', 'manish@email.com', 1, 88000);

-- READ
SELECT * FROM Instructors;

-- UPDATE
UPDATE Instructors 
SET MonthlySalary = 92000
WHERE InstructorsID = 5;

-- DELETE
DELETE FROM Instructors 
WHERE InstructorsID = 5;

-- CRUD OPERATION ON ENROLLMENTS TABLE --
-- CREATE
INSERT INTO Enrollments VALUES 
(9, 1, 101, '2024-08-05');

-- READ
SELECT * FROM Enrollments;

-- UPDATE
UPDATE Enrollments 
SET EnrollmentDate = '2024-08-10'
WHERE EnrollmentID = 9;

-- DELETE
DELETE FROM Enrollments 
WHERE EnrollmentID = 9;

-- STUDENTS ENROLLED AFTER 2022 --

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-01-01';

-- COURSE OFFERED BY MATHEMATICAL DEPARTMENTS --
SELECT c.*
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

--  NUMBER OF STUDENT PER COURSE --
SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;

SELECT s.StudentID, s.FName
FROM Students s
JOIN Enrollments e1 
  ON s.StudentID = e1.StudentID AND e1.CourseID = 101
JOIN Enrollments e2 
  ON s.StudentID = e2.StudentID AND e2.CourseID = 102;
  
  
  -- STUDENT ENROLLED IN SQL OR DATASTRUCTURE --
  SELECT DISTINCT s.StudentID, s.FName
FROM Students s
JOIN Enrollments e 
  ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101,102);

-- AVERAGE CREIDITS OF ALL COURSES --
SELECT AVG(credits) AS AverageCredits
FROM Courses;

-- MAXIMUM SALARY IN COMPUTER SCIENCE DEPARTMENT --
SELECT MAX(i.MonthlySalary) AS MaxSalary
FROM Instructors i
JOIN Departments d 
  ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- COUNT STUDENTS IN EACH DEPARTMENTS --
SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- INNER JOIN - STUDENTS AND THEIR COURSES --
SELECT d.DepartmentName, COUNT(e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- LEFT JOIN - ALL STUDENTS AND THEIR COURSES --
SELECT s.FName, s.LName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e 
  ON s.StudentID = e.StudentID
LEFT JOIN Courses c 
  ON e.CourseID = c.CourseID;
  
-- STUDENT IN COURSES WITH MORE THAN 10 STUDENTS -- 
SELECT *
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

--  EXTRACT YEAR FROM ENROLLMNTDATE--
SELECT StudentID, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- CONCATENATE INSTRUCTOR NAME-- 
SELECT CONCAT(FName, ' ', LName) AS FullName
FROM Instructors;

-- RUNNING TOTAL OF STUDENTS PER COURSE --
SELECT CourseID,
       COUNT(StudentID) AS TotalStudents,
       SUM(COUNT(StudentID)) OVER (ORDER BY CourseID) AS RunningTotal
FROM Enrollments
GROUP BY CourseID;

-- LABEL STUDENT AS SENIOR OR JUNIOR --
SELECT StudentID, FName,
CASE 
    WHEN EnrollmentDate <= DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
    THEN 'Senior'
    ELSE 'Junior'
END AS StudentLevel
FROM Students;
  
  






