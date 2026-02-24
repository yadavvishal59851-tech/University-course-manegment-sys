# 🎓 UCMS - University Course Management System

## 📌 Project Overview

UCMS (University Course Management System) is a relational database
project built using MySQL.\
It demonstrates database creation, table relationships, CRUD operations,
joins, subqueries, aggregate functions, and window functions.

------------------------------------------------------------------------

## 🗄️ Database Name

**UCMS**

------------------------------------------------------------------------

## 🏗️ Database Structure

### 1️⃣ Departments

| Column Name \| Data Type \| Description \|

\|-------------\|----------\|-------------\| DepartmentID \| INT (PK) \|
Unique department ID \| \| DepartmentName \| VARCHAR(100) \| Name of the
department \|

### 2️⃣ Students

| Column Name \| Data Type \| Description \|

\|-------------\|----------\|-------------\| StudentID \| INT (PK) \|
Unique student ID \| \| FName \| VARCHAR(50) \| First name \| \| LName
\| VARCHAR(50) \| Last name \| \| EmailAddress \| VARCHAR(100) \|
Student email \| \| DOB \| DATE \| Date of birth \| \| EnrollmentDate \|
DATE \| Admission date \|

### 3️⃣ Courses

| Column Name \| Data Type \| Description \|

\|-------------\|----------\|-------------\| CourseID \| INT (PK) \|
Unique course ID \| \| CourseName \| VARCHAR(100) \| Course title \| \|
Credits \| INT \| Credit value \| \| DepartmentID \| INT (FK) \|
References Departments \|

### 4️⃣ Instructors

| Column Name \| Data Type \| Description \|

\|-------------\|----------\|-------------\| InstructorsID \| INT (PK)
\| Unique instructor ID \| \| FName \| VARCHAR(50) \| First name \| \|
LName \| VARCHAR(50) \| Last name \| \| EmailAddress \| VARCHAR(100) \|
Instructor email \| \| DepartmentID \| INT (FK) \| References
Departments \| \| MonthlySalary \| DECIMAL(10,2) \| Salary amount \|

### 5️⃣ Enrollments

| Column Name \| Data Type \| Description \|

\|-------------\|----------\|-------------\| EnrollmentID \| INT (PK) \|
Unique enrollment ID \| \| StudentID \| INT (FK) \| References Students
\| \| CourseID \| INT (FK) \| References Courses \| \| EnrollmentDate \|
DATE \| Enrollment date \|

------------------------------------------------------------------------

## 🔗 Relationships

-   One Department → Many Courses\
-   One Department → Many Instructors\
-   One Student → Many Enrollments\
-   One Course → Many Enrollments

------------------------------------------------------------------------

## 🔄 CRUD Operations Implemented

✔ Create Records\
✔ Read Records\
✔ Update Records\
✔ Delete Records

Performed on: - Departments - Students - Courses - Instructors -
Enrollments

------------------------------------------------------------------------

## 📊 Advanced SQL Queries Included

-   Students enrolled after 2022
-   Courses offered by Mathematics department
-   Count students per course
-   Students enrolled in multiple courses
-   Average course credits
-   Maximum salary in Computer Science department
-   Count students per department
-   INNER JOIN & LEFT JOIN examples
-   Subqueries (Nested & IN clause)
-   Aggregate Functions (COUNT, AVG, MAX)
-   Window Function (Running Total)
-   CASE statement (Senior/Junior classification)
-   Date functions (YEAR extraction)

------------------------------------------------------------------------

## 🧠 SQL Concepts Covered

-   Primary Key & Foreign Key
-   Constraints
-   JOINs (INNER, LEFT)
-   GROUP BY & HAVING
-   Subqueries
-   Window Functions
-   Aggregate Functions
-   CASE Statements
-   Date Functions
-   CRUD Operations

------------------------------------------------------------------------

## 🚀 How to Run

1.  Open MySQL Workbench (or any SQL tool).
2.  Execute the CREATE DATABASE statement.
3.  Run all CREATE TABLE statements.
4.  Insert data using INSERT statements.
5.  Execute CRUD and analytical queries.

------------------------------------------------------------------------

## 🎯 Learning Outcome

This project strengthens understanding of: - Relational database
design - Data integrity using constraints - Writing efficient SQL
queries - Performing real-world data analysis operations

------------------------------------------------------------------------

## 👨‍💻 Author

Vishal Yadav\
Aspiring Data Science Engineer 🚀

------------------------------------------------------------------------

⭐ This project is a strong foundation for mastering SQL for Data
Analytics & Data Science.
