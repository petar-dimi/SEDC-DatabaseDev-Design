-- Homework 04
USE SEDCHome;
GO

--  Task 1: Calculate the count of all grades per Teacher in the system
SELECT TeacherID, COUNT(*) AS GradeCount
FROM dbo.Grade
GROUP BY TeacherID;
GO

-- Task 2. Calculate the count of all grades per Teacher in the system for the first 100 Students (ID < 100)
SELECT TeacherID, COUNT(*) AS GradeCount
FROM dbo.Grade
WHERE StudentID < 100
GROUP BY TeacherID;
GO

-- Task 3. Find the Maximal Grade and the Average Grade per Student on all grades in the system
SELECT StudentID,
       MAX(Grade) AS MaxGrade,
       AVG(Grade * 1.0) AS AverageGrade
FROM dbo.Grade
GROUP BY StudentID;
GO

-- Task  4. Calculate the count of all grades per Teacher in the system and filter only grade count greater than 200
SELECT TeacherID, COUNT(*) AS GradeCount
FROM dbo.Grade
GROUP BY TeacherID
HAVING COUNT(*) > 200;
GO

-- Task 5. Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system, filtering only records where Maximal Grade equals Average Grade
SELECT StudentID,
       COUNT(*) AS GradeCount,
       MAX(Grade) AS MaxGrade,
       AVG(Grade * 1.0) AS AverageGrade
FROM dbo.Grade
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade * 1.0);
GO

-- Task 6. List Student First Name and Last Name next to the other details from the previous query
SELECT s.FirstName, 
       s.LastName,
       g.StudentID,
       COUNT(*) AS GradeCount,
       MAX(g.Grade) AS MaxGrade,
       AVG(g.Grade * 1.0) AS AverageGrade
FROM dbo.Grade g
JOIN dbo.Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade * 1.0);
GO

-- Task 7. Create a new view (vv_StudentGrades) that will list all StudentIDs and count of Grades per student
CREATE VIEW vv_StudentGrades AS
SELECT StudentID, COUNT(*) AS GradeCount
FROM dbo.Grade
GROUP BY StudentID;
GO

-- Task 8. Modify the view to show Student First and Last Names instead of StudentID
-- Task 8.1: First, drop the view if it exists, then recreate with the updated query
DROP VIEW IF EXISTS vv_StudentGrades;
GO

CREATE VIEW vv_StudentGrades AS
SELECT s.FirstName, 
       s.LastName,
       COUNT(g.ID) AS GradeCount
FROM dbo.Grade g
JOIN dbo.Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName;
GO

-- Task 9. List all rows from the view ordered by the biggest Grade Count
SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC;
GO
