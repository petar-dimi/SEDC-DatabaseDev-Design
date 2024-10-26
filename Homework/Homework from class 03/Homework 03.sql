-- Homework 02
USE SEDCHome;
GO

-- TAsk 1:Find all Students with FirstName = Antonio
SELECT * 
FROM dbo.Student
WHERE FirstName = 'Antonio';
GO

-- Task 2:Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * 
FROM dbo.Student
WHERE DateOfBirth > '1999-01-01';
GO

-- Task 3:Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * 
FROM dbo.Student
WHERE LastName LIKE 'J%' 
  AND EnrolledDate BETWEEN '1998-01-01' AND '1998-01-31';
GO

-- Task 4:List all Students ordered by FirstName
SELECT * 
FROM dbo.Student
ORDER BY FirstName;
GO

-- Task 5:List all Teacher Last Names and Student Last Names in single result set.
Remove duplicates
SELECT DISTINCT LastName 
FROM dbo.Teacher
UNION
SELECT DISTINCT LastName 
FROM dbo.Student;
GO

-- Task 6:Create Foreign key constraints from diagram or with script
ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Student 
    FOREIGN KEY (StudentID) REFERENCES dbo.Student(ID),
    CONSTRAINT FK_Grade_Teacher 
    FOREIGN KEY (TeacherID) REFERENCES dbo.Teacher(ID),
    CONSTRAINT FK_Grade_Course 
    FOREIGN KEY (CourseID) REFERENCES dbo.Course(ID);
GO


ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade 
    FOREIGN KEY (GradeID) REFERENCES dbo.Grade(ID),
    CONSTRAINT FK_GradeDetails_AchievementType 
    FOREIGN KEY (AchievementTypeID) REFERENCES dbo.AchievementType(ID);
GO

-- Task 7:List all possible combinations of Courses names and AchievementType
SELECT Course.Name AS CourseName, AchievementType.Name AS AchievementTypeName
FROM dbo.Course
CROSS JOIN dbo.AchievementType;
GO
 -- Task 8: List all Teachers without exam Grade
SELECT t.*
FROM dbo.Teacher t
LEFT JOIN dbo.Grade g ON t.ID = g.TeacherID
WHERE g.ID IS NULL;
GO