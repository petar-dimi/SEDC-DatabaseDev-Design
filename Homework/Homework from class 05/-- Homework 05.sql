-- Homework 05
USE SEDCHome;
GO

-- Task 1 and 2. Declare scalar variable for storing FirstName values and assign value ‘Antonio’
DECLARE @FirstName NVARCHAR(50);
SET @FirstName = 'Antonio';

-- Task 3. Find all Students having FirstName same as the variable
SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName;

-- Task 4. Declare a table variable that will contain StudentId, StudentName, and DateOfBirth
DECLARE @FemaleStudents TABLE (
    StudentId INT,
    StudentName NVARCHAR(250),
    DateOfBirth DATE
);

-- Task 5 Fill the table variable with all Female students
INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName + ' ' + LastName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'Female';


SELECT * FROM @FemaleStudents;


IF OBJECT_ID('tempdb..#MaleStudents') IS NOT NULL
    DROP TABLE #MaleStudents;

-- Task 6 Create a temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #MaleStudents (
    LastName NVARCHAR(150),
    EnrolledDate DATE
);

-- Task 7 Fill the temp table with all Male students having First Name starting with ‘A’
INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'Male' AND FirstName LIKE 'A%';

-- Optional: Select to verify contents of the temp table
SELECT * FROM #MaleStudents;

--  Task 8. Retrieve the students from the table whose last name has 7 characters
SELECT *
FROM dbo.Student
WHERE LEN(LastName) = 7;

--Task 9 and 10. Find all teachers whose FirstName length is less than 5, and the first 3 characters of their FirstName and LastName are the same
SELECT *
FROM dbo.Teacher
WHERE LEN(FirstName) < 5 
  AND LEFT(FirstName, 3) = LEFT(LastName, 3);
